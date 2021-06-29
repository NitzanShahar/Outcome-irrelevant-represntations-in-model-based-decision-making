#aim: aggregate and preprocess behavioral data
#contributor: Nitzan Shahar
rm(list=ls())



# aggregate csv files -----------------------------------------------------
files=dir('rawdata/test/',full.names =T)
df   =do.call(rbind,lapply(files, function(i) {cbind(read.csv(i),substr(i,22,24))}))

df = data.frame (
  subject      = as.numeric(df[,18]),
  trial        = df$trial,
  
  personL      = df$Lperson,
  personR      = df$Rperson,
  person_ch    = df$ChosenP,
  person_key   = (df$Key1=='left')*1, #1 is left and 0 is right response key
  person_rt    = df$RT1/1000,
  
  first_item   = (df$Veg.Clothing.1st=="['VegFirst']")*1, #0 if the first item presented was ????
  itemA_ev     = df$Probs.Ch2, #expected value for the first item
  itemA_reward = df$Ch2.Fdbck,
  itemA_key    = (df$Ch2.Key=='left')*1, #1 is left and 0 is right response key,
  itemA_rt     = df$Ch2.RT/1000,
  itemB_ev     = df$Probs.Ch3, #expected value for the first item
  itemB_reward = df$Ch3.Fdbck,
  itemB_key    = (df$Ch3.Key=='left')*1, #1 is left and 0 is right response key,
  itemB_rt     = df$Ch3.RT/1000,
  
  iti          = df$iti

)
  
  
head(df)  

