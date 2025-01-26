# RCoursePractice
## Weekly Summaries

### Week 01: Introduction to R
A basic introduction to R, creating a simple dataset, and saving it as a CSV.

### Week 02: Descriptive Statistics
Exploration of data with basic descriptive statistics by age and gender.

### Week 3: Data Visualization
Created various plots (histogram, dot plot, box plot) using ggplot2.

### Week 4: Data Wrangling
Generated and processed simulated data for depression, age, and sleep patterns.

### Week 5: Factorial Design
Analyzed memory data across clinical groups and visualized results with ggplot2.

### Week 6: Regression Analysis
Explored the relationship between stress and satisfaction using regression.

### Week 07 & 08 Stroop Data Preparation and Analysis
Filtered and prepared Stroop task data for further analysis in week 07 R files. In the week 08 assignment file, the means and standard deviations were analyzed to compare the reaction times of those who responded with congruent and incongruent answers on the Stroop test. There was a higher average reaction time for those with incongruent responses (as can be observed in the figure below).
![image](https://github.com/user-attachments/assets/5fbc9a1d-5ebc-4eb2-a225-4bc69f9e15ad)

### Week 09 Use of Functions for Statistical Analysis
Conducted data analysis using a function for filtering data based on the type of variable (i.e., characters versus integers), limiting it to results (only those with above 10 observations), and establishing a range (with the "subject_start" and "subject_end").

### Week 10 Logistical Regression and the Use of ROC to Compare Statistical Models
Analyzing records on the survivors of the Titanic, we were able to create a model that identifies the characteristics that predict the potential for survival. First, we conducted a logistical regression, using glm, across different categories. This allowed us to establish three different models that used different factors to make these predictions. Then, we used ROC and AUC to compare the three model options. This analysis revealed that model 3, which takes into consideration gender and class (e.g., first class or other), can provide a relatively accurate prediction of the survival rate (with an AUC of 0.8165, compared to 0.5 and 0.753 for models 1 and 2). The image below of the ROC curves shows the differences between the quality of the prediction models. 

![image](https://github.com/user-attachments/assets/bb1d9001-7a45-4815-b58a-0781d9e00a4c)

