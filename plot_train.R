library("readxl")
data <- read_excel("HotelFinalDataset.xlsx")
print(data)
grouped_data <- setNames(aggregate(data$Rating, list(data$City), mean), c("City", "Value"))
print(grouped_data)

barplot(height=grouped_data$Value, names=grouped_data$City, las = 2, cex.names=0.6)