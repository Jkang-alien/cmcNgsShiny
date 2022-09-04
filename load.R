id <- "M22-1111"
id_final <- "M22-001111"

library(stringr)

str_length(id)
str_length(id_final)

idSplits <- str_split(id, "-") |> unlist()
lengthZero <- 6 - str_length(idSplits[2])
zeros <- str_dup("0", lengthZero)
str_c(idSplits[1], "-", zeros, idSplits[2])

id6digit <- function(id){
  idSplits <- str_split(id, "-") |> unlist()
  
  if(length(idSplits) != 2)
    stop("please check id format (M**-numbers)")
  if(str_length(idSplits[2]) > 6) 
     stop("please check id format. The id number digit should be less than 6")
  
  lengthZero <- 6 - str_length(idSplits[2])
  
  zeros <- str_dup("0", lengthZero)
  str_c(idSplits[1], "-", zeros, idSplits[2])
}

id <- "M22-111"
id6digit(id)
