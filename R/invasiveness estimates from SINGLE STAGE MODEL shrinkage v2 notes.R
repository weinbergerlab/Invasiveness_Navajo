##/*4/28/2015--change so that beta0[i] ~ dnorm(0, 1e-3)  insetad of beta0[i] ~ dnorm(0, 1e-5)
  

#### Download JAGS ####
#install.packages("RCurl")
#install.packages("boot")
#install.packages("reshape2")



##SET RANDOM SEED
set.seed(123)


#############MODEL CODE################################################
jcode <- "

model{
#Loop for the serotypes and time periods 
for(i in 1:N_st_pers){  
	#################CARRIAGE
	ncarr [i] ~ dbin(true.prev[i], nswab[i]) #number of carriers in children, follow binom distrib ## Likelihood function derived from the data e.g. 25~bin(theta,100) L=25(power(theta))*(1-25)(power(1-theta))
	 logit.true.prev[i]~dnorm(0,1e-5)
  ## Prior for the unobserved true prevalence 
  true.prev[i] <- exp(logit.true.prev[i])/(1+exp(logit.true.prev[i]))   # provide the limits for the uniform prior below

	#################IPD INCIDENCE
	nipd[i] ~dpois(lambda[i]) #likelihood for N IPD cases 
	log(lambda[i]) <- log.true.inv.st[st.index[i]] + log(true.prev[i])  +log(offset[i]/10000)  
  ##Prior on invasiveness
   }

#Serotype-level loop
for(j in 1:N_sts){
  ######SEROTYPE INVASIVENESS
  log.true.inv.st[j]~dnorm(log.ave.inv, ave.inv.disp)
  }
  sd1.disp.ave.inv~dunif(0,100)
	ave.inv.disp<- 1/sd1.disp.ave.inv^2

  #Average invasiveness across all serotypes--serotypes with little data will shrink to this value
  log.ave.inv ~dnorm(0, 1e-5) 

}"
