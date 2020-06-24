# GeometricBrownianMotion
Uses Geometric Brownian Motion to predict the lowest and highest possible values of a stock across 1000 days

Can be run using Rscript, littler, or Rstudio. Requires a CSV of stock prices, which can be found at [Yahoo](https://finance.yahoo.com) and across the web

To use Rscript or littler, simply supply the CSV file as an argument in the command line. You may need to update the first line with your specific path
EX: Rsciprt --vanilla gmb.R $STOCK_DATA.csv

To use in Rstudio, simply add your CSV to the environment and set it as an argument.
