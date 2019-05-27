library(energy)
library(car)
library(plyr)
library(reshape2)

# Correlaction between years and number of lines

# Import data
test <- read.csv("periodicals_wnumb-of-lines.csv")

glimpse(test)

# Check if data is normal
qqnorm(test$lines)
qqline(test$lines)

shapiro.test(test$lines)
# Both tests shows that it's obviously not
# Similar results from the density plot:
plot(density(test$lines)) 

### Log_lines
# One of the solutions could be log-normalizing
test$log_lines <- log(test$lines)

# Check if the data is normal once again
qqnorm(test$log_lines)
qqline(test$log_lines)

shapiro.test(test$log_lines) 
# Now results for looks a bit more nice

# Tests for checking main assumptions before correlation test and lm.
mvnorm.etest(cbind(test$log_lines, test$Year), R = 999) # it's bivariate distribution (it's bad)

ncvTest(lm(test$log_lines ~ test$Year)) # p is slightly bigger than 0.005, still bad

durbinWatsonTest(lm(test$log_lines ~ test$Year)) # ok

cor.test(test$log_lines, test$Year, method = "spearman") 
# Very modest correlation

# Very bad lm
plot(test$Year, test$log_lines)
m <- lm(test$log_lines ~ test$Year)
abline(m, col = "red")

summary(m)
# p-value is ok, coeffs are significant
# However, R-sq is so small that this model should not be taken in consideration at all.

######
### Aggregated data

# Means and medians for each year
lin_mean <- ddply(test, "Year", summarise, verse.mean = mean(lines))
lin_med <- ddply(test, "Year", summarise, verse.med = median(lines))
lin_mean$verse.med <- lin_med$verse.med

glimpse(lin_mean)

plot(lin_mean$Year, lin_mean$verse.mean, main = "means")
plot(lin_mean$Year, lin_mean$verse.med, main = "medians")

# Testing the distribution
qqnorm(lin_mean$verse.med)
qqline(lin_mean$verse.med)

qqnorm(lin_mean$verse.mean)
qqline(lin_mean$verse.mean)

shapiro.test(lin_mean$verse.mean) 
shapiro.test(lin_mean$verse.med)
# both are quite ok, so the distribution of aggregated data is better

## Tests
mvnorm.etest(cbind(lin_mean$verse.mean, lin_mean$Year), R = 999)
mvnorm.etest(cbind(lin_mean$verse.med, lin_mean$Year), R = 999)
# both mid and mean are not bivariate

ncvTest(lm(lin_mean$verse.mean ~ lin_mean$Year))
ncvTest(lm(lin_mean$verse.med ~ lin_mean$Year))
# both bigger than 0.06, assumption is met

durbinWatsonTest(lm(lin_mean$verse.mean ~ lin_mean$Year))
durbinWatsonTest(lm(lin_mean$verse.med ~ lin_mean$Year))
# in both cases p-value is bigger than 0.05, so there is no autocorrelation

cor.test(lin_mean$verse.mean, lin_mean$Year, method = "pearson")
cor.test(lin_mean$verse.med, lin_mean$Year, method = "pearson")
# For the Kendall test:
# cor for mean = -0.5
# cor for median = -0.625

plot(lin_mean$Year, lin_mean$verse.mean, main = "Means")
m_mean <- lm(lin_mean$verse.mean ~ lin_mean$Year)
abline(m_mean)
summary(m_mean)
# lm model for means is not very good, it describes only 44% of the data


# lm medians
plot(lin_mean$Year, lin_mean$verse.med, main = "Medians")
m_med <- lm(lin_mean$verse.med ~ lin_mean$Year)
abline(m_med)
summary(m_med)
# model for the medians is slightly better (R-sq = 0.66)

