library(data.table)
library(here)


# Read the data -----------------------------------------------------------
dt <- 
    fread(
      here::here(
        '2021_Week_1_Bikes',
        'Input_PD_2021_Wk_1_Input_Bike Sales.csv'))


# Task 1 - Split the 'Store-Bike' field into 'Store' and 'Bike' 

dt[, c("Store", "Bike") := tstrsplit(`Store - Bike`, " - ", fixed = TRUE)]

# Task 2 - Clean up the 'Bike' field to leave just three values in the 'Bike' field (Mountain, Gravel, Road)

dt[Bike %in% c('Rood', 'Rowd'), Bike := 'Road']
dt[Bike %in% c('Mountaen'), Bike := 'Mountain']
dt[Bike %in% c('Graval', 'Gravle'), Bike := 'Gravel']


# Task 3 - Create two different cuts of the date field: 'quarter' and 'day of month'
dt[, Date := as.Date(Date, format = '%d/%m/%y')]
dt[, day.of.month := format(Date, '%d')]
dt[, quarter := quarters(Date)]

# Task 4 - Remove the first 10 orders as they are test values 
dt <- dt[-(1:10)]

# Task 5 - Output the data as a csv
fwrite(
  dt[,.(
    Quarter, day.of.month, Store,
    Bike, `Order ID`, `Customer Age`,
    `Bike Value`, `Existing Customer?`)],
  here::here(
    '2021_Week_1_Bikes',
    'Solution_PD_2021_Wk_1_Input_Bike Sales.csv'))