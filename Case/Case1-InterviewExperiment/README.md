**Task:**

Using an experimental dataset to study which job applicants were most likely to get a call back. (Bertrand and Mullainathan 2004)

**Skill:**

1. how to interpret the results of regressions
2. how to analyze experimental data
3. the risks of analyzing non-experimental data


## **Experimental Variation**

```R 
lm(formula = call ~ ethnicity, data = resumeData)
```

Coefficients:

(Intercept) ethnicitycauc

0.06448     0.03203

**call** factor. Was the applicant called back? TRUE/FALSE

**ethnicity** factor. indicating ethnicity (i.e., Caucasian-sounding vs. African-American sounding first
name). afam(2435)/cauc(2435)

Since ethnicity is a categorical variable, it was converted to a binary 0-1 variable, which is 1 if the resume had an Caucasian sounding name.

This(if ethnicitycauc is set to 0, the expected value of call is 0.06448, or 6.448%) means that applicants with African-American sounding names got a reply 6.448% of the time.
The coeﬃcient of 0.03203 means that the probability of getting a call back is increased by 3.203% if the applicant was Caucasian.



## **Standard Error and Statistical Significance**

```R 
summary(lm(call~ethnicity,data=resumeData))
```

 
<img width="560" alt="image" src="https://github.com/user-attachments/assets/f4c58f19-a0fc-4541-90c2-bbb8d5f1a283" />

So, in this case, the plausible range for the eﬀect of being Caucasian is 0.032 ± 1.96 × 0.07785, or [0.01677, 0.0473]. Values outside this range are not plausible. In particular, _because 0 is not in the plausible range, this coeﬃcient is statistically significant_. Statistical significance simply tells you how plausible it is that the coeﬃcient is 0.


**visualize the range of plausible values (aka the confidence interval) of each coeﬃcient:**
```R 
install.packages('coefplot',repos='http://cran.us.r-project.org')
```
```R
coefplot(lm(call~ethnicity,data=resumeData))
```
<img width="829" alt="image" src="https://github.com/user-attachments/assets/50a15cd7-d773-45e2-a142-04e5fb8edceb" />




## **Benefits of experimental variation**

```R
summary(lm(call~ethnicity+experience+city+honors+school+college+volunteer+quality,data=resumeData))
```
<img width="530" alt="image" src="https://github.com/user-attachments/assets/4c42586b-5d19-4076-869e-935b1da8e4a6" />
<img width="543" alt="image" src="https://github.com/user-attachments/assets/302c9b07-7c9c-4793-859e-abad870650fa" />

```R
coefplot(lm(call~ethnicity+experience+city+honors+school+college+volunteer+quality,data=resumeData))
```
<img width="791" alt="image" src="https://github.com/user-attachments/assets/0373bb3a-52b3-46c2-bea7-1232d53fa9d5" />

**We can see that**
1. many variables have significant effects, like having an honors degree increased the call chance by about 8%.
2. R<sup>2</sup> increased
3. The coefficient of ethnicity didn't change much. So, **We were able to estimate the effect of ethnicity accurately even without additional control variables** because the experienment is properly run, and randomization ensures the only difference, on average, between the treatment and control group is the treatment effect. We don't need to control anything else, even if the R<sup>2</sup> is low.





