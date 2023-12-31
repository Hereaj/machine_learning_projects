# Regression Template

# Importing the dataset
dataset = read.csv('data.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Regression Model to the dataset
# Create your regressor

# Predicting a new result with Polynomial Regression
y_pred = predict(regressor, data.frame(level = 6.5))

# Visualising the Regression Model Result
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), 
             color = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            color = 'blue') + 
  ggtitle('Title (Regression Model)') + 
  xlab('X') +
  ylab('y')

# Visualising the Regression Model Result (Smoother curve)
x_grid = seq(min(dataset$Level,), max(dataset$Level), 0.1)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), 
             color = 'red') + 
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            color = 'blue') + 
  ggtitle('Title (Regression Model)') + 
  xlab('X') +
  ylab('y')