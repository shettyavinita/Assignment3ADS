library("forecast")
file <- "C:/Users/vanwu/Desktop/INFO 7390 ADS/Assignment3/Single Site Data- SCH - Josiah Quincy with time.csv"
school <- read.csv(file, header = TRUE)
View(school)
tsdata <- school["kWh"]

##Modeling use first 10 month data.
tsdata1 <- head(tsdata, 7920)
tsdata2 <- tail(school, 840)
tsdata1 <- as.numeric(tsdata1$kWh)
View(tsdata2)
taylor <- msts(tsdata1, seasonal.periods=c(24,168))
View(taylor)
taylor.fit <- tbats(taylor)
plot(forecast(taylor.fit))

rmse()
##FORECAST THE rest of the data. 

forr <- forecast(taylor.fit,h=840)
output <- data.frame(time = tsdata2$Time, forecast = forr$mean)
write.csv(output, file = "C:/Users/vanwu/Desktop/INFO 7390 ADS/Assignment3/multi-seasonality ts model output.csv", sep=",")
plot(forr)
