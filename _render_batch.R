library(tidyverse)
library(knitr)
library(kableExtra)



transactionData <- read_csv('ES_Transactions_DataSheet_Compressed.csv') %>%
  filter(INVOICE_NUMBER==0 | (INVOICE_NUMBER>=1 & INVOICE_NUMBER<=5000) ) %>%
  write_csv('data_upload_batch_1.csv')

data_batch <- readr::read_csv("data_upload_batch_1.csv")

purrr::walk(
  .x = data_batch$INVOICE_NUMBER,
  ~ rmarkdown::render(
    input = "InvoiceExample.Rmd",
    output_file = glue::glue("Invoice - {.x}.pdf"),
    params = list(INVOICE_NUMBER = {.x})
  )
)



