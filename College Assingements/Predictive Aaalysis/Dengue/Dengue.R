#Dengue Analysis 
#Created by Ratnam Dubey 
#https://www.drivendata.org/competitions/44/dengai-predicting-disease-spread/submissions/
# load libraries

pkgs <- c('tidyverse','scales' ,'corrplot', 'magrittr','corrplot' ,'zoo', 'RColorBrewer', 'gridExtra','MASS','plyr' , 'dplyr' ,'plotly' )
invisible(lapply(pkgs, require, character.only = T))


# Importing the Data 
train <- read.table("D:\\Kaggle Projects\\Dengue\\dengue_features_train.csv", header=TRUE, sep=",")
test <- read.table("D:\\Kaggle Projects\\Dengue\\dengue_features_test.csv", header=TRUE, sep=",")

attach(train)
attach(test)

#Exploring the Data 
head(train,5)

#getting the Data over the Time 
aggdata <-aggregate(train$city, by=list(train$year,train$city),FUN=mean, na.rm=TRUE)

#Conclusion here is that the Sj has the Data from 1990 to 2008 
#where as the iq has the Data from 2000 to 2010 
#plotting the Data based on the Number of Cases 


plot(train$total_cases,type="l")
plot(train$year,train$total_cases,type = "h" , col="red")

# As we can see the Cases are distributed over the year 
# But we dont know for which city it is for as we have two city 

unique(train$city)

#two cities are Sj = 1 and iq = 2

plot(train$year[train$city==2],train$total_cases[train$city==2],type="h" , col="blue")
plot(train$year[train$city==1],train$total_cases[train$city==1],type="h" , col="green")

# Conclusion 
# For City Sj the Maximum number of cases are in 1994
# For City iq the Maximum number of cases are in  2004 

# count missing values (as percent)
apply(train, 2, function(x) 
  round(100 * (length(which(is.na(x))))/length(x) , digits = 1)) %>%
  as.data.frame() %>%
  `names<-`('Percent of Missing Values')

# Plotting the Data 
train %>%
  mutate(index = as.numeric(row.names(.))) %>%
  ggplot(aes(index, ndvi_ne)) + 
  geom_line(colour = 'dodgerblue') +
  ggtitle("Vegetation Index over Time")

# Droping the Coloum with 13% of the missing Data 

train$ndvi_ne <- NULL
test$ndvi_ne <- NULL

# Replacing the Values with the Mean 
plot(train$ndvi_nw)
mean(train$ndvi_nw,na.rm = TRUE)
train$ndvi_nw[is.na(train$ndvi_nw)] <- mean(train$ndvi_nw,na.rm = TRUE)

plot(train$ndvi_se)
mean(train$ndvi_se,na.rm = TRUE)
train$ndvi_se[is.na(train$ndvi_se)] <- mean(train$ndvi_se,na.rm = TRUE)


plot(train$precipitation_amt_mm)
mean(train$precipitation_amt_mm,na.rm = TRUE)
train$precipitation_amt_mm[is.na(train$precipitation_amt_mm)] <- mean(train$precipitation_amt_mm,na.rm = TRUE)

plot(train$reanalysis_air_temp_k)
mean(train$reanalysis_air_temp_k,na.rm = TRUE)
train$reanalysis_air_temp_k[is.na(train$reanalysis_air_temp_k)] <- mean(train$reanalysis_air_temp_k,na.rm = TRUE)

plot(train$reanalysis_air_temp_k)
mean(train$reanalysis_air_temp_k,na.rm = TRUE)
train$reanalysis_air_temp_k[is.na(train$reanalysis_air_temp_k)] <- mean(train$reanalysis_air_temp_k,na.rm = TRUE)

plot(train$reanalysis_avg_temp_k)
mean(train$reanalysis_avg_temp_k,na.rm = TRUE)
train$reanalysis_avg_temp_k[is.na(train$reanalysis_avg_temp_k)] <- mean(train$reanalysis_avg_temp_k,na.rm = TRUE)

plot(train$reanalysis_dew_point_temp_k)
mean(train$reanalysis_dew_point_temp_k,na.rm = TRUE)
train$reanalysis_dew_point_temp_k[is.na(train$reanalysis_dew_point_temp_k)] <- mean(train$reanalysis_dew_point_temp_k,na.rm = TRUE)

