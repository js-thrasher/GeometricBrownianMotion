#!/usr/bin/env Rscript

args = commandArgs(trailingOnly = TRUE)


if (length(args) == 0) {
  stop("ERROR: Must Supply one CSV", call.=FALSE)
}

if (length(args) > 1) {
  stop("ERROR: Too Many Arguments", call.=FALSE)
}

stockdata = read.csv(args[1L])
stockdata=stockdata[complete.cases(stockdata),]

closingPrices = stockdata$Close
delta = -diff(closingPrices)/closingPrices[-1]
mu = mean(delta)
sigma = sd(delta)

x=1:1000
y = c()
y[1] = stockdata$Open[1]

globalMax = y[1]
globalMin = y[1]

for (i in 1:100) {
  for (j in 2:1000) {
    y[j] = y[j-1]*(1+rnorm(1, mu, sigma))
    if (y[j] > globalMax) {
      globalMax = y[j]
    }
    if (y[j] < globalMin) {
      globalMin = y[j]
    }
  }
  plot(x, y, type = 'l', main=paste("Stock price simulation with mean =", round(mu,6),
                                    "and standard dev ", round(sigma, 4)),
                                    xlab="Days",ylab="Price")
}

sprintf("Global max is %.2f", globalMax)
sprintf("Global min is %.2f", globalMin)

Sys.sleep(1000)

