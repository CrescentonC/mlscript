#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly=TRUE)


library(RColorBrewer)
library(ggplot2)
library(gridExtra)

data <- read.csv(args[1])
# data <- read.csv("2_size_res.txt")

datas <- split(data, rep(1:(nrow(data) %/% 4 + 1), each = 4, length.out = nrow(data)))

plotf <- function (d) {
  whichone <- d$which_one
  d$ordered_which <- factor(whichone, levels = c(whichone[4], whichone[3], whichone[1], whichone[2]))
  ggplot(data = d, aes(x=ordered_which, y=object_file_size, fill=ordered_which)) +
    geom_bar(stat="identity", alpha=0.9) +
    scale_fill_brewer(palette="Set2") +
    theme(legend.position="none") +
    ggtitle(substring(d$test_name, 0, nchar(d$test_name) - 3)) +
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
    )
}

plots <- lapply(datas, plotf)
pdf("size.pdf", width = 10, height = 2.5)
grid.arrange(grobs = plots, ncol = 19, nrow = 2)
dev.off()


#======= compute average size growth

f <- function (f) { function (d) {
  sizes <- d$object_file_size
  ratio <- sizes[2] / sizes[4]
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
# sprintf(
#   "average (after float out / original) over %d tests (without `fish`):",
#   mean({
#     tmp <- unlist(lapply(datas, f(function (ratio) { ratio < 100 })))
#     tmp[!is.na(tmp)]
#   })
# )
factorThreshold <- 2
sprintf(
  "percentage of the tests whose code size does not grow by a factor of %f: %f",
  factorThreshold,
  {
    tmp <- unlist(lapply(datas, f(function (ratio) { ratio < factorThreshold })))
    length(tmp[!is.na(tmp)]) / length(tmp)
  }
)

sprintf(
  "the median: %f",
  median(sort(unlist(lapply(datas, f(function (dummy) {TRUE})))))
)
print("numbers to names:")
print(unlist(lapply(datas, function (d) {
  names <- d$test_name
  names[1]
})))
print("all numbers sorted:")
print(sort(unlist(lapply(datas, f(function (dummy) {TRUE})))))