library(rattle)
library(rpart)				    # Popular decision tree algorithm
library(rpart.plot)				# Enhanced tree plots


# read the dataframe that we exported to a csv with NexTint_Data_Demo.ipynb
clean_nextint <- read.csv("C:\\Users\\toby\\Documents\\R\\cleandf.csv",header=T)

# summarize the data
summary(clean_nextint)

#Create a categorical variable based on 'weeks alive.' I notice that the mean is 3.2
High = ifelse(clean_nextint[,7]>=5, 'Yes', 'No')
clean_nextint = data.frame(clean_nextint,High)
head(clean_nextint)

# delete extraneous columns like name, weeks alive, and the index
clean_nextint = clean_nextint[,-7]
clean_nextint = clean_nextint[,-6]
clean_nextint = clean_nextint[,-1]
head(clean_nextint)

# now make the plot
tree <- rpart(formula = High ~ ., data = crs$dataset[crs$train, c(crs$input, 
      crs$target)], method = "class", parms = list(split = "information"), 
      control = rpart.control(usesurrogate = 0, maxsurrogate = 0))
prp(tree)
fancyRpartPlot(tree) 