plot(train$reanalysis_max_air_temp_k)
mean(train$reanalysis_max_air_temp_k,na.rm = TRUE)
train$reanalysis_max_air_temp_k[is.na(train$reanalysis_max_air_temp_k)] <- mean(train$reanalysis_max_air_temp_k,na.rm = TRUE)

plot(train$reanalysis_min_air_temp_k)
mean(train$reanalysis_min_air_temp_k,na.rm = TRUE)
train$reanalysis_min_air_temp_k[is.na(train$reanalysis_min_air_temp_k)] <- mean(train$reanalysis_min_air_temp_k,na.rm = TRUE)

plot(train$reanalysis_precip_amt_kg_per_m2)
mean(train$reanalysis_precip_amt_kg_per_m2,na.rm = TRUE)
train$reanalysis_precip_amt_kg_per_m2[is.na(train$reanalysis_precip_amt_kg_per_m2)] <- mean(train$reanalysis_precip_amt_kg_per_m2,na.rm = TRUE)

plot(train$reanalysis_relative_humidity_percent)
mean(train$reanalysis_relative_humidity_percent,na.rm = TRUE)
train$reanalysis_relative_humidity_percent[is.na(train$reanalysis_relative_humidity_percent)] <- mean(train$reanalysis_relative_humidity_percent,na.rm = TRUE)

plot(train$reanalysis_sat_precip_amt_mm)
mean(train$reanalysis_sat_precip_amt_mm,na.rm = TRUE)
train$reanalysis_sat_precip_amt_mm[is.na(train$reanalysis_sat_precip_amt_mm)] <- mean(train$reanalysis_sat_precip_amt_mm,na.rm = TRUE)

plot(train$reanalysis_specific_humidity_g_per_kg)
mean(train$reanalysis_specific_humidity_g_per_kg,na.rm = TRUE)
train$reanalysis_specific_humidity_g_per_kg[is.na(train$reanalysis_specific_humidity_g_per_kg)] <- mean(train$reanalysis_specific_humidity_g_per_kg,na.rm = TRUE)

plot(train$reanalysis_tdtr_k)
mean(train$reanalysis_tdtr_k,na.rm = TRUE)
train$reanalysis_tdtr_k[is.na(train$reanalysis_tdtr_k)] <- mean(train$reanalysis_tdtr_k,na.rm = TRUE)

plot(train$station_avg_temp_c)
mean(train$station_avg_temp_c,na.rm = TRUE)
train$station_avg_temp_c[is.na(train$station_avg_temp_c)] <- mean(train$station_avg_temp_c,na.rm = TRUE)

plot(train$station_diur_temp_rng_c)
mean(train$station_diur_temp_rng_c,na.rm = TRUE)
train$station_diur_temp_rng_c[is.na(train$station_diur_temp_rng_c)] <- mean(train$station_diur_temp_rng_c,na.rm = TRUE)

plot(train$station_max_temp_c)
mean(train$station_max_temp_c,na.rm = TRUE)
train$station_max_temp_c[is.na(train$station_max_temp_c)] <- mean(train$station_max_temp_c,na.rm = TRUE)

plot(train$station_min_temp_c)
mean(train$station_min_temp_c,na.rm = TRUE)
train$station_min_temp_c[is.na(train$station_min_temp_c)] <- mean(train$station_min_temp_c,na.rm = TRUE)

plot(train$station_precip_mm)
mean(train$station_precip_mm,na.rm = TRUE)
train$station_precip_mm[is.na(train$station_precip_mm)] <- mean(train$station_precip_mm,na.rm = TRUE)


# count missing values (as percent)
apply(train, 2, function(x) 
  round(100 * (length(which(is.na(x))))/length(x) , digits = 1)) %>%
  as.data.frame() %>%
  `names<-`('Percent of Missing Values')




# Replacing the Values with the Mean of Test 

plot(test$ndvi_nw)
mean(test$ndvi_nw,na.rm = TRUE)
test$ndvi_nw[is.na(test$ndvi_nw)] <- mean(test$ndvi_nw,na.rm = TRUE)

plot(test$ndvi_se)
mean(test$ndvi_se,na.rm = TRUE)
test$ndvi_se[is.na(test$ndvi_se)] <- mean(test$ndvi_se,na.rm = TRUE)


plot(test$precipitation_amt_mm)
mean(test$precipitation_amt_mm,na.rm = TRUE)
test$precipitation_amt_mm[is.na(test$precipitation_amt_mm)] <- mean(test$precipitation_amt_mm,na.rm = TRUE)

