library("datasets")
data(ToothGrowth)

library("ggplot2")
library("dplyr")

ggplot(ToothGrowth, aes(x=factor(dose),y=len,fill=factor(dose))) +
  geom_boxplot() +
  facet_wrap(~supp) +
  labs(x="Dose of Vitamin C (mg)",y="Tooth Length",
       title="Length of Teeth by Dose Given Delivery Method")

ToothGrowth %>%
  group_by(supp,dose) %>%
  summarise(mean(len), sd(len))

g1 <- ToothGrowth %>% 
        filter(supp=="VC", dose==2) %>%
        select(len)

g2 <- ToothGrowth %>% 
        filter(supp=="VC", dose==0.5) %>%
        select(len)

t.test(x = g1, y=g2)

