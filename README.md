# predictive_model_for_insurance

This project uses a multiple regression model to predict insurance charges based on factors like age, BMI, smoking status, sex, and region. The goal is to analyze how these variables impact health insurance costs and build a model that helps estimate charges based on individual characteristics.

Dataset
The data used in this project is the "Medical Cost Personal Dataset" available on Kaggle. The dataset includes information on individual medical costs billed by health insurance, with the following variables:

age: Age of the insured.
sex: Gender of the insured (male/female).
bmi: Body Mass Index, a measure of body fat based on height and weight.
children: Number of dependents covered by the insurance.
smoker: Smoking status of the insured (yes/no).
region: Residential region in the U.S. (southwest, southeast, northwest, northeast).
charges: Medical insurance charge for the insured.
Project Steps
1. Data Preparation and Exploration
Loaded the dataset into R.
Converted categorical variables (sex, smoker, region) to factors for ease of analysis.
Conducted an initial exploration to understand distributions and relationships.
2. Model Building
Built an initial multiple regression model with age, bmi, and smoker as predictors.
Expanded the model to include sex and region to test for additional effects on insurance charges.
3. Key Findings
Smoking status is the most significant predictor of higher insurance charges, with smokers having significantly higher costs on average.
BMI and age also have strong positive relationships with charges, indicating that older individuals and those with higher BMIs tend to incur higher insurance costs.
Sex and region showed no statistically significant effect, suggesting these factors may not strongly influence insurance costs in this dataset.
4. Model Evaluation
The final model has an R-squared of 0.7487, meaning it explains approximately 74.87% of the variation in insurance costs.
This suggests that age, BMI, and smoker are the most influential factors in determining insurance charges.
Conclusion
This analysis highlights key factors that influence health insurance costs, with smoking, BMI, and age being the strongest predictors. The project demonstrates the application of multiple regression modeling in R to analyze and predict insurance costs based on individual characteristics.

BMI  Smoker Status

![image](https://github.com/user-attachments/assets/ff993ff2-49b0-4e74-8a1d-74136b839c5f)

