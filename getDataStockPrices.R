library(BatchGetSymbols)

# we get data from 2000 to include the dot.com recovery 
first.date <- '2000-01-01'
# Until today 
last.date <- Sys.Date() 

freq.data <- 'daily'


symbols = c('MSFT','NVDA', 'AMZN', 'GOOGL','AAPL', '^IXIC')
aa =BatchGetSymbols(symbols, first.date = first.date, last.date = last.date, freq.data = freq.data)
# First element in the list is meta data of the download 

# relocate the date column for index in python 
aa[[2]] %>% dplyr::select(ref.date, everything() ) -> data_export

# Write to drive 
write.csv(data_export, 'stock_prices_from2000.csv', quote =F, row.names = F)
