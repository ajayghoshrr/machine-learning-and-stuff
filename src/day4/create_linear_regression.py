

'''
This is a program for making a linear regression function instead of using some packages
-----
Linear regression is a regression which will separate the data by a line.
Condition for linear regression is X and Y ( Data should be depended  - correlation must be high.
Lines equation is Y = MX + C
Y - Y axis value , X - X axis value, M - Slope, C is Y'(Y interception)

M = ((mean(x)*mean(y)) - mean(x*y) / (mean(x)* mean(x)) - mean(x*x)

To find the best fit line
'''


from statistics import mean
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import style
#plot syle
style.use('fivethirtyeight')
xs = np.array([1,2,3,4,5,6], dtype=np.float64)
ys = np.array([5,4,6,5,6,7], dtype=np.float64)
# finding  the slope and interception
def best_flt_slope_and_interception(xs, ys):
    m = ((mean(xs) * mean(ys)) - mean(xs*ys)) / ((mean(xs)*mean(xs)) - mean(xs*xs))
    b = mean(ys) - m*mean(xs)
    return m, b
m,b = best_flt_slope_and_interception(xs, ys)
#print(m)
regression_line = [(m*x)+b for x in xs]
# from the formulae predicting the next value
predict_x = 8
predict_y = (m*predict_x) + b
plt.scatter(xs, ys)
plt.scatter(predict_x, predict_y, color = 'r')
plt.plot(xs, regression_line)
plt.show()
