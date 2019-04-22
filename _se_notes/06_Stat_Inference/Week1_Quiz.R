#=============================
# Q1
#=============================

father_or_mother <- 0.17 
father <- 0.12
father_and_mother <- 0.06

# what is the probabilty the mother has the disease?
# A = mother
# B = father
# P(A | B) = P(A) + P(B) - P(A & B)
# 0.17 = P(A) + 0.12 - 0.06
# 0.17 - 0.12 + 0.06

0.17 - 0.12 + 0.06
# = 0.11


#=============================
# Q2
#=============================

?qunif
qunif(p=0.75, min = 0, max = 1)
# = 0.75


#=============================
# Q3
#=============================


#=============================
# Q4
#=============================


#=============================
# Q5
#=============================

x <- 1:4
p <- x/sum(x)
temp <- rbind(x, p)
rownames(temp) <- c("X", "Prob")
temp

1*0.1 + 2*0.2 + 3*0.3 + 4*0.4
fi <- temp["X",]
xi <- temp["Prob",] 
  
product <- fi*xi
sum(product)

#=============================
# Q6
#=============================

sens <- 0.75
spec <- 0.52

+_P <- 0.30

# Solve for P(P | +)

# Bayes...
# P(A | B) = { P(B | A) * P(A) } / P(B)

# sense = P(+ | P) = 0.75
# spec =  P(- | ~P) = 0.52
# P(P) = 0.30

# P(D | +) = P(+ | D) * P(D) / ( P(+ | D) * P(D) + P(+ | ~D) * P(~D) )
# P(P | +) = P(+ | P) * P(P) / ( P(+ | P) * P(P) + P(+ | ~P) * P(~P) )

numerator <- 0.75*0.30
denominator <- numerator + (1-0.52) * (1-0.30)
numerator / denominator
# = 0.40