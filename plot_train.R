library("readxl")
library(readr)
data <- read_excel("HotelFinalDataset.xlsx")
print(data)
grouped_data <- setNames(aggregate(data$Rating, list(data$City), mean), c("City", "Value"))
print(grouped_data)

barplot(height=grouped_data$Value, names=grouped_data$City, las = 2, cex.names=0.6)

plot_data <- data.frame(data$Rating, parse_number(data$Price))
plot_data <- na.omit(plot_data)
colnames(plot_data) <- c("Rating", "Price")
plot(plot_data$Rating, plot_data$Price)

plot_data_group <- setNames(aggregate(plot_data$Price, list(plot_data$Rating), mean), c("Rating", "AVG_Price"))

plot(plot_data_group$Rating, plot_data_group$AVG_Price, type = "b")

