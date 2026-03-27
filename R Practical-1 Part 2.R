# Problem 1
x <- 1:200

selNum <- x[x%%3 == 0 | x%%7 == 0]
selNum


selNum1 <- x[x%%3 == 0 & x%%7 == 0]
selNum1


x <- c(10, 20, NA, 30, NA, 40)

# Problem 2
Sum <- sum(x, na.rm = TRUE)
Sum

x1 <- replace(x, c(3, 5), mean(x, na.rm = TRUE))
x1