# Separate script for testing#
# Student Abe Tsvik/CSR Mice - Body Weight/R_code/NYU Code - Abe/Notes.R #

# Here, I hard coded values into a matrix then table, and function "Katz_RR" is fully functional and works properly, see example below #


# Males #
# In this code, CS is 7/16 -> in code using centile cutoffs it is 8/15 #

NYU_m <- matrix(c(4, 7, 3, 2, 22, 16, 10, 14), ncol = 2)

rownames(NYU_m) <- c("VD", "CS", "CSR", "VF")
colnames(NYU_m) <- c("Normal Weight", "Overweight")

NYU_m <- as.table(NYU_m)

NYU_m

# Test making Katz function #

RR <- (phat1/phat2)
KatzRRlo <- (RR)*exp(-1.96*sqrt(((1-phat1)/(n1*phat1))+((1-phat2)/(n2*phat2))))
KatzRRhi <- (RR)*exp(1.96*sqrt(((1-phat1)/(n1*phat1))+((1-phat2)/(n2*phat2))))

katz_RR <- function(KatzRRhi, KatzRRlo, RR){
  return(paste("RR =", format(RR, nsmall = 2),",", "95% CI", "(",format(KatzRRlo), "-", format(KatzRRhi, nsmall= 2),")"))
}


# Create loop #

list<-list()
  
for (i in 2:nrow(NYU_m)){
  print(i)
  a <- NYU_m[i,1] %>% as.numeric
  b <- NYU_m[i,2] %>% as.numeric
  c <- NYU_m[1,1] %>% as.numeric
  d <- NYU_m[1,2] %>% as.numeric
  
# Assign values to calculate RR and 95% CI #

  n1 <- a+b
  n2 <- c+d
  phat1 <- a/(n1)
  phat2 <- c/(n2)
  
  RR <- (phat1/phat2)
  KatzRRlo <- (RR)*exp(-1.96*sqrt(((1-phat1)/(n1*phat1))+((1-phat2)/(n2*phat2))))
  KatzRRhi <- (RR)*exp(1.96*sqrt(((1-phat1)/(n1*phat1))+((1-phat2)/(n2*phat2))))
  
  # Execute function #
  
  list[i-1]<-katz_RR(KatzRRhi, KatzRRlo, RR)
  
}
a <- i[x,1] %>% as.numeric
b <- NYU_m[x,2]


list[1]
list[2]
list[3]

# Output should look like this ->     RR = 1.978261 , 95% CI ( 0.663201 - 5.90095 ) 
                                      RR = 1.50 , 95% CI ( 0.3924651 - 5.732994 )
                                      RR = 0.8125 , 95% CI ( 0.1675166 - 3.94084 )
