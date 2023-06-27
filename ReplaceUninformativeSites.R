library(ape)
library(phylotools)
library(stringi)

##this code reads in a phylip and removes phylogenetically uninformative sites, 
##replacing them with whatever you specify.

file <- read.phylip("oldinput.phy")
replacementChar <- "N"



namesPhy <- file$seq.name
SeqList <- list()
 
for (i in 1:length(file$seq.name)){
  SeqList[[i]] <- strsplit(file$seq.text[i],split = "")
}
names(SeqList) <- namesPhy

long <- 1
for (long in 1:length(SeqList[[1]][[1]])){
  aval <- 0
  tval <- 0
  gval <- 0
  cval <- 0
  ##count the amount of each base
  for (i in 1:length(file$seq.name)){
    if (SeqList[[i]][[1]][long]=="A"){
      aval <- aval+1
    }
    else if (SeqList[[i]][[1]][long]=="T"){
      tval<- tval+1
    }
    else if (SeqList[[i]][[1]][long]=="G"){
      gval<- gval+1
    }
    else if (SeqList[[i]][[1]][long]=="C"){
      cval<- cval+1
    }
  }
  ##replace uninformative sites with your replacement character
  if (aval==1){
    for (i in 1:length(file$seq.name)){
      if (SeqList[[i]][[1]][long]=="A"){
        SeqList[[i]][[1]][long] <- replacementChar
      }
  }}
  else if (tval==1){
    for (i in 1:length(file$seq.name)){
      if (SeqList[[i]][[1]][long]=="T"){
        SeqList[[i]][[1]][long] <- replacementChar
      }
  }}
  else if (gval==1){
    for (i in 1:length(file$seq.name)){
      if (SeqList[[i]][[1]][long]=="G"){
        SeqList[[i]][[1]][long] <- replacementChar
      }
  }}
  else if (cval==1){
    for (i in 1:length(file$seq.name)){
      if (SeqList[[i]][[1]][long]=="C"){
        SeqList[[i]][[1]][long] <- replacementChar
      }
  }}
}
FinalList <- list()
for (i in 1:length(file$seq.name)){
  FinalList[[i]] <- stri_paste(SeqList[[i]][[1]], collapse='')
}
names(FinalList) <- namesPhy

sink("output.phy")
cat(length(file$seq.name), "\t", length(SeqList[[1]][[1]]), "\n")
for (i in 1:length(file$seq.name)){
  cat(file$seq.name[i], "\t", FinalList[[i]], "\n")
}
sink()
