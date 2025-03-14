F_dt <- read.csv(file = "assignment2dataFacebook")
head(F_dt)

# Part 1.
# a) Suppose the firm is interested in identifying the keywords 
# they should use to get the largest number of clicks per dollar.
# Would this be a descriptive, predictive, or causal question? Why? 
# Answer in 30 words or less. (4 marks).
Casual. Because the company wants to modify the keywords to maximize profit.

# b) Run a regression with the following formula:

summary(lm(clickPerDollar~factor(adType)+factor(category)+factor(placement)+factor(keywords)+factor(body)+ageMean,data=F_dt))

Cosmetics is associated with the largest click number per dollar.


# c) In quantitative terms, what is the interpretation of the ageMean coefficient? 
# Answer in 30 words or less. (4 marks).

When the average age of the targeted consumers increases 1 unit with everything else stable, 
the number of clicks per dollar is associated with an inreasement of 2.6 clicks




# Part 2: Interaction Effects

# a) Add an interaction between factor(category) and ageMean as independent variables to the regression in 1b.
# What can we conclude from the factor(category)eCom:ageMean coefficient? Answer in 30 words or less. 
# Hint: The best answers here will discuss what this coefficient means accurately, and in terms for a 
# business audience would understand. (4 marks).


summary(lm(clickPerDollar~factor(adType)+factor(placement)+factor(keywords)+
               factor(body)+factor(category)*ageMean,data=F_dt))

Holding other variables constant, ecom gives you 28.65 less clickPerDollar than Cosmetics; ageMean will have a -0.36 impact on the effect of category changed from Cosmetics to eCom. 
So Cosmetics is better than e-Commerce in advertising, and will return about 29 more units of revenue by clicking.
We may focus on younger generation.



# b) According the results of the regression in part 2a, what is the marginal effect of increasing ageMean 
# by one for a retailer in the ‘Department’ category? Answer in 10 words or less.

# 2.41940+0.41373
2.83313


c) According the results of the regression in part 2a, which category results in the most clicks per dollar
for those with an ageMean of 25?
# the baseline is Cosmetics, so Department will have 38.355 less than cosmetics given age = 25.
-48.69836 + 0.41373*25 = -38.35511
-28.29490  -0.36125*25 = -37.32615
-60.24087 + 0.36446*25 = -51.12937
-48.37628 + 0.15944*25 = -44.39028
-41.47216 + 0.33229*25 = -33.16491

Answer:
Cosmetics


d) Compare the regression in part 2a with the regression in 1b. 
What happens to the coefficient of factor(category)eCom? Why do you think this happened?
Answer in 30 words or less. (4 marks).
2a:
factor(category)eCom                                                                         -28.29490
1b:
factor(category)eCom                                                                         -42.643506

the positive effect of eCommerce is underestimated without the interaction effect. Because ageMean is associated
with 0.36125 less of its impact, causing less negative effect within the ecommerce category.





