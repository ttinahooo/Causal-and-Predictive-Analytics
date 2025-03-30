**Task:**

Simple demand model on a pricing problem. This case shows how to use our model to set prices, and how omitted variables can ruin any decision the firm tries to make with statistics.

**Skill:**

Demand Model, Optimal Price, Causal Analysis, Neural Networks, Omitted Variables Bias Impacts


**Data:**

A subset of the most popular product, and we have prices, whether the product is featured or displayed, and the store.

**Study Design:**

## Use Demand Model to calculate the optimal price. 
```r
demandModel = lm(log(units)~pricePerCan+isFeature+isDisplay+factor(storeNum),data=caseData)
```

Create the data frame to get predictions of demand/profit margin. Note that all variables used in the model must have a value here in the data frame. (isFeature, isDisplay, storeNum)

```r
possiblePrices =data.frame(pricePerCan=seq(0,4,.01),isFeature=FALSE,isDisplay=FALSE,storeNum=3)
```

**Find the max profit.**

```r
possiblePrices$predictedDemand = exp(predict(demandModel,possiblePrices))
possiblePrices$profitMargin = possiblePrices$pricePerCan-.2
possiblePrices$profit = possiblePrices$profitMargin * possiblePrices$predictedDemand

# use which.max to find the maximized profit, or visualize
plot(possiblePrices$pricePerCan,possiblePrices$profit,xlab='Price Per Can',ylab='Expected Profit',type='l')
possiblePrices[which.max(possiblePrices$profit),]
```
<img width="571" alt="image" src="https://github.com/user-attachments/assets/38e0b59b-33be-43f3-b422-67c2f1693105" />


## Add interaction terms to the Demand Model. 
Reason: Demand for products that are featured/displayed is more responsive to changes in price. 
```r
demandModel = lm(log(units)~pricePerCan*(isFeature+isDisplay)+factor(storeNum),data=caseData)
summary(demandModel)
```
In this regression, the baseline coeﬃcient on pricePerCan is -1.20453, whereas in the previous analysis the coeﬃcient was -1.38687. This is because when you include interactions between features, displays, and prices, prices becomes less important in the baseline scenario, the baseline scenario no longer contains features or displays, where consumers are more price sensitive. So, here the consumers are less responsive to price changes, the optimal price in the analysis increased by 11 cents to 1.03.

## Having Omitted Variables Bias in the Demand Model. 

If we stop controlling features and displays, the price coefficient will be biased, making prices seem more important than they actually are.

## Estimate a Neural Network as a Demand Model for Price Optimization

It is using a [neural network](https://www.youtube.com/watch?v=jmmW0F0biz0) to forecast demand, but its primary purpose is not pure predictive analysis—it’s a demonstration of omitted variable bias and price optimization. 

A predictive analysis requires:

1. Train/Test Split: Data partitioned into training (model fitting) and testing (evaluation).

2. Performance Metrics: RMSE, accuracy, etc., on unseen test data to validate generalizability.

3. Out-of-Sample Validation: Ensuring the model works beyond the data it was trained on.

```r
library('nnet')
```

```r
set.seed(238)
caseData$isFeature = caseData$isFeature*1
caseData$isDisplay = caseData$isDisplay*1


demandModel = nnet(log(units)~pricePerCan*(isFeature+isDisplay),data=caseData,subset=storeNum==3, size=4,linout=1,maxit=100000,trace=FALSE)
possiblePrices = data.frame(pricePerCan=seq(0,1,.01),isFeature=0,isDisplay = 0,storeNum = 3)
possiblePrices$predictedDemand =(predict(demandModel,possiblePrices))
possiblePrices$profitMargin = possiblePrices$pricePerCan-.2
possiblePrices$profit = possiblePrices$profitMargin * possiblePrices$predictedDemand
possiblePrices$pricePerCan[which.max(possiblePrices$profit)]
```

Here the point is that if we don’t control for features and displays, the optimal price drops. 

Omitted variable bias aﬀect all types of models, and it leads to systematically bad decisions.


















