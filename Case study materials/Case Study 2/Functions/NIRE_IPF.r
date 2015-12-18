################################################################
##Acknowlegement: This source code has been adapted from that 
##produced by Eddie Hunsinger and Nels Tomlinson,
##Alaska Department of Labor and Workforce Development, 
##2009 (Updated April 2011)
##There is not warranty for this code.
################################################################

#Read in the IPF function.
source(".../Case Study 2/Functions/ipf2df.txt")

#Read in the seed data.
seed <- read.table(file=".../Case Study 2/Seed/Cens_Seed.csv", 
                   header=F, sep=",")
seed #Inspect the seed you just read in: did you get the right numbers?

###########################################################################
#Read in the controls.
rowc<-read.table(file=".../Case Study 2/Margins/Row_02.csv", header=F, sep=",")
rowc <- as.matrix(rowc)

colc<-read.table(file=".../Case Study 2/Margins/Col_02.csv", header=F, sep=",")
colc <- as.matrix(colc)

#Run the IPF function and look at the output.
ipf2(rowc, colc, seed)


#Run the ipf2 function and write it out.
write.table(ipf2(rowc, colc, seed)$fitted.table, 
            file=".../Case Study 2/Output/Est2002.csv", sep=",")
