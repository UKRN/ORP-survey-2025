# ORP-survey-2025

This repository contains the processed data and code used to create the UKRN ORP survey reports.

To create the institutional report, render `UKRN-ORP-2025.qmd` using quarto. This requires files from the `data` and `scripts` folders, as well as `refs.bib`.

``` r
quarto::quarto_render("UKRN-ORP-2025.qmd")
```

The institutional reports were created using the script `UKRN-ORP-2025-institution.qmd`, but you will not be able to render the script without insttutional data, which is provate to each institution.