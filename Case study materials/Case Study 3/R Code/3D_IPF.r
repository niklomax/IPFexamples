######## Preperation ################
# install.packages("readxl") ##Install packages if necessary
# install.packages("mipfp")

## specify and load required packages, specify working directory
pkgs <- c("readxl","mipfp") 
lapply(pkgs, library, character.only = T)
setwd("C:/XXX/XXX")
#####################################

####Read and format constraints
age<-read_excel("Case Study 3 Data.xlsx", sheet=3)
age.cons<-age[2,5:12]
age.cons<-unlist(age.cons)

eth<-read_excel("Case Study 3 Data.xlsx", sheet=4)
eth.cons<-eth[2,5:9]
eth.cons<-unlist(eth.cons)

health<-read_excel("Case Study 3 Data.xlsx", sheet=5)
health.cons<-health[2,5:9]
health.cons<-unlist(health.cons)

####Set seed and IPF peramiters
target <- list (age.cons, eth.cons, health.cons)
descript <- list (1, 2, 3)
names <- list (names(age.cons), names(eth.cons), names(health.cons))

####Read seed
seed<-read_excel("Case Study 3 Data.xlsx", sheet=6, col_names=FALSE)
seed <-array((as.matrix(seed)),dim=c(8,5,5), dimnames=names)
seed<-aperm(seed, c(1,3,2))##transposes the array to match the input data

####Do IPF
result <- Ipfp(seed, descript, target, iter = 50, 
               print = TRUE, tol = 1e-5)

####Check result and write adjusted table
result$x.hat
write.csv (result$x.hat, "3DIPF_Result.csv")