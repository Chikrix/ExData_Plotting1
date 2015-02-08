# My Exploratory data Analysis project 1 and How I did it

HD = read.table("household_power_consumption.txt",header=T,sep=";",nrows=2075260)
names(HD)

names(HD) <- gsub("_",".",names(HD))
names(HD)

HD$Date = as.Date(HD$Date,"%d/%m/%Y")
head(HD$Date,100)
tail(HD$Date,100)

Ddays <- HD[c(which(HD$Date == "2007-02-01"),which(HD$Date == "2007-02-02")),]
Ddays$Date[nrow(Ddays)] - Ddays$Date[1] # There should be just one day difference which this test shows
rownames(Ddays) = NULL # Here I removed the rownames to make it count orderly from 1 to its end
rownames(Ddays)

sapply(Ddays,function(a) table(is.na(Ddays))) # Here I looked for missing values "NA"

# This is my first png plot which I called plot1.png
png("plot1.png",width=480,height=480)
hist(as.double(as.vector(Ddays$Global.active.power)),xlab="Global Active Power(Kilowatts)",
     main="Global Active Power",col="red")
dev.off()

# Now my second plot - plot2.png
Ddays$Date = as.character.Date(Ddays$Date,"%a %b %Y")
head(Ddays,100)
Ddays$DaTm <- as.POSIXct(paste(Ddays$Date,Ddays$Time))
png("plot2.png",width=480,height=480)
with(Ddays,plot(DaTm,as.vector(Global.active.power),type="l",ylab="Global Active Power (Kilowatts)"
                ,xlab=" "))
dev.off()

# On to the next one, plot3.png
png("plot3.png",width=480,height=480)
with(Ddays,plot(DaTm,ceiling(as.double(Sub.metering.1)),type="n",xlab="",ylab="Energy sub metering",ylim=c(0,35)))
par(col="black")
lines(as.vector(factor(Ddays$Sub.metering.1)) ~ Ddays$DaTm,ylim=c(0,35))
par(col="red")
lines(as.vector(Ddays$Sub.metering.2) ~ Ddays$DaTm)
par(col="blue")
lines(Ddays$Sub.metering.3 ~ Ddays$DaTm)
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub metering 1","Sub metering 2","Sub metering 3")
       ,text.col="black")

# Now to the Fourth plot - plot4.png
png("plot4.png",height=480,width=480)
par(mfrow = c(2,2))
with(Ddays,plot(DaTm,as.vector(Global.active.power),type="l",ylab="Global Active Power (Kilowatts)"
                ,xlab=" ",col="black"))

plot(as.vector(Ddays$Voltage)~Ddays$DaTm,type="l",ylab="Voltage"
     ,xlab="Datetime",col="black")

with(Ddays,plot(DaTm,ceiling(as.double(Sub.metering.1)),type="n",xlab="",ylab="Energy sub metering",ylim=c(0,40)))
par(col="black")
lines(as.vector(factor(Ddays$Sub.metering.1)) ~ Ddays$DaTm)
par(col="red")
lines(as.vector(Ddays$Sub.metering.2) ~ Ddays$DaTm)
par(col="blue")
lines(Ddays$Sub.metering.3 ~ Ddays$DaTm)
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub metering 1","Sub metering 2","Sub metering 3")
       ,text.col="black")

plot(as.vector(Ddays$Global.reactive.power)~Ddays$DaTm,type="l",ylab="Global reactive power"
     ,xlab="Datetime",col="black")
dev.off()