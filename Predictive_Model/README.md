**Task:**

Simple demand model on a pricing problem. This case shows how to use our model to set prices, and how omitted variables can ruin any decision the firm tries to make with statistics.

**Skill:**


**Data:**


**Study Design:**

## Use Demand Model to calculate the optimal price. 
```r
demandModel = lm(log(units)~pricePerCan+isFeature+isDisplay+factor(storeNum),data=caseData)
```

Create the data frame to get predictions of demand/profit margin. Note that all variables used in the model must have a value here in the data frame. (isFeature, isDisplay, storeNum)

```r
possiblePrices =data.frame(pricePerCan=seq(0,4,.01),isFeature=FALSE,isDisplay=FALSE,storeNum=3)
```

**Find the max profit:**

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



