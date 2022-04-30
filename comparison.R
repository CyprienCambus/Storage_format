library(microbenchmark)
library(arrow)
library(ggplot2)
library(RSQLite)


# Read the original data as csv 
df_csv <- read.csv("data/data_uci.csv")

# Save data on feather file, RData, rds

# write_feather(df_csv,"data_uci.feather")
# save(df_csv, file = "data_uci.RData")
# saveRDS(df_csv, file = "data_uci.Rds")
#write_parquet(df_csv,"data_uci.parquet")
db <- dbConnect(SQLite(), "data/data_uci.sqlite")
# dbWriteTable(db, "database", df_csv)



# Comparing reading time for each method


mbm <- microbenchmark("read_csv" = { 
                        read.csv("data/data_uci.csv") 
                      },
                      "RData" = {
                        load("data/data_uci.RData")
                      },
                      "RDS" = {
                        readRDS("data/data_uci.Rds")
                      },
                      "sqlite" = {
                        dbReadTable(db, "database")
                      },
                      "feather" = {
                        read_feather("data/data_uci.feather")
                      },
                      "parquet" = {
                        read_parquet("data/data_uci.parquet")
                      },
                      times = 150)
mbm


autoplot(mbm) + ggtitle("Storage format - Comparison of loading times")
