
lambda = 0.2
mu = 1/lambda
sd = 1/lambda
var = 1/lambda^2
n = 40

set.seed(333)
mns = NULL
for(i in 1:1000) {
  mns <- c(mns, mean(rexp(n = n, rate = lambda)))
}

sample_mu <- mean(mns)
sample_var <- var(mns)

library("ggplot2")

ggplot(data.frame(mns), aes(mns)) + 
  geom_histogram(aes(y = ..density..), fill="steelblue") +
  stat_function(fun = dnorm,
                args = list(mean=mu,sd=sd/sqrt(n)),
                size = 2) +
  geom_vline(xintercept = mu, color="red") +
  geom_vline(xintercept = sample_mu, color="purple") +
  theme_bw()

