library(UsingR)

setwd("~/CS544/My/Term Project")
Laliga <- read.csv("Laliga.csv")
str(Laliga)
summary(Laliga)

####################################################





#Graphical Rep of categorical data

barplot(table(Laliga$HomeTeam),ylim = c(0,60),
        main = "Matches at Home each team", 
        ylab = "No. of matches", col = rainbow(20),las=2)
barplot(table(Laliga$AwayTeam),ylim = c(0,60),
        main = "Matches Away each team", 
        ylab = "No. of matches", col = rainbow(20),las=2)
table(Laliga$FTHG)
barplot(table(Laliga$FTHG),main = "Full Time Goals by Home Team",
        xlab = "Number of Goals",
        ylab = "Frequency",ylim =c(0,350),col = rainbow(10),las=2)
table(Laliga$FTAG)
barplot(table(Laliga$FTAG),main = "Full Time Goals by Away Team",
        xlab = "Number of Goals",
        ylab = "Frequency",ylim =c(0,400),col = rainbow(8))

#Real Madrid and Barcelona Data
RealMadrid <- subset(Laliga, Laliga$HomeTeam=="Real Madrid" 
                    | Laliga$AwayTeam=="Real Madrid")
Barcelona <- subset(Laliga, Laliga$HomeTeam=="Barcelona" 
                    | Laliga$AwayTeam=="Barcelona")

#Categorical data table for Real Madrid
table(RealMadrid$HomeTeam)

table(RealMadrid$HomeTeam)/length(RealMadrid$HomeTeam)

#Pie charts
par(mfrow=c(2,2))
HomeResults.RM <- table(RealMadrid$FTR[RealMadrid$HomeTeam=="Real Madrid"])
AwayResults.RM <- table(RealMadrid$FTR[RealMadrid$AwayTeam=="Real Madrid"])
HomeResults.FCB <- table(Barcelona$FTR[Barcelona$HomeTeam=="Barcelona"])
AwayResults.FCB <- table(Barcelona$FTR[Barcelona$AwayTeam=="Barcelona"])
result.labels <- names(table(RealMadrid$FTR))
results.percents <- round(HomeResults.RM/sum(HomeResults.RM)*100)
labl <- paste(result.labels,results.percents)
labl <- paste(labl, "%", sep = "")
pie(table(RealMadrid$FTR[RealMadrid$HomeTeam=="Real Madrid"]),
    labels = labl, col = rainbow(3), main = "FT-Results at Real Madrid Home")
results.percents <- round(AwayResults.RM/sum(AwayResults.RM)*100)
labl <- paste(result.labels,results.percents)
labl <- paste(labl, "%", sep = "")
pie(AwayResults.RM,
    labels = labl, col = rainbow(3), main = "FT-Results when Real Madrid Away")
results.percents <- round(HomeResults.FCB/sum(HomeResults.FCB)*100)
labl <- paste(result.labels,results.percents)
labl <- paste(labl, "%", sep = "")
pie(HomeResults.FCB,labels = labl, col = rainbow(3), main = "FT-Results when Barcelona Home")
results.percents <- round(AwayResults.FCB/sum(AwayResults.FCB)*100)
labl <- paste(result.labels,results.percents)
labl <- paste(labl, "%", sep = "")
pie(AwayResults.FCB,labels = labl, col = rainbow(3), main = "FT-Results when Barcelona Away")          
par(mfrow=c(1,1))

#Categorical Data Matrix and Mosaic plots
HomeResults.RM
AwayResults.RM
HomeResults.FCB
AwayResults.FCB
Result <- matrix(c(47,34,4,10,5,10,46,36,4,10,5,9), nrow = 2)
Result
rownames(Result) <- c("Home","Away")
colnames(Result) <- c("W.RM","D.RM","L.RM","W.B","D.B","L.B")
Result
tmp  <- c("Home","away")
tmp1 <- c("W.RM","D.RM","L.RM","W.B","D.B","L.B")
dimnames(Result) <- list(Place=tmp,Outcome=tmp1)
Result
barplot(Result,main="Barplot",col = c("red","blue"),legend.text = TRUE,
        ylab = "Count",xlab = "Outcome")