plot(test$reanalysis_air_temp_k)
mean(test$reanalysis_air_temp_k,na.rm = TRUE)
test$reanalysis_air_temp_k[is.na(test$reanalysis_air_temp_k)] <- mean(test$reanalysis_air_temp_k,na.rm = TRUE)

plot(test$reanalysis_air_temp_k)
mean(test$reanalysis_air_temp_k,na.rm = TRUE)
test$reanalysis_air_temp_k[is.na(test$reanalysis_air_temp_k)] <- mean(test$reanalysis_air_temp_k,na.rm = TRUE)

plot(test$reanalysis_avg_temp_k)
mean(test$reanalysis_avg_temp_k,na.rm = TRUE)
test$reanalysis_avg_temp_k[is.na(test$reanalysis_avg_temp_k)] <- mean(test$reanalysis_avg_temp_k,na.rm = TRUE)

plot(test$reanalysis_dew_point_temp_k)
mean(test$reanalysis_dew_point_temp_k,na.rm = TRUE)
test$reanalysis_dew_point_temp_k[is.na(test$reanalysis_dew_point_temp_k)] <- mean(test$reanalysis_dew_point_temp_k,na.rm = TRUE)

plot(test$reanalysis_max_air_temp_k)
mean(test$reanalysis_max_air_temp_k,na.rm = TRUE)
test$reanalysis_max_air_temp_k[is.na(test$reanalysis_max_air_temp_k)] <- mean(test$reanalysis_max_air_temp_k,na.rm = TRUE)

plot(test$reanalysis_min_air_temp_k)
mean(test$reanalysis_min_air_temp_k,na.rm = TRUE)
test$reanalysis_min_air_temp_k[is.na(test$reanalysis_min_air_temp_k)] <- mean(test$reanalysis_min_air_temp_k,na.rm = TRUE)

plot(test$reanalysis_precip_amt_kg_per_m2)
mean(test$reanalysis_precip_amt_kg_per_m2,na.rm = TRUE)
test$reanalysis_precip_amt_kg_per_m2[is.na(test$reanalysis_precip_amt_kg_per_m2)] <- mean(test$reanalysis_precip_amt_kg_per_m2,na.rm = TRUE)

plot(test$reanalysis_relative_humidity_percent)
mean(test$reanalysis_relative_humidity_percent,na.rm = TRUE)
test$reanalysis_relative_humidity_percent[is.na(test$reanalysis_relative_humidity_percent)] <- mean(test$reanalysis_relative_humidity_percent,na.rm = TRUE)

plot(test$reanalysis_sat_precip_amt_mm)
mean(test$reanalysis_sat_precip_amt_mm,na.rm = TRUE)
test$reanalysis_sat_precip_amt_mm[is.na(test$reanalysis_sat_precip_amt_mm)] <- mean(test$reanalysis_sat_precip_amt_mm,na.rm = TRUE)

plot(test$reanalysis_specific_humidity_g_per_kg)
mean(test$reanalysis_specific_humidity_g_per_kg,na.rm = TRUE)
test$reanalysis_specific_humidity_g_per_kg[is.na(test$reanalysis_specific_humidity_g_per_kg)] <- mean(test$reanalysis_specific_humidity_g_per_kg,na.rm = TRUE)

plot(test$reanalysis_tdtr_k)
mean(test$reanalysis_tdtr_k,na.rm = TRUE)
test$reanalysis_tdtr_k[is.na(test$reanalysis_tdtr_k)] <- mean(test$reanalysis_tdtr_k,na.rm = TRUE)

plot(test$station_avg_temp_c)
mean(test$station_avg_temp_c,na.rm = TRUE)
test$station_avg_temp_c[is.na(test$station_avg_temp_c)] <- mean(test$station_avg_temp_c,na.rm = TRUE)

plot(test$station_diur_temp_rng_c)
mean(test$station_diur_temp_rng_c,na.rm = TRUE)
test$station_diur_temp_rng_c[is.na(test$station_diur_temp_rng_c)] <- mean(test$station_diur_temp_rng_c,na.rm = TRUE)

plot(test$station_max_temp_c)
mean(test$station_max_temp_c,na.rm = TRUE)
test$station_max_temp_c[is.na(test$station_max_temp_c)] <- mean(test$station_max_temp_c,na.rm = TRUE)

plot(test$station_min_temp_c)
mean(test$station_min_temp_c,na.rm = TRUE)
test$station_min_temp_c[is.na(test$station_min_temp_c)] <- mean(test$station_min_temp_c,na.rm = TRUE)

