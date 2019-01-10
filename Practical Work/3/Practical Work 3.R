setwd('/Users/sergiobelda/Desktop/dasresources/')
dat<-read.csv('valenbisi_2011_2014.csv', sep=";")

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

# Does the use of the station change in summer? Consider that summer is the period from July to September (both monts included)

month(dat$date)
month<-month(dat$date)
dat$month<-month
dat %>% mutate(month = month) %>%
  group_by(group = if_else(month < 7 | month > 9,
                           'no_verano',
                           'verano'))->season

summarise(season, meanAvailable = mean(avg_available))

# Result:
# A tibble: 2 x 2
# group     meanAvailable
# <chr>             <dbl>
# 1 no_verano          4.14
# 2 verano             4.45

# Do the Fallas affect the use of the station? Fallas take place in Valencia from 15 to 19 March.

dat %>% mutate(date = dat$date) %>%
  group_by(group = if_else((day(date)>=15 & day(date)<=19) & month(date) == 3,
                           'fallas',
                           'no_fallas'))->fallas

summarise(fallas, meanAvailable = mean(avg_available))

# Result:
# A tibble: 2 x 2
# group     meanAvailable
# <chr>             <dbl>
# 1 fallas             0   
# 2 no_fallas          4.26
