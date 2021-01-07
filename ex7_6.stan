data {
  int<lower=0> N; // number of data points
  int<lower=0> K; // number of groups
  int<lower=1,upper=K> x[N]; // group indicator
  vector[N] y; // target
}
parameters {
  real mu0; // prior mean
  real<lower=0> sigma0; // prior std
  vector[K] mu; // group means
  real<lower=0> sigma; // group stds
}
model {
  mu0 ~ normal(50, 10); // weakly informative prior
  sigma0 ~ cauchy(0,4); // weakly informative prior
  mu ~ normal(mu0, sigma0); // population prior with unknown parameters
  sigma ~ cauchy(0,4); // weakly informative prior
  y ~ normal(mu[x] , sigma);
}
generated quantities {
  real ypred;
  real mu_7;
  ypred = normal_rng(mu[6], sigma);
  mu_7 = normal_rng(mu0, sigma);
}

