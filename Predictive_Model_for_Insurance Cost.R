#load libraries

library(dplyr)
library(ggplot2)

#load dataset

claims_data <- read.csv("C:/Users/caris/OneDrive/Desktop/Data_Science_Projects/Medical Cost Personal/claims_data_analysis/insurance.csv")

#Reviewing some of the data; to see the structure
head(claims_data)

#explore and clean data

sum(is.na(claims_data))

#summarize dataset

summary(claims_data)

#convert categorical to factors

claims_data$sex <- factor(claims_data$sex, levels = c("male", "female"))
claims_data$smoker <- factor(claims_data$smoker, levels = c("no", "yes"))
claims_data$region <- factor(claims_data$region, levels = c("southwest", "southeast", "northwest", "northeast"))

#summarize dataset after factors

summary(claims_data)

#visualize key relationships

ggplot(claims_data, aes(x = bmi, y = charges, color = smoker)) +
  geom_point(alpha = 0.6) +
  labs(title = "Charges vs. BMI, Colored by Smoker Status")

#Smokers (in blue) generally have much higher charges compared to non-smokers (in red), particularly as BMI increases.
#There’s a positive trend where higher BMI values are associated with higher charges, especially among smokers.

#building a model - multiple regression

model <- lm(charges ~ age + bmi + smoker, data = claims_data)

summary(model)

#intercept - not directly meaningful because none of these will be zero

#age: 259.55 - For each additional year of age, charges increase by an average of $259.55, assuming other variables 
#remain constant. This positive relationship suggests that older individuals tend to have higher costs.

#bmi: 322.62 - For each additional unit of BMI, charges increase by $322.62, indicating that higher BMI is associated 
#with higher costs.

#smoker yes: 23,823.68 - Being a smoker (vs. non-smoker) is associated with an increase in charges by an average of $23,823.68. 
#This large effect shows that smoking status is a strong predictor of insurance costs.

#statistical significance - The p-values for age, bmi, and smokeryes are all less than 0.001 (indicated by ***), which means they 
#are highly significant predictors of charges.

#Multiple R-squared: 0.7475 - This means that about 74.75% of the variation in charges is explained by age, bmi, and smoker. 
#This is quite high, indicating that the model is doing a good job at capturing the variance in insurance costs.

#This model shows that age, bmi, and smoker are all significant predictors of insurance costs, with smoking status having the largest impact. 
#The high R-squared value indicates a good fit.

#Model with more variables 

model_add_var <- lm(charges ~ age + bmi + smoker + sex + region, data = claims_data)

summary(model_add_var)

#age: 258.54 - Each additional year of age increases charges by $258.54, assuming other variables stay constant. This coefficient remains highly significant (p < 2e-16).

#bmi: 340.46 - For each unit increase in BMI, charges increase by $340.46 on average. Like age, this effect is statistically significant.

#smoker yes - 23,862.91 - Smokers, on average, have $23,862.91 higher charges than non-smokers, holding other variables constant. This large, highly significant coefficient
#shows the substantial effect of smoking on charges.

#sex female: 111.57 - This suggests that being female is associated with a slight increase of $111.57 in charges compared to males, but this effect is not statistically significant (p = 0.7386).

#region south east: -122.76 - the Southeast has a decrease in charges by $122.76 on average, though this is not statistically significant (p = 0.7950).

#region north west: 612.34 - Compared to the Southwest, charges are higher by $612.34 in the Northwest, but this effect is also not statistically significant (p = 0.2015).

#region north east: 916.44 - The Northeast has a higher cost of $916.44 compared to the Southwest, and this effect is marginally significant (p = 0.0563), indicating a slight but uncertain increase in costs.

#Multiple R-squared: 0.7487 - This means that 74.87% of the variation in charges is explained by this expanded model, a small improvement over the previous model with fewer variables.

#Adjusted R-squared: 0.7474 - This adjusted measure accounts for the number of predictors, showing a slight gain in explanatory power with the additional variables.


















