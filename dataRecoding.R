
library(readODS)
data <- read_ods("sources/data-computing-RSCH-2.ods")

# probably shifted data in table

startcol <- which(colnames(data) == "1_Kon_HP_Form")
selrows <- which(data$`1_Kon_UP_Form` == "S/A")
data[selrows, (startcol):(startcol+3)] <- data[selrows, (startcol+1):(startcol+4)]

# inspect data and make consistent

# hist(data$Umfang)
  length <- data$Umfang

# table(data$Textgattung)
  text <- data$Textgattung
  text[text == "historisch"] <- "historic"
  text[grepl("narr", text)] <- "narrative"

# table(data$Synt._Ebene)
  syntax <- data$Synt._Ebene
  syntax[syntax == "epitaxe"] <- "absolute"
  syntax[syntax == "komplementativ"] <- "complementive"
  syntax[syntax == "adversative"] <- "adverbial"
  syntax[grepl("/", syntax)] <- NA

# table(data$Präposition)
  preposition <- data$Präposition
  preposition <- gsub(" .+$", "", preposition)
  preposition[preposition == "tros"] <- NA
  preposition[preposition == "erbyn"] <- NA
  preposition[preposition == "herwyd"] <- NA
  preposition[preposition == "trwy"] <- NA
  preposition[preposition == "yr"] <- NA
  preposition[preposition == "dan"] <- NA
 
 # table(data$Linearisierung)
  order <- data$Linearisierung
  order[order == "–"] <- NA
  order <- gsub("^.+nach.+$", "after", order)
  order <- gsub("^.+[vf]or.+$", "before", order)
  order[order != "after" & order != "before"] <- NA

# table(data$`1_Kon_HP_Form`)
  mainform <- data$`1_Kon_HP_Form`
  mainform[mainform == "–"] <- NA
  mainform[mainform == "Demo"] <- NA
  mainform <- gsub("[_ ].+$", "", mainform)

# table(data$`1_Kon_HP_Fx`)
  mainfunc <- data$`1_Kon_HP_Fx`
  mainfunc[mainfunc == "–"] <- NA
  mainfunc[mainfunc == "Adjunkt"] <- NA
  mainfunc[mainfunc == "NP"] <- NA
  mainfunc[mainfunc == "OBL"] <- NA
  mainfunc[mainfunc == "predicative"] <- NA
  mainfunc[mainfunc == "Pro_selbst"] <- NA
  mainfunc <- gsub("Teil von ", "", mainfunc)

# table(data$`1_Kon_UP_Form`)
  subform <- data$`1_Kon_UP_Form`
  subform[subform == "Demo"] <- NA
  subform <- gsub("[_ ].+$", "", subform)

# table(data$`1_Kon_UP_Fx`)
  subfunc <- data$`1_Kon_UP_Fx`
  subfunc[subfunc == "Adv"] <- NA
  subfunc <- gsub("Teil von ", "", subfunc)

# table(data$Vendler)
  vendler <- data$Vendler
  vendler[vendler == "achievment"] <- "achievement"
  vendler <- gsub("/.+$", "", vendler)

# table(data$transitivity)
  transitivity <- data$transitivity

# table(data$VN_oder_N)
  VN <- data$VN_oder_N

# table(data$Kontext)
  context <- data$Kontext
  context[context == "No-co-ref"] <- NA
  context[context == "NoS/A(UP)-co-ref"] <- NA
  context[context %in% names(which(table(context)<7))] <- NA
  
# compile recoded datatables

d <- data.frame(syntax, text, order, preposition, mainform, mainfunc, subform, subfunc, transitivity, vendler, context)

meta <- data.frame(
		  ID = data$ID
		, textID = data$TextID
		, sentenceID = data$Textstelle
		, sentence = data$Gesamtkontext
		, translation = data$Übersetzung
		, PP = data$'PP-Text'
		)

# write recoded datatables

write.csv(d, file = "data/data.csv")
write.csv(meta, file = "data/meta.csv")
