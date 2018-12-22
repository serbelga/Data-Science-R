# What is the day of the week with the least bikes available (in average)?
dat$date <- ymd(dat$date)
dayweek <- wday(dat$date)
dat$dayweek <- dayweek

xhourday <- group_by(dat, hour, dayweek)
xhourday <- summarise(xhourday, meanAvailable = mean(avg_available))

xhour <- group_by(dat, hour)
xhour <- summarise(xhour, meanAvailable = mean(avg_available))

ggplot(data=xhourday,aes(x=hour, y=meanAvailable, group=dayweek, colour = factor(dayweek)))+
  geom_line()+theme_bw()+ggtitle("Guillem de Castro. Day Average")+
  scale_colour_discrete("dayweek",
                        labels=c("Monday", "Tuesday","Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))+
  theme(plot.title = element_text(face="bold", size=18, hjust = 0.5))

# What are the dates with the least and the most bikes available (in average)?

xdate<-group_by(dat, date)

summarise(xdate, meanAvailable = mean(avg_available))

xdate<-summarise(xdate, meanAvailable = mean(avg_available))
xdate[which(xdate$meanAvailable == min(xdate$meanAvailable)),]
xdate[which(xdate$meanAvailable == max(xdate$meanAvailable)),]

#min and max values

# What is the month with the least bikes available (in average)?

month(dat$date)
month<-month(dat$date)
dat$month<-month
xmonth <- group_by(dat, month)
xmonth <- summarise(xmonth, meanAvailable = mean(avg_available))
ggplot(data=xmonth,aes(x=month, y=meanAvailable, group=month, colour = factor(month)))+
  geom_area()+
  theme_bw()+
  scale_colour_discrete("month", labels=c("January", "February","March", "April", "May", "June", "July", "August", "September", "October", "November", "December"))+
  ggtitle("Guillem de Castro. Month Average")+
  labs(x ="Month", y ="Available Bicycles")+
  theme(plot.title = element_text(face="bold", size=18, hjust = 0.5))