plot(test$station_precip_mm)
mean(test$station_precip_mm,na.rm = TRUE)
test$station_precip_mm[is.na(test$station_precip_mm)] <- mean(test$station_precip_mm,na.rm = TRUE)


# count missing values (as percent)
apply(test, 2, function(x) 
  round(100 * (length(which(is.na(x))))/length(x) , digits = 1)) %>%
  as.data.frame() %>%
  `names<-`('Percent of Missing Values')


##Checking the Outliers for the Values 
boxplot(train[1:6])
boxplot(train[7:10])
train$precipitation_amt_mm <- squish(train$precipitation_amt_mm, quantile(train$precipitation_amt_mm, c(.05, .95)))
boxplot(train[7:10])
boxplot(train[10:13])
boxplot(train[13:15])
train$reanalysis_precip_amt_kg_per_m2 <- squish(train$reanalysis_precip_amt_kg_per_m2, quantile(train$reanalysis_precip_amt_kg_per_m2, c(.05, .95)))
boxplot(train[15:18])
train$reanalysis_sat_precip_amt_mm <- squish(train$reanalysis_sat_precip_amt_mm, quantile(train$reanalysis_sat_precip_amt_mm, c(.05, .95)))
boxplot(train[18:21])
boxplot(train[21:24])
train$station_precip_mm <- squish(train$station_precip_mm, quantile(train$station_precip_mm, c(.05, .95)))

train$week_start_date <- NULL
test$week_start_date <- NULL

##Checking the Outliers for the Values 
boxplot(test[1:6])
boxplot(test[7:10])
test$precipitation_amt_mm <- squish(test$precipitation_amt_mm, quantile(test$precipitation_amt_mm, c(.05, .95)))
boxplot(test[7:10])
boxplot(test[10:13])
boxplot(test[13:15])
test$reanalysis_precip_amt_kg_per_m2 <- squish(test$reanalysis_precip_amt_kg_per_m2, quantile(test$reanalysis_precip_amt_kg_per_m2, c(.05, .95)))
boxplot(test[15:18])
test$reanalysis_sat_precip_amt_mm <- squish(test$reanalysis_sat_precip_amt_mm, quantile(test$reanalysis_sat_precip_amt_mm, c(.05, .95)))
boxplot(test[18:21])
#boxplot(test[21:24])
test$station_precip_mm <- squish(test$station_precip_mm, quantile(test$station_precip_mm, c(.05, .95)))

## Ploting Some Data and Getting the Result on the basis of the same 
train %>% 
  dplyr::select(-city, -year, -weekofyear) %>%
  cor(use = 'pairwise.complete.obs') -> M1
 
corrplot(M1, type="lower", method="color",
         col=brewer.pal(n=8, name="RdBu"),diag=FALSE)


##Precisely none of these correlations are very strong. 
##After seeing the Corelation we are moving forward to some of the Imputs 
# reanalysis_specific_humidity_g_per_kg
#reanalysis_dew_point_temp_k
#station_avg_temp_c
#station_min_temp_c
#renanlysis_min_temp_k
#reanalysis_air_temp_k


############################################################################
#               Modelling                                                  #
###########################################################################

test_new   <- test[,c("reanalysis_air_temp_k" ,"reanalysis_min_air_temp_k", "reanalysis_specific_humidity_g_per_kg", "reanalysis_dew_point_temp_k", "station_avg_temp_c" , "station_min_temp_c")]
train_new  <- train[,c("reanalysis_air_temp_k" ,"reanalysis_min_air_temp_k", "reanalysis_specific_humidity_g_per_kg", "reanalysis_dew_point_temp_k", "station_avg_temp_c" , "station_min_temp_c")]
train_pred <- train[,c("total_cases")]



fit <- glm.nb("total_cases ~ 1 + reanalysis_specific_humidity_g_per_kg + reanalysis_air_temp_k + reanalysis_dew_point_temp_k + station_avg_temp_c + station_min_temp_c" , data = train_new )

summary(train_new)

sj_iq_test <- test[[1]]
sj_iq_test$predicted = predict(fit , test_new, type = 'response')

fin_pred_val <- round(sj_iq_test$predicted)

submissions = read.csv("D:\\Kaggle Projects\\Dengue\\submission_format.csv", header=TRUE, sep=",")

submissions$total_cases <- fin_pred_val

write.csv(submissions, 'D:\\Kaggle Projects\\Dengue\\predictions.csv', row.names = FALSE)


