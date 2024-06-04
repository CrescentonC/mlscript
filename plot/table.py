import csv
import sys
with open(sys.argv[1], newline='') as timefile:
  with open(sys.argv[2], newline='') as sizefile:
    time = list(csv.reader(timefile, delimiter=',', quotechar='|'))[1:]
    sizeMessyOrder = list(csv.reader(sizefile, delimiter=',', quotechar='|'))[1:]
    size = [j for i in [sizeMessyOrder[n : n + 4] for n in range(0, len(sizeMessyOrder), 4)] for j in [i[3], i[2], i[0], i[1]]]
    # print(time)
    # print(size)
    zipped = list(zip(time, size))
    zippedGrouped = [zipped[n : n + 4] for n in range(0, len(zipped), 4)]
    # print(len(zippedGrouped))
    print(", ".join([
      "name",
      "original time",
      "optimized time",
      "original size (byte)",
      "optimized size (byte)",
      "original minor",
      "optimized minor",
      "original major",
      "optimized major",
      "original promo",
      "optimized promo",
    ]))
    for i in zippedGrouped:
      original = i[0]
      lh = i[3]
      # print(original)
      # print(lh)
      print(original[1][0], end=", ")
      print(", ".join([
        original[0][1]+original[0][2],   # original time
        lh[0][1]+lh[0][2],               # optimized time
        original[1][2],                  # original size (byte)
        lh[1][2],                        # optimized size (byte)
        original[0][5],                  # original minor
        lh[0][5],                        # optimized minor
        original[0][6],                  # original major
        lh[0][6],                        # optimized major
        original[0][7],                  # original promo
        lh[0][7],                        # optimized promo
      ]))
      

      # print(i[0])
      # print(i[1])
      # print(i[2])
      # print(i[3])
      

    # for row in timefile:
    #   print(', '.join(row))
    # for row in sizefile:
    #   print(', '.join(row))