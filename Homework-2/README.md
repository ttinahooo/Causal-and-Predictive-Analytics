**Task:**

Use FB ad dataset to explore omitted variable bias and interaction effects. The business goal is to evaluate **which attributes constitute successful ads**.

**Skill:**

1. A/B testing, Randomization, P-Value
2. R, Rmarkdown, with basic functions: read.csv, lm. summary, log, subset, as.Date, sort, etc.
3. Correct and clear code: easy-to-read, clear comments, good variable names, proper indentation, shor lines.

**Data:**

<img width="829" alt="Screenshot 2025-03-13 at 9 58 27 PM" src="https://github.com/user-attachments/assets/c7660e4d-3561-4de8-8b85-80f7496acee2" />


**Study Design:**

1. See which category is the most benefitable. Which category is associated with the largest number of clicks per dollar?
   (regression: clickPerDollar~factor(adType)+factor(category)+factor(placement)+factor(keywords)+factor(body)+ageMean) 
   
2. Explain coefficient meaning: The (ageMean) coefficient means that when (the targeted age) increase by one, the expected (number of clicks per dollar) (increases) by (2.60).

3. *Explain interaction effects*:
   (regression: clickPerDollar~factor(adType)+factor(category)+factor(placement)+factor(keywords)+factor(body)+ageMean+factor(category)*ageMean)

   Regression result:
   factor(category)eCom:ageMean  -0.36125; factor(category)Department:ageMean  0.41373
   Intepretation: When the targeted age increases by 1, the eCom category receives 0.36 fewer clicks per dollar than the cosmetics category. Older customers prefer cosmetics to eCom.

4. *Explain marginal effects*:
   The marginal effect of increasing ageMean by one for a retailer in the ‘Department’ category is: factor(category)Department:ageMean's coefficient + ageMean's coefficient. (Because categorical variable can only be 0 or 1.)

   Which category results in the most clicks per dollar for those with an ageMean of 25? 
    -48.69836 + 0.41373*25 = -38.35511 (Category:Department)
    -28.29490  -0.36125*25 = -37.32615 (Category:eCom)
    -60.24087 + 0.36446*25 = -51.12937 (Category:General)
    -48.37628 + 0.15944*25 = -44.39028 (Category:High)
    -41.47216 + 0.33229*25 = -33.16491 (Category:Retailer)
   So, the category is the base line category, which is Cosmetics.

   ageMean 2.41940
   
   factor(category)eCom -42.64 (no interaction term)
   
   factor(category)eCom -28.30 (with interaction term)
   
   The coefficient on eCom increased from -42.64 to -28.30. This is because this coefficient now represents the effect for those with an age of 0. (but where is the gap come from??)
   The positive effect of eCommerce is underestimated without the interaction effect. Because ageMean is associated with 0.36125 less of its impact, causing less negative effect within the ecommerce category.

**Insights/Comments:**
   Cosmetics is category with the largest number of clicks per dollar. Attention! Interaction effects and Marginal effects.
