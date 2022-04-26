This repository has code and synthetic data to accompany Relating Pneumococcal Carriage Among Children to Disease Rates Among Adults Before and After the Introduction of Conjugate Vaccines.W einberger DM, Grant LR, Weatherholtz RC, Warren JL, O'Brien KL, Hammitt LL. Am J Epidemiol. 2016 Jun 1;183(11):1055-62. doi: 10.1093/aje/kwv283. Epub 2016 May 2. https://pubmed.ncbi.nlm.nih.gov/27188949/

Synthetic data, resembling the real dataset are included for demonstration purposes. This code uses MCMC (in JAGS) to estimate the serotype-specific invasiveness of pneumococcal serotypes.

Note the code for the model here is streamlined compared to what was used in the original paper but yields similar results. In this code, everything is estimated in a single-stage Bayesian modl rather than a 2-stage model. This is computationally much more efficient and also yields cleaner results.
