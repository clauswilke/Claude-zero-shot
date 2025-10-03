## R script used to generate the example data in data.csv

library(tidyverse)

n <- 100 # number of observations
k <- 256 # number of features
types <- 5 # number of types

df <- tibble(
  type = rep(letters[1:types], each = n*k),
  type_idx = rep(1:types, each = n*k),
  id = rep(1:k, types*n),
  idx = glue::glue("X{id}"),
  sample = rep(rep(1:n, each = k), types),
  value = rnorm(types*n*k) + 0.3*cos(2*type_idx + 5*id/k)
) |>
  select(-id, -type_idx) |>
  pivot_wider(names_from = idx, values_from = value) |>
  select(-sample)

write_csv(df, "data.csv")

