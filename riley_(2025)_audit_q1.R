#audit
setwd("C:/Users/riley/Desktop/audit stuff/FINAL")
df=read_csv("data/2025_q1.csv")

#chatgpt wrote this part
df<-df%>%mutate(late=days_to_close>lim)
x2 = df %>% group_by(claim_type) %>% summarise(n=n(),MeanDays=mean( days_to_close ),PctLate=mean(late))
x2

#save
write_csv(df,"FINAL.csv")