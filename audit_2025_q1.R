# Load and install packages 
library(tidyverse)

# Load the data
read_csv("data/2025_q1.csv")

# 

claims_small |> 
  summarize(
    avg_days = mean(days_to_close), share_late = mean(days_to_close > 30))

    
#chatgpt wrote this part
df<-df%>%mutate(late=days_to_close>lim)

x2 = df %>% group_by(claim_type) %>% summarise(n=n(),MeanDays=mean( days_to_close ),PctLate=mean(late))

x2

#save
write_csv(df,"FINAL.csv")
