#' ---
#' title: "Predicting Subordination Strategies"
#' author: "Michael Cysouw"
#' date: "`r Sys.Date()`"
#' ---

# make html-version of this manual with:
# rmarkdown::render("analysis.R")

# libraries

library(qlcMatrix)
library(phangorn)
library(vioplot)
library(partykit)
library(randomForest)
library(randomForestExplainer)
library(rpart)
library(rpart.plot)
library(C50)
library(nnet)

# read recoded data

d <- read.csv("data/data.csv", row.names = 1)
m <- read.csv("data/meta.csv", row.names = 1)

# MBB: adverbial -> adjunct
# rename factor
levels(d$syntax)[levels(d$syntax)=="adverbial"] <- "ADJ"
levels(d$syntax)[levels(d$syntax)=="adnominal"] <- "ADN"
levels(d$syntax)[levels(d$syntax)=="complementive"] <- "COMPL"
levels(d$syntax)[levels(d$syntax)=="absolute"] <- "ABS"

# global correlations, using chuprov's T as a measure of similarity between nominal variables. preposition, order and text seem to be most important

dist <- as.dist(1-qlcMatrix::sim.att(d))

plot(hclust(dist))

nnet <- phangorn::neighborNet(dist)
plot(nnet, "2D")

# raw frequencies of main correlations

(freq <- table(d$syntax, d$preposition, d$order, d$text))

# overall distribution, split according to syntax

overall <- sapply(1:4, function(x){as.vector(freq[x,,,])})
colnames(overall) <- dimnames(freq)[[1]]

# NeighborNet

nnet <- phangorn::neighborNet(dist(t(overall)))
plot(nnet, "2D")

# distribution of "yn", split according to syntax

yn <- sapply(1:4, function(x){as.vector(freq[x,"yn",,])})
colnames(yn) <- dimnames(freq)[[1]]


# NeighborNet

nnet <- phangorn::neighborNet(dist(t(yn)))
plot(nnet, "2D")

# length of phrase
# absolute > adverbial > complementive > adnominal

lengthPP <- sapply(gregexpr(" ", m$PP), length) + 1

vioplot::vioplot(lengthPP ~ d$syntax) 
title(ylab = "Length of PP")

# decision tree

forest <- randomForest::randomForest(syntax ~ . 
			, data = d
			, na.action = "na.omit"
			, localImp = TRUE
			)
	
# This makes a nice report of the random forest		
# randomForestExplainer::explain_forest(forest, data = d)

# rpart

tree <- rpart::rpart(syntax ~ . , data = d)
print(as.party(tree))

tree <- rpart::rpart(syntax ~ preposition + order + text, data = d)
print(as.party(tree))

# MBB: über pdf() kann man das PDF mit Parametern direkt erzeugen, die Datei landet im Arbeitsverzeichnis des R-Dokuments (besser so?)
pdf("randomforest.pdf", width=10,height=5)
rpart.plot::rpart.plot(tree)
dev.off()

# C50

# MBB: hier werden die Faktoren neu angeordnet, das beeinflusst dann auch die Reihenfolge in den Diagrammen
d$syntax <- factor(d$syntax, levels = c("ADJ", "COMPL", "ABS", "ADN"))

tree <- C50::C5.0(syntax ~ . , data = d)
print(as.party(tree))

tree <- C50::C5.0(syntax ~ preposition + order + text, data = d)
print(as.party(tree))

# MBB: gleich wie bei Randomforest, aber hier gibt es das Problem, das man die Fontgröße anpassen muss. Ich bin nicht ganz zufrieden mit dem Ergebnis, aber s. Link unten
#pdf("C50.pdf", width=25,height=15)
# https://stackoverflow.com/questions/38785507/changing-labels-size-while-plotting-conditional-inference-trees-in-r
plot(tree)
#dev.off()


# multinomial regression - difficult to interpret!
# baseline

d$syntax <- relevel(d$syntax, ref = "adnominal")
d$preposition <- relevel(d$preposition, ref = "yn")
d$mainform <- relevel(d$mainform, ref = "Verb")
d$mainfunc <- relevel(d$mainfunc, ref = "S/A")
d$subform <- relevel(d$subform, ref = "implizit")
d$subfunc <- relevel(d$subfunc, ref = "S/A")
d$order <- relevel(d$order, ref = "before")

# significances

test <- multinom(syntax ~ ., data = d)
z <- summary(test)$coefficients/summary(test)$standard.errors
p <- (1 - pnorm(abs(z), 0, 1)) * 2
t(p)

# adverbial: gwedy, y, mainfunc Poss
# complementive: text narrative, mainfunc G
# epitaxis: text narrative, order after, mainform Implicit mainfunc P, intransitive

# select columns

test <- multinom(syntax ~ preposition + order + text, data = d)
z <- summary(test)$coefficients/summary(test)$standard.errors
p <- (1 - pnorm(abs(z), 0, 1)) * 2
t(p)

# with interactions

d$preposition <- relevel(d$preposition, ref = "wrth")
test <- multinom(syntax ~ order * text * preposition, data = d)
z <- summary(test)$coefficients/summary(test)$standard.errors
p <- (1 - pnorm(abs(z), 0, 1)) * 2
p[p>.001] <- 0
t(p)


