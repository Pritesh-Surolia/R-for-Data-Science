#-----Basics------#
#-----Data Structures in R-----#
#-----Vector-----#
#Homogeneous single dimensional data frame#
v1 <- c(1,2,3)
v2 <- c("a", "b", "c")
class(v1)
class(v2)
v3 <- c(T, F, T)
class(v3)

# Vector is homogeneous data structure, and if we're storing elements of different datatypes, it will check
#the priority of the datatype and will mix all into the higher datatype!
m1 <- c(1, T, 2, F)
m1
class(m1)
m2 <- c(1, "a", 2, "b") #precedence of character datatype is higher than numeric
m2
class(m2)
m3 <- c(1, "a", T) # precedence level: character>numeric>logical
m3
class(m3)

#Extracting values from Vectors#
#Indexing starts from 1
m1[1]
m1[4]
m2[2]
m3[1:3]


#-----List-----#
#List is a heterogeneous data structure#

l1 <- list(1, "a", T)
class(l1)
l1
class(l1[[1]]) # [[]] is used to find the datatype of elements of list
class(l1[[2]])
class(l1[[3]])
 
l2 <- list(c(1,2,3), c("a", "b", "c"), c(T,F,T)) # Creating a list with multiple vectors
class(l2[[1]])
class(l2[[2]])
l2[[2]][2] #Extracting the values within the list 
l2[[3]][2]

#-----Matrix-----#
m1 <- matrix(c(1,2,3,4,5,6))
m1
m1 <- matrix(c(1,2,3,4,5,6), nrow=2, ncol=3) # nrow, ncol is used to specify the nos of rows and columns
m1
m1 <- matrix(c(1,2,3,4,5,6), nrow=2, ncol=3, byrow=T) # byrow is used to store the nos first row wise
m1
m1 <- matrix(c(1,2,3,4,5,6), nrow=3, ncol=2)
m1
m1[1,2] # Extracting the values from the matrix
m1[2,2]
m2 <- matrix(c(7,8,9,10,11,12), nrow=2, ncol=3, byrow = T)
m2
m1+m2 # Various operations can be done to the matrix

#-----Array-----#
# Multi dimensional data structure #
vec1 <- c(1,2,3,4,5,6)
vec2 <- c(7,8,9,10,11,12)
a1 <- array(c(vec1,vec2), dim = c(4,3))
a1

a2 <- array(c(vec1,vec2), dim = c(2,3,2))
a2

#Extracting values from the matrix#
a1[3,3]
a1[2,1]
a2[1,3,1] #Providing the row, col and dimension of the matrix
a2[1,3,2]

#-----Factor-----#
#Factor is imp when working with ML models#
color1 <- c("blue", "green", "yellow")
as.factor(color1) -> color1
color1

#-----DataFrame-----#
#DataFrame is a 2 dimensional heterogeneous data structure#
#DataFrame can be considered as a table just like in sql#
fruits <- data.frame(fruit_name = c("Apple", "Banana", "Kiwi"), fruit_cost = c(20, 30, 40))
fruits
fruits$fruit_name

name <- data.frame(first_name = c("Pritesh", "Shashank", "Akshay", "Divy"), last_name = c("Surolia", "Singh", "Kumar", "Joshi"))
name
name$first_name


#----- Inbuilt Functions-----#
# str(), head(), tail(), table(), min(), max(), mean(), range()#
iris
View(iris)
str(iris) # To view the overall structure of the data
head(iris) # To view first few records of the data
head(iris, 10)
tail(iris) # To view last few records of the data
tail(iris$Sepal.Length)

#Table: table is used on categorical columns, frequency tab of the levels on the categorical column
table(iris$Species)
table(iris$Sepal.Length)
min(iris$Sepal.Length)
max(iris$Sepal.Length)
mean(iris$Sepal.Length)
range(iris$Sepal.Length)


#-----Decision making Statements-----#
# if

if(iris$Sepal.Length[1]<4) {
  print("Sepal Length is greater than 4")
}

if(iris$Sepal.Length[1]>4) {
  print("Sepal Length is greater than 4")
}

#if..else

if(iris$Sepal.Length[1]<4) {
  print("Sepal length is greater than 4")
} else {
  print("Sepal Length is less than 4")
}

#-----Looping Statements-----#
# for

v1 <- 1:9
for(i in v1) {
  print(i+5)
}

#for(i in v1) {
#  if (i%2=0){
#    print(i)
#  }
#}

# while
i = 1
while(i<10) {
  print(i+5)
  i=i+1
}

#-----User Defined Functions-----#
add5 <- function(x) {
  print(x+5)
}
# Do more for functions...
new <- function(x) {
  for(i in 1:x) { 
    b<-i^2
    print(b)
  }
}

new1<-function(a=2,b=5) {
  result<-a*b
  print(result)
}

#-----Data Manipulation-----# #with dplyr package
library(dplyr)
laptops <- read.csv("C:/Users/surol/Desktop/CHRIST/R_Practice/laptops.csv")
View(laptops)

