# Recurrent Survival Analysis: Bladder Cancer Case Study

This project performs a step-by-step **survival analysis of recurrent bladder cancer events** using the Cox proportional hazards model. It follows the methodological approach described in *Kleinbaum & Klein (2012), Chapter 8*, and uses R to replicate the process.

---

To model and interpret the **recurrence of bladder cancer tumors** using:
- Cox Proportional Hazards models
- Stratified Cox models
- Time-dependent covariates
- Robust variance estimation

---

##  Data

The dataset includes patients with multiple observed tumor recurrences over time. Variables include:
- `start`, `stop`, `event`: Time intervals
- `tx`: Treatment group (thiotepa vs. placebo)
- `num`: Initial number of tumors
- `size`: Initial tumor size

---

## Methods Applied

- Data layout for recurrent events (start–stop format)
- Cox PH model fitting
- Proportional hazards assumption testing (Schoenfeld residuals)
- Stratified Cox modeling
- Time-dependent covariate modeling
- Robust standard errors (clustered by patient ID)

---

##  R Packages Used

- `survival`
- `survminer`
- `dplyr`
- `ggplot2`

---

##  Output

- Hazard ratios and confidence intervals
- Proportional hazards test results
- Graphical diagnostics for PH assumption
- Interpretation of time-varying hazard effects

---

##  Reference

Kleinbaum, D.G., & Klein, M. (2012). *Survival Analysis: A Self-Learning Text* (3rd ed.), Chapter 8 – Recurrent Event Survival Analysis.

---

## Author

This project was developed as a part of a survival analysis assignment by **İrem** during advanced statistics coursework.

