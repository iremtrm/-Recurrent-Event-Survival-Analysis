bladder <- read.csv("C:/Users/iremt/OneDrive/Desktop/seminer/bladder.csv", header = TRUE, sep = ";")
bladder[12:20, ]

library(dplyr)
library(survival)

bladder[bladder$stop <= bladder$start, ]


Y=Surv(bladder$start,bladder$stop,bladder$event==1)

coxph(Y ~ tx + num + size + cluster(id), data = bladder)



bladder<- bladder%>%
  group_by(id) %>%
  mutate(interval = row_number()) %>%
  ungroup()


coxph(Y ~ tx + num + size + strata(interval) + cluster(id), data = bladder)



# Etkile??imli Stratified Cox modeli 
# Sadece 1. ve 2. olaylar?? i??eren veriyle analiz yap??l??r
bladder_sub <- bladder %>% filter(interval <= 2)

# Stratification de??i??keni fakt??re ??evrilir
bladder_sub$interval_f <- as.factor(bladder_sub$interval)

# tx * interval etkile??imli model kurulmas??
cox_interaction <- coxph(Surv(start, stop, event) ~ tx * interval_f + num + size + cluster(id),
                         data = bladder_sub)

# Model ????kt??s??n??n g??sterilmesi
summary(cox_interaction)





attach(bladder)
bladder$start2=0

bladder$stop2 <- bladder$stop - bladder$start


data.frame(id,event,start,stop,start2,stop2)[12:20, ]


Y2=Surv(bladder$start2,bladder$stop2,bladder$event)

coxph(Y2 ~ tx + num + size + strata(interval) + cluster(id), data = bladder)


#1. Marginal Modeli

cox_marginal <- coxph(Surv(start, stop, event) ~ tx + num + size + cluster(id), data = bladder)

summary(cox_marginal)




#  Shared Frailty Modeli
cox_frailty <- coxph(Surv(start, stop, event) ~ tx + num + size + frailty(id), data = bladder)
summary(cox_frailty)


#Interaction Stratified Cox Modeli (SC)
cox_1 <- coxph(Surv(start, stop, event) ~ tx + num + size + cluster(id),
               data = bladder %>% filter(interval == 1))

summary(cox_1)


cox_2 <- coxph(Surv(start, stop, event) ~ tx + num + size + cluster(id),
               data = bladder %>% filter(interval == 2))

summary(cox_2)