mosaicplot(Result,main="Mosaic plot",color = rainbow(3),las = 1)



#Plots of Numerical Data - Goal Data

RM.Home.Goals <- RealMadrid$FTHG[RealMadrid$HomeTeam=="Real Madrid"]
RM.Away.Goals <- RealMadrid$FTAG[RealMadrid$AwayTeam=="Real Madrid"]
RM.Goals <- c(RM.Home.Goals,RM.Away.Goals)

RM.Goals2 <- matrix(RM.Home.Goals,RM.Away.Goals)
FCB.H.Goals <- Barcelona$FTHG[Barcelona$HomeTeam=="Barcelona"]
FCB.A.Goals <- Barcelona$FTAG[Barcelona$AwayTeam=="Barcelona"]
FCB.Goals <- c(FCB.H.Goals,FCB.A.Goals)
FCB.Goals

mean(RM.Goals)
mean(FCB.Goals)
table(RM.Goals)
table(FCB.Goals)

fivenum(RM.Goals)
fivenum(FCB.Goals)

summary(RM.Goals)
summary(FCB.Goals)

Opp.names <- RealMadrid$AwayTeam[RealMadrid$HomeTeam=="Real Madrid"]
Opp.names <- Opp.names[Opp.names!="RealMadrid"]
barplot(RM.Home.Goals,xlab = "Teams",main = "Goals By RM at Home",
       col = rainbow(10),names.arg = Opp.names,
        ylab="Goals", las=2)

Opp.names <- RealMadrid$HomeTeam[RealMadrid$AwayTeam=="Real Madrid"]
barplot(RM.Away.Goals,xlab = "Teams",main = "Goals By RM Away",
        col = rainbow(10),names.arg = Opp.names,
        ylab="Goals", las=2)

hist(RM.Goals, col = rainbow(10))

hist(FCB.Goals,col = rainbow(8))

boxplot(RM.Goals, col = "Green",horizontal = TRUE)
boxplot(FCB.Goals,col="Green",horizontal = TRUE)




############################################
#Geographical representation of data
Opp.names
Teamnames <- levels(Opp.names)
Teamnames <- Teamnames[-(18)]
Teamnames
freq <- c(1,2)
for(i in 1:24) freq[i] <- RealMadrid$FTAG[RealMadrid$HomeTeam==Teamnames[i]]
freq
freq <- freq[1:24]
for (i in 1:24){
  freq[i] <- freq[i]+1
}
freq
length(freq)
length(Teamnames)

library(ggmap)
library(plotGoogleMaps)
map <- get_map(location = 'Spain',maptype = "satellite", zoom = 5)

Teamnames[6] <- "Vigo"
Teamnames[10] <- "RCD Espanyol"
Teamnames[14] <- "Las Palmas"
Teamnames[17] <- "Pamplona"
Teamnames[19] <- "Anoeta"
Teamnames[23] <- "Madrid"
Teamnames
location <- geocode(as.character(Teamnames))
ggmap(map) +
  geom_point(data = location, aes(x = location$lon, y = location$lat, fill = "red", alpha = 0.8), size = freq, shape = 21) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE)

######################################################

#Part 3

#Sample Means
RM.b.Home <- RealMadrid$B365H[RealMadrid$HomeTeam=="Real Madrid"]
RM.b.Away <- RealMadrid$B365A[RealMadrid$AwayTeam=="Real Madrid"]
B.RM <- c(RM.b.Home,RM.b.Away)
mbet<-mean(B.RM)
mbet
sigma<-sd(B.RM)
sigma
samples<-90
sample.size<-10
xbar<-numeric(samples)
for(i in 1:samples){
  xbar[i]<- mean(rnorm(sample.size, mean= mbet, sd<-sigma))
}
B.RM
hist(xbar, prob=TRUE, main = "Sample size = 10", breaks = 20, col=rainbow(8), xlim = c(1, 2))
lines(density(xbar))