#select() is a part of dplyr
#select() is used to extract columns
laptops %>% select(1,2) -> laptops1_2 # Creating a subset of the data frame using the column number
laptops %>% select(3:6) -> laptops3_6
View(laptops3_6)
laptops %>% select("Manufacturer", "Model.Name", "Price..Euros.") -> laptop_price
View(laptop_price)
laptops %>% select(starts_with("M")) -> laptops_M # starts_with is a attribute of select
View(laptops_M)
laptops %>% select(ends_with("e")) -> laptops_e
View(laptops_e)

#filter() is used to extract specific records on the basis of some conditions#

laptops %>% filter(Manufacturer=="Dell") -> laptops_dell
View(laptops_dell)
laptops %>% filter(Screen.Size>15) -> laptops_15_inch
View(laptops_15_inch)
laptops %>% filter(Manufacturer=="Dell"&Screen.Size>15) -> laptops_15_Dell 
View(laptops_15_Dell)

#Combining select() and filter() 
laptops %>% select("Manufacturer", "Model.Name", "Price..Euros.") %>% filter(Manufacturer=="Dell") -> laptop_final
View(laptop_final)
laptops %>% select("CPU", "RAM", "Storage", "Manufacturer") %>% filter(Manufacturer=="Dell", RAM=="8GB") -> laptop_final2
laptop_final2
View(laptop_final2)

#-----Data Visualization with ggplot2 package-----#
#grammar of graphics#
library(ggplot2)
View(diamonds)

#histogram
#histogram is usually used for the univariate distribution i.e. variation of single column
ggplot(data = diamonds, aes(x=price)) + geom_histogram()
ggplot(data = diamonds, aes(x=price)) + geom_histogram(fill="green") # to color the hist with color
ggplot(data = diamonds, aes(x=price)) +geom_histogram(fill="green", col="orange") 
# fill is used to color the graph and col is used to color the boundary

#histogram is used give the distribution of numeric continuous values 

#bar-plot is used for categorical values or factor types variables
#bar-plot
ggplot(data = diamonds, aes(x=cut)) + geom_bar()
ggplot(data = diamonds, aes(x=cut, fill=cut)) + geom_bar()
ggplot(data = diamonds, aes(x=cut, fill=cut)) +geom_bar(col="orange")

#scatter-plot is used to find the relationship between two numeric variables
#scatter-plot
ggplot(data = diamonds, aes(x=carat, y=price)) + geom_point()
ggplot(data = diamonds, aes(x=carat, y=price, col=cut)) + geom_point()

#box-plot
#box-plot is used to find the variation between a continuous and a categorical value
ggplot(data = diamonds, aes(x=clarity, y=carat)) + geom_boxplot()
ggplot(data = diamonds, aes(x=clarity, y=carat, fill=cut)) + geom_boxplot()

#faceting
#when we want to display many visualization in one graph we make use of faceting
ggplot(data = diamonds, aes(x=clarity, y= carat, fill=cut)) + facet_grid(~cut) + geom_boxplot()


#-----Pokemon Dataset-----#
pokemon <- read.csv("C:/Users/surol/Desktop/CHRIST/R_Practice/Pokemon.csv")
View(pokemon)

#Checking number of rows and columns
nrow(pokemon)
ncol(pokemon)

#tabulation of categorical columns
table(pokemon$Type1)
table(pokemon$Generation)
table(pokemon$Type2)

#min-max hp
min(pokemon$HP)
max(pokemon$HP)

min(pokemon$Sp..Atk)
max(pokemon$Sp..Atk)

#Checking missing values
is.na(pokemon$Defense)
View(pokemon)
is.na(pokemon)
is.na(pokemon$Type2)
sum(is.na(pokemon))

#renaming the column 
colnames(pokemon)
colnames(pokemon) == "Type1"
"primary_type" -> colnames(pokemon)[colnames(pokemon)=="Type1"]
View(pokemon)
colnames(pokemon)[colnames(pokemon)=="Type2"] <-"secondary_type"
View(pokemon)
colnames(pokemon)[colnames(pokemon)=="Name"] <- "Pokemon_Name"
View(pokemon)


#Grass type pokemon
pokemon %>% filter(pokemon$primary_type=="Grass") -> grass
View(grass)

pokemon %>% filter(pokemon$primary_type=="Fire") -> fire
View(fire)

min(grass$Speed)
max(grass$Speed)
mean(grass$Sp..Atk)
mean(grass$Sp..Def)

#visualizing the grass type pokemon#
library(ggplot2)
ggplot(data = grass, aes(x=HP)) + geom_histogram()
ggplot(data = grass, aes(x=HP)) + geom_histogram(fill="palegreen4")
ggplot(data = grass, aes(x=Attack)) + geom_histogram()
ggplot(data = grass, aes(x=Sp..Atk)) + geom_histogram()
ggplot(data = grass, aes(x=Generation)) + geom_bar()
