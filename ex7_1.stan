data {
  int<lower=0> N; // number of data points
  vector[N] x; // observation year
  vector[N] y; // observation number of drowned
  real xpred; // prediction year
  real pbm; 
  real pbs;
 }
parameters {
  real alpha;
  real beta;
  real<lower=0> sigma;
}
transformed parameters {
 vector[N] mu;
   mu = alpha + beta *x;
}
model {
  beta ~ normal(pbm, pbs);  // prior on the slope
  y ~ normal(mu, sigma);
}
generated quantities {
  real ypred;
  ypred = normal_rng(alpha + beta*xpred, sigma);
}

