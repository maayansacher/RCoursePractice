####WEEK 9----
add_numbers <- function(x, y) {
  result <- x + y  # פעולת החיבור
  return(result)   # הפלט: מחזירה את התוצאה
}
add_numbers(157,49)

multiply_numbers <- function(x, y) {
  result <- x * y  # פעולת הכפל
  return(result)   # החזרת התוצאה
}
multiply_numbers(2547,13)

conditional_operation <- function(x, y) {
  if (x > 5 & y > 5) {   # בדיקה אם שני המספרים גדולים מ-5
    result <- x * y      # אם כן, מכפילים אותם
  } else {
    result <- x + y      # אחרת, מחברים אותם
  }
  return(result)         # החזרת התוצאה
}
conditional_operation(6, 8)  # שני המספרים גדולים מ-5 -> מצופה כפל
conditional_operation(4, 7)  # אחד מהמספרים קטן מ-5 -> מצופה חיבור
conditional_operation(3, 2)  # שניהם קטנים מ-5 -> מצופה חיבור

cylinder <- function(r, h){
  area <- 2*pi*r*h+2*pi*r^2
  return(cbind(r,h,area)) #can also do data.fram(r,h,area) will not give a matrix but pretty much the same
}

cylinder(1:10,20) #will provide me a table of the areas per radius ranging from 1 to 10

#DEBUGGING
x1 = 2
x2 = 3
Multiplication <- function(x1, x2) {
  x3 = 1000
  
  browser()  # עצירה כאן
  
  y = x1 * x3
  return(y)
}
print(Multiplication(x1, x2))
ls() #will show me the variables that are in the workspace