getwd()

#getting the working  directory

iris <- read.csv("Iris.csv",header= TRUE,sep = ',')

#loading csv (here header is true because column names should include otherwise column names will be consider as data)

#sep is given because file is  comma separated values

View(iris)

#printing data

table(iris$Species)    #0/p ->   Iris-setosa Iris-versicolor  Iris-virginica 
                          #              50              50              50   
# describing the column

plot(iris$SepalLengthCm~iris$PetalLengthCm)

#plotting data between two columns

plot(iris$SepalLengthCm~iris$PetalLengthCm ,ylab='sepallenght',xlab='petallenght',main='iris')

#plotting the graph with labels and heading

plot(iris$SepalLengthCm~iris$PetalLengthCm ,ylab='sepallenght',xlab='petallenght',main='iris',col='red',pch=10)

#col is used to specify the color (color code also useful) and pch is used to specific symbols(pch 16 for solid circle)



#histogram

hist(iris$SepalLengthCm)

#from the graph (maximum sepal length(7-8) of iris is round 6 iris and most of the length (4,5-7)  )
hist(iris$SepalLengthCm,xlab ="sepalLen",main = 'histsepalLength' ,col ='#746AB0' )



#boxplot
boxplot(iris$SepalLengthCm~iris$Species) 

boxplot(iris$Species~iris$SepalLengthCm) #error

#here the sepalLength is continous data, species is categorical data
#from the graph setosa is less length when compare to virginica

#ggplot

install.packages("ggplot2")
library(ggplot2)
ggplot(data=iris,aes(y=SepalLengthCm,x=PetalLengthCm))

#scatter plot

ggplot(data=iris,aes(y=SepalLengthCm,x=PetalLengthCm))+geom_point()

#giving different color for different species

ggplot(data=iris,aes(y=SepalLengthCm,x=PetalLengthCm,col=Species))+geom_point()

#giving color to data

ggplot(data=iris,aes(y=SepalLengthCm,x=PetalLengthCm,col='#746AB0'))+geom_point()

#giving different shape for different species

ggplot(data=iris,aes(y=SepalLengthCm,x=PetalLengthCm,shape=Species))+geom_point()

#giving different color and shape for different species

ggplot(data=iris,aes(y=SepalLengthCm,x=PetalLengthCm,col=Species,shape=Species))+geom_point() 


#for removing a column from the data
 install.packages("dplyr")
 library(dplyr)
 mdata %>% select(c(-1))->mdata # %>% this is pipe operator (here selecting every column without 1st)
 
 
 #for histogram 
 
 ggplot(data=mdata,aes(x=price))+geom_histogram()#highest 7.5 - 8 lakhs and mostly 250+ houses are in 1.5 - 2
 
 
 ggplot(data=mdata,aes(x=waterfront))+geom_histogram(bins = 10)
 
 ggplot(data=mdata,aes(x=waterfront))+geom_histogram(bins = 1)
 
 ggplot(data=mdata,aes(x=waterfront))+geom_histogram(bins = 5)
 
 ggplot(data=mdata,aes(x=land_value))+geom_histogram(bins = 30)
 
 ggplot(data=mdata,aes(x=land_value))+geom_histogram(bins = 30,fill="#746AB0",col='black')

ggplot(data=mdata,aes(x=price,fill=as.factor(air_cond)))+geom_histogram(bins = 20)

# sperated in air condiion is there or not

# here between 0-3 lakhs the probability of air condition is less but 3-8 lakhs the probability increases
  
  ggplot(data=mdata,aes(x=price,fill=as.factor(air_cond)))+geom_histogram(bins = 20,position = 'fill') 

#same thing but here we get clear vision of between 0-3 lakhs the probability of air condition is less but 3-8 lakhs the probability increases

# barplot

 ggplot(data=mdata,aes(x=air_cond))+geom_bar()

 ggplot(data=mdata,aes(x=as.factor(waterfront),fill=as.factor(air_cond)))+geom_bar(position = 'fill')
 
 ggplot(data=mdata,aes(x=as.factor(air_cond),fill=as.factor(sewer)))+geom_bar(position = 'fill')
 
 #
 
 ggplot(data=mdata,aes(x=price,col = as.factor(air_cond)))+geom_freqpoly(bins=70)
 
 ggplot(data=mdata,aes(y=price,x=factor(rooms)))+geom_boxplot()
 
 ggplot(data=mdata,aes(y=price,x=factor(rooms),fill=factor(rooms)))+geom_boxplot()
 ggplot(data=mdata,aes(y=price,x=factor(rooms),fill=factor(air_cond)))+geom_boxplot()
 ggplot(data=mdata,aes(y=price,x=factor(rooms),fill=factor(sewer)))+geom_boxplot()
 ggplot(data=mdata,aes(y=price,x=factor(rooms),fill=factor(heat)))+geom_boxplot()
 ggplot(data=mdata,aes(y=price,x=rooms))+geom_smooth()
 ggplot(data=mdata,aes(y=age,x=price))+geom_smooth()
 ggplot(data=mdata,aes(y=age,x=price))+geom_smooth(se=F)
 ggplot(data=mdata,aes(y=age,x=price,col=factor(air_cond)))+geom_smooth(se=F)
 ggplot(data=mdata,aes(y=age,x=price,col=factor(air_cond)))+geom_smooth()
 ggplot(data=mdata,aes(y=price,x=living_area,col=factor(air_cond)))+geom_smooth()
 ggplot(data=mdata,aes(y=price,x=living_area,col=factor(air_cond)))+geom_smooth(se=F)
 ggplot(data=mdata,aes(y=price,x=living_area))+geom_point()+geom_smooth(se=F)
 ggplot(data=mdata,aes(y=price,x=living_area))+geom_point()+geom_smooth(method='lm',se=F) 
 ggplot(data=mdata,aes(y=price,x=living_area,col=factor(air_cond)))+geom_point()+geom_smooth(method='lm',se=F)
 ggplot(data=mdata,aes(y=price,x=living_area,col=factor(air_cond)))+geom_point()+geom_smooth(method='lm',se=F)+facet_grid(~air_cond)
 
 #note
 #fill aesthetic is for box , bar , histogram
 #col aesthetic is for smooth , point
 
 #adding different layers
 main_obj+labs(title = 'p vs r',x='Rooms',y='Price')->labels
 labels+theme(panel.background = element_rect(fill = '#FFDFD3'))->thme
 thme+theme(plot.title = element_text(hjust = 0.25,face='bold',colour = '#957DAD'))->tit
 tit+scale_y_continuous(labels = 'dollar')
 
 
 
 

  
