library(tidyverse)
library(knitr)
library(kableExtra)

data_batch <- readr::read_csv("orders_for_rendering.csv")

purrr::walk(
  .x = data_batch$INVOICE_NUMBER,
  ~ rmarkdown::render(
    input = "InvoiceExample.Rmd",
    output_file = glue::glue("Invoice - {.x}.pdf"),
    params = list(INVOICE_NUMBER = {.x})
  )
)

