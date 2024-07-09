#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly=TRUE)


# Load ggplot2
library(RColorBrewer)
library(ggplot2)
library(gridExtra)

data <- read.csv(args[1])
if(nrow(data) != 38 * 4)
  stop(c("Corrupted output from ./bench.sh. There should be 38 * 4 = 152 entries in total but now there is only ", nrow(data), " entries."))

# print(data)

datas <- split(data, rep(1:(nrow(data) %/% 4 + 1), each = 4, length.out = nrow(data)))

# print(datas)

plotf <- function (d) {
  names <- d$test_name
  d$ordered_name <- factor(names, levels = c(names[1], names[2], names[3], names[4]))
  ggplot(data = d, aes(x=ordered_name, y=run_time, fill=ordered_name)) +
    geom_bar(stat="identity", alpha=0.9) +
    scale_fill_brewer(palette="Set2") +
    theme(legend.position="none") +
    ggtitle(substring(names[3], 7, nchar(names[3]) - 3)) +
    theme(
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      # axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1),
      axis.text.x = element_blank(),
      axis.text.y = element_blank(),
      axis.ticks.x = element_blank(),
      axis.ticks.y = element_blank(),
      plot.title = element_text(vjust = -3, size = 6.5),
      plot.margin=unit(c(0,0,0,0), "pt")
    ) +
    geom_errorbar(aes(
      x=ordered_name,
      ymin=run_time*((100+n95ci)/100),
      ymax=run_time*((100+p95ci)/100),
      width=0.3,
      alpha=0.3,
    ))
}

plots <- lapply(datas, plotf)
pdf("time.pdf", width = 10, height = 2.5)
grid.arrange(grobs = plots, ncol = 19, nrow = 2)
# plots
dev.off()

# #======= compute average time change

f <- function (f) { function (d) {
  runtimes <- d$run_time
  ratio <- runtimes[4] / runtimes[1]
  if (f(ratio)) { ratio } else { NaN }
} }
sprintf(
  "geometric mean (after float out / original) over %d tests: %f",
  length(datas),
  exp(mean(log({
    tmp <- unlist(lapply(datas, f(function (ratio) { TRUE })))
    tmp[!is.na(tmp)]
  })))
)
sprintf(
  "there are %d significantly improved tests (ratio < 0.95): %f",
  {
    tmp <- unlist(lapply(datas, f(function (ratio) { ratio < 0.95 })))
    length(tmp[!is.na(tmp)])
  },
  exp(mean(log({
    tmp <- unlist(lapply(datas, f(function (ratio) { ratio < 0.95 })))
    tmp[!is.na(tmp)]
  })))
)
sprintf(
  "there are %d visibly worsened tests (ratio > 1.01): %f",
  {
    tmp <- unlist(lapply(datas, f(function (ratio) { ratio > 1.01 })))
    length(tmp[!is.na(tmp)])
  },
  exp(mean(log({
    tmp <- unlist(lapply(datas, f(function (ratio) { ratio > 1.01 })))
    tmp[!is.na(tmp)]
  })))
)


sprintf(
  "the median: %f",
  median(sort(unlist(lapply(datas, f(function (dummy) {TRUE})))))
)

print("numbers to names:")
print(unlist(lapply(datas, function (d) {
  names <- d$test_name
  substring(names[3], 7, nchar(names[3]) - 3)
})))

print("all numbers sorted:")
print((sort(unlist(lapply(datas, f(function (dummy) {TRUE}))))))
