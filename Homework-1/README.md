**Task:**

EBay conducted an experimental study to determine the return of its advertising on search engines including Google, Bing, and Yahoo.

**Skill:**

1. A/B testing, Randomization, P-Value
2. R, Rmarkdown, with basic functions: read.csv, lm. summary, log, subset, as.Date, sort, etc.
3. Correct and clear code: easy-to-read, clear comments, good variable names, proper indentation, shor lines.

**Data:**

<img width="523" alt="image" src="https://github.com/user-attachments/assets/f6884b32-ac5b-4c90-9233-794e5b6e04f4" />

The variable isTreatmentPeriod indicates whether the treatment period had started.


**Study Design:**

0. Users are categorized by their market area. Once the treatment period started, the treatment group was no longer shown search ads from eBay.
   
|      |Treatment Group|Control Group|
|:-----:|:-----:|:-----:|
|Before|Ad|Ad|
|After |(No Ad)|Ad|

1. Compare revenues of the treatment group in pre-treatment period and treatment period. (regression: log(revenue)~isTreatmentPeriod, subset=treatment_group)

2. Check randomization. Compare revenues of the treatment group and control group in the pre-treatment period. (regression: log(revenue)~isTreatmentGroup, subset=before_treatment) p-value: 0.5698>0.05, we "fail to reject the null hypothesis" and conclude that there is not enough evidence of a difference in the population. Avery: "There's no statistically significant difference between the two groups, meaning no difference between the two is plausible."

3. Determine the effectiveness of eBay ads using treatment period data. Compare treatment group and control group in the treatment period. (regression: log(revenue)~isTreatmentGroup, subset=treatment_period) p-value: 0.7406>0.05


**Insights/Comments:**
  1. From (1), P-value = 0.04737<0.05, so the advertising has effect on revenue, and the coefficient estimates imply that ads increases revenue by about 4%. Since p=0.0474, so, ads might plausibly increase revenue by anywhere from .1% to 8%.
  
  <img width="695" alt="Screenshot 2025-03-13 at 7 35 54 PM" src="https://github.com/user-attachments/assets/6c0f9de7-a114-44a7-b9c9-47ead911871b" />
  
  2.  From (3), the effectiveness of ad: coefficient is -0.007494. But the p-value is 0.7406, too big, cannot reject the null hypothesis, so it's plausible that ad has no effect. Avery: "However, because of the size of the standard error, advertising could still plausibly increase revenue by as much as 3%" (?: If it's not statistically significant, do we still need to mention it? And it may also decrease revenue with a similar amount.)
     
   <img width="695" alt="Screenshot 2025-03-13 at 8 26 00 PM" src="https://github.com/user-attachments/assets/8fa6b00e-93bc-40e6-8999-e51deba7a38f" />

  3. In A/B testing, even if it is a bad model, it doesn't matter. The R-Squared in the last regression (the effectiveness test one) is 8.422e-06, but it doesn’t matter because this is a randomized experiment. A low R-Squared means control variables are not explaining a large part of the variance, but we only need the difference between treatment and control group.It's indicated by standard error. Even important omitted variables do not bias the results of A/B tests.
