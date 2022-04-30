# Storage_format

## Comparing loading times of different storage formats

The main purpose is to compare loading times between different common storage formats (csv, RData, rds, sqlite) and columnar (disk-)storage formats from `{Arrow}` package (parquet and feather).

Although the original dataset is not extremely large, the difference is striking. It could save a considerable amount of time when analyzing data and it could really speed up your Shiny apps !

Below, results of the comparison using 150 iterations. 

![Rplot](https://user-images.githubusercontent.com/63049162/166112507-666c07ae-466f-448c-9989-e28b9143d892.png)
