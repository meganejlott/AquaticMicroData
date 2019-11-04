library(tidyverse)
library(dplyr)
library(ggplot2)
library(wesanderson)
library(plyr)

d = readRDS("/Data/processed_data/data_cleaned.rds") 

d %>%
  filter(final_ecoli != "NA") %>%
  ggplot(aes(x = date, y = final_ecoli, group = sample_id, color = sample_id)) + 
  geom_point() + 
  geom_line() + 
  xlab("Date") + 
  ylab ("CFU/100mL") + 
  ggtitle("Enumeration of E. coli")


d %>%
  filter(final_ecoli != "NA") %>%
  ggplot(aes(x = date, y = log10(final_ecoli), group = sample_id, color = sample_id)) + 
  geom_point() + 
  geom_line() + 
  xlab("Date") + 
  ylab ("Log(CFU/100mL)") + 
  ggtitle("Enumeration of E. coli")

ggsave(filename="../Results/final_ecoli.png",plot=final_ecoli, width = 8, height = 7) 
ggsave(filename="../Results/log_final_ecoli.png",plot=log_final_ecoli, width = 8, height = 7) 


#Let's look at average E. coli by site 

data_summary = ddply(d, .(sample_id), summarise, mean_ecoli = mean(final_ecoli, na.rm = TRUE))


ave_ecoli = data_summary %>% ggplot(aes(x = sample_id, y = (mean_ecoli))) + geom_col()


log_ave_ecoli = data_summary %>% ggplot(aes(x = sample_id, y = log10(mean_ecoli))) + geom_col()

ggsave(filename="/Results/ave_ecoli.png",plot=ave_ecoli) 
ggsave(filename="../Results/log_ave_ecoli.png",plot=log_ave_ecoli) 


#E.coli by temp 

d %>% ggplot(aes(x = water_temp, y = (final_ecoli)) + geom_point()
  

d %>% ggplot(aes(x = water_temp, y = log10(final_ecoli)) + geom_point()
               

#E. coli by days since last rain

d %>% ggplot(aes(x = last_rain, y = log10(final_ecoli))) + 
  geom_point()