#For various Random samples
par(mfrow=c(2,2))
for (size in c(20, 40, 60, 80)) 
  {
    for (i in 1:samples) 
      {
        xbar[i] <- mean(rexp(size, rate = 2))
      }
  hist(xbar, prob = TRUE,breaks = 20, 
       main = paste("Sample Size =", size), 
       xlim= c(0,1), ylim=c(0.2,8), col=rainbow(8))
  cat("Sample Size = ", size,
      " Mean = ", mean(xbar),
      " SD = ", sd(xbar), "\n")
  lines(density(xbar))
}
par(mfrow = c(1,1))
############################################

#Part 4

#Random Sampling
library(sampling)
head(RealMadrid)

#Simple random sample of size 40 with replacement
s<- srswr(40, nrow(RealMadrid))
s 
s[s!= 0]
rows<- (1:nrow(RealMadrid))[s !=0]
rows<- rep(rows, s[s != 0])
rows
#The data of the selected sample and frequency is shown below
sample.1<-RealMadrid[rows, ]
head(sample.1)
table(sample.1$HS[RealMadrid$HomeTeam=="Real Madrid"])
table(sample.1$AS[RealMadrid$AwayTeam=="Real Madrid"])
#################
s<- srswr(40, nrow(RealMadrid))
sample.2<-RealMadrid[s != 0, ]
head(sample.2)
table(sample.2$HS[RealMadrid$HomeTeam=="Real Madrid"])
table(sample.2$AS[RealMadrid$AwayTeam=="Real Madrid"])
#Systematic sampling

N<-110
n<-30
k<-ceiling(N/n)
k
#random sample from first group
r<- sample(k,1)
r
#Select every kth item
s <- seq(r, by=k, length=n)
sample.3<-RealMadrid[s, ]
head(sample.3)
table(sample.3$HS[RealMadrid$HomeTeam=="Real Madrid"])
table(sample.3$AS[RealMadrid$AwayTeam=="Real Madrid"])

#Unequal Probablities
pik<- inclusionprobabilities(RealMadrid$HS[RealMadrid$HomeTeam=="Real Madrid"], 30)
length(pik)
sum(pik)
s<- UPsystematic(pik)
sample.4<-RealMadrid[s != 0, ]
head(sample.4)
table(sample.4$HS[RealMadrid$HomeTeam=="Real Madrid"])

###########################################################

#Part 5

#Confidence Intervals for Population mean.


table(RM.Goals)

pop.sd<-sd(RM.Goals)
pop.mean<-mean(RM.Goals)
pop.mean
conf<- c(80,90)
typeof(pop.mean)
pop.mean - 2*pop.sd
pop.mean+qnorm(1-i/2)*pop.sd
alpha<-1-conf/100
alpha
qnorm(alpha/2)
qnorm(1-alpha/2)
for (i in alpha) {
  str <- sprintf("%2d%% Confidence Level (alpha = %.2f), z: %.2f , %.2f",
                 100*(1-i), i,
                pop.mean- qt(1-i/2,df=n-1)*pop.sd,
                pop.mean+ qt(1-i/2,df=n-1)*pop.sd)
  cat(str,"\n")
  
}

###Precision
for (i in alpha) {
  str <- sprintf("%2d%% Confidence Level (alpha = %.2f), Precision: %.2f",
                 100*(1-i), i,
                 2* qt(1-i/2,df=n-1)*pop.sd)
  cat(str,"\n")
  
}

#Sample means

x <- rnorm(1000, mean = pop.mean, sd = pop.sd)
x <- as.integer(x)
x
samples <- 30
sample.size <- 30
sd.sample.means <- pop.sd/sqrt(sample.size)
sd.sample.means


xbar <- numeric(samples)
for (i in 1: samples) {
  sample.data.1 <- sample(x, size=sample.size)
  xbar[i] <- mean(sample.data.1)
  str <- sprintf("%2d: xbar = %.2f, CI = %.2f - %.2f",
                 i, xbar[i], xbar[i] - 2*sd.sample.means,
                 xbar[i] + 2*sd.sample.means)
  cat(str,"\n")
}
for(i in alpha){
  matplot(rbind(xbar - 2*sd.sample.means, xbar + 2*sd.sample.means),
          rbind(1:samples, 1:samples), type="l", lty=1)
  abline(v = pop.mean)
}







