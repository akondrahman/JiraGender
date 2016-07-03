library(effsize)
critical_block_file= "/Users/akond/Documents/AkondOneDrive/OneDrive/gender_issues_in_jira/data/C_B.csv"
major_block_file= "/Users/akond/Documents/AkondOneDrive/OneDrive/gender_issues_in_jira/data/Ma_B.csv"
minor_block_file= "/Users/akond/Documents/AkondOneDrive/OneDrive/gender_issues_in_jira/data/Mi_B.csv"


critical_block_data <- read.csv(file=critical_block_file, header=TRUE, sep=",")
major_block_data <- read.csv(file=major_block_file, header=TRUE, sep=",")
minor_block_data <- read.csv(file=minor_block_file, header=TRUE, sep=",")

getExtractedDetails<- function(male_, female_, infoParam) 
{
  print(infoParam)
  print("---------------")
  print("Extraction: Mean of Male")
  mean_male = mean(male_, na.rm=TRUE)
  print(mean_male)
  print("Extraction: Mean of Female")
  mean_female = mean(female_, na.rm=TRUE)
  print(mean_female)  
  print("Extraction: S.D of Male")
  sd_male = sd(male_, na.rm = TRUE)
  print(sd_male)
  print("Extraction: S.D of Female")
  sd_female = sd(female_, na.rm = TRUE) 
  print(sd_female)  
  print("---------------")  
}

perform_t_tests <- function(maleParam, femaleParam, infoParam) 
{
  print(infoParam)  
  print("-------------------------")
  print("M != F")
  t_test_output <- t.test(maleParam, femaleParam, alternative="two.sided", var.equal=FALSE, paired=FALSE) 
  print(t_test_output)
  print("-------------------------")  
  print("M > F")  
  t_test_output <- t.test(maleParam, femaleParam, alternative="greater", var.equal=FALSE, paired=FALSE) 
  print(t_test_output)
  print("-------------------------")  
  print("M < F")    
  t_test_output <- t.test(maleParam, femaleParam, alternative="less", var.equal=FALSE, paired=FALSE) 
  print(t_test_output )
  print("-------------------------")  
}

getCohen<- function(cohen_amount_male, cohen_amount_female, infoParam) 
{
  print(infoParam)  
  print("---------------")
  mean_male = mean(cohen_amount_male, na.rm=FALSE)
  mean_female = mean(cohen_amount_female, na.rm=FALSE)
  
  sd_male = sd(cohen_amount_male, na.rm = FALSE)
  sd_female = sd(cohen_amount_female, na.rm = FALSE) 
  
  cohen_numerator = mean_male - mean_female 
  cohen_denominator = sqrt(( sd_male ^ 2 + sd_female ^ 2 ) / 2 )
  cohen_ = cohen_numerator / cohen_denominator 
  print("Finally:::Cohen's D:::")
  print(cohen_)
  print("---------------")  
}

getA12 <- function(m_Param, f_Param, infoParam)
{
  print(infoParam)
  print("---------------")
  print(":::::VD-A12:::::")
  print(VD.A( m_Param, f_Param))    
  print("---------------")  
}

getCliffs <- function(m_Param, f_Param, infoParam)
{
  print(":::::Cliffs-Delta:::::")
  print(infoParam)
  res_effect_ = cliff.delta(m_Param,  f_Param, return.dm=FALSE)
  print(res_effect_)  
}

performIndiAnalysis <- function(m_Param, f_Param, infoParam)
{
  #Step-1 
  getExtractedDetails(m_Param, f_Param, infoParam)
  #Step-2 
  m_Param_Mod <- na.omit(m_Param)
  f_Param_Mod <- na.omit(f_Param) 
  #Step-3
  perform_t_tests(m_Param_Mod, f_Param_Mod, infoParam)  
  #Step-4 
  getCohen(m_Param_Mod, f_Param_Mod, infoParam)
  #Step-5 
  getA12(m_Param_Mod, f_Param_Mod, infoParam)
  # Step-6
  getCliffs(m_Param_Mod, f_Param_Mod, infoParam)
}




performAnalysis<- function(dataParam) 
{ 
  ## Female vs Male
  f_ <- dataParam$F
  m_ <- dataParam$M  
  performIndiAnalysis(m_, f_, "### Critical Blocker:M:F: ###")
}

performAnalysis(critical_block_data)
performAnalysis(major_block_data)
performAnalysis(minor_block_data)
