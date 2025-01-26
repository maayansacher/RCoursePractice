# R course for beginners 
# Week 1
# Assignment by Maayan Sacher, ID 302308283



x = seq(1, 6, 1) #total number of sample participants - six

print(x) #print function to see the variable in the environment panel


gender = sample(c("female", "male", "other"), 6, replace = TRUE) #created a randomized variable for gender that allow the three options to repeat

print(gender) #print function to see the variable in the environment panel


age = runif(6, 15, 40) #within the limit of 6 participants, to have the age vector be between 15 and 40 years of age.

print(age) #print function to see the variable in the environment panel


y = rbinom(6, 1, 0.3) #Bernoulli variable, whereby having depression set at one and the non-depression set as 0. The "success" or having depression or 1 has a parameter or probability/chance set as 30%. 

print(y) #print function to see the variable in the environment panel





df = data.frame(x, gender, age, y) #prepare a table for the data

View(df) #view this table 





save(df, file = 'df.rdata') #saving the data in the table as an RData file

load(file = 'df.rdata') #saving the table as a loadable RData file

write.csv(df, file = 'df.csv') #saving the data in the table as a CSV file

df_new = read.csv(file = 'df.csv') #saving it as a new object that can be viewed as a CSV file