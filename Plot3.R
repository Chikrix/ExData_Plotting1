getwd()# I checked the working directory
dir() # Here I checked if the dataset is in the working directory and it was, so I started working

HD2 = read.table("household_power_consumption.txt",header=T,sep=";",nrows=2075260,stringsAsFactors=T)
names(HD2)
names(HD2) <- gsub("_"," ",names(HD2)) # I gave the column names an appropriate name
names(HD2)
HD2$Date
table(HD2$Date)
Ddays <- HD2[c(which(HD2$Date %in% "1/2/2007"),which(HD2$Date %in% "2/2/2007")),] # Here I subset out the days I need
head(Ddays)
tail(Ddays)
as.Date(Ddays$Date,"%d/%m/%Y")[nrow(Ddays)] - as.Date(Ddays$Date,"%d/%m/%Y")[1] # This checks if the difference is one day
which(table(Ddays$Date) == 1440) # This also checks if I have the right days
rownames(Ddays) = NULL
head(Ddays)
lapply(head(Ddays),class) # Checked the class of the columns
str(Ddays)

Ddays$Date
Ddays$Date = as.Date(Ddays$Date,"%d/%m/%Y") # Here I first changed the Date variable into a date object using as.Date()
Ddays$Date
Ddays$DT <- paste(Ddays$Date,Ddays$Time)  # Then I joined it with the Time variable using paste(), this I made a new variable
head(Ddays$DT)
lapply(Ddays,class)
Ddays$DT <- strptime(Ddays$DT,"%Y-%m-%d %H:%M:%S") #Using strptime(),I changed that new var into a POSIXct and POSIXt class
lapply(Ddays,class)

# Now I can make my third plots, plot3.png
png("Plot3.png",width=480,height=480)
par(col="black")
with(Ddays,plot(DT,as.vector(Sub.metering.1),type="n",ylab="Energy Sub Metering",xlab=" "))
lines(Ddays$DT,as.vector(Ddays$Sub.metering.1))
par(col="red")
lines(Ddays$DT,as.vector(Ddays$Sub.metering.2))
par(col="blue")
lines(Ddays$DT,as.vector(Ddays$Sub.metering.3))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub.metering.1","Sub.metering.2","Sub.metering.3"))
dev.off()