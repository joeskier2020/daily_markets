# Download Treasury Yield Curve

yc1 <- read.csv("https://home.treasury.gov/resource-center/data-chart-center/interest-rates/daily-treasury-rates.csv/all/202205?type=daily_treasury_yield_curve&field_tdr_date_value_month=202204&page&_format=csv",header=TRUE)
yc2 <- read.csv("https://home.treasury.gov/resource-center/data-chart-center/interest-rates/daily-treasury-rates.csv/all/202204?type=daily_treasury_yield_curve&field_tdr_date_value_month=202203&page&_format=csv",header=TRUE)
yc <- rbind(yc1, yc2) 

leg <- c(yc[1,1],yc[2,1],tail(yc[10,1],n=1))

plot(t(yc[1,2:13]),main="Treasury Yield Curve", ylab="Yield %", xlab="Time Until Maturity", type = "l", col= "red")
axis(1,at=seq(1,12,1), labels = colnames(yc))
lines(t(yc[2,2:13]), col="green")
lines(t(yc[10,2:13]), col="blue")
legend("bottomright",leg, lty=1, col=c("red","green","blue"))

library(quantmod)
getSymbols("^VIX")
plot(Cl(VIX["2019/2022"]), main="VIX")

plot(Cl(VIX["2007/2022"]), main="VIX")


getSymbols("QQQ")
drqqq <- dailyReturn(QQQ)
plot(drqqq["2020/2022"])
lines(SMA(drqqq,n=25),col="red")


getSymbols("SPY")
drspy <- dailyReturn(SPY)
plot(drspy["2020/2022"])
lines(SMA(drspy,n=100),col="red")


getSymbols("SPY")
wrspy <- weeklyReturn(SPY)
plot(wrspy["2006/2022"])
lines(SMA(wrspy,n=10),col="red")
