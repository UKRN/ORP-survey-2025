# ORP-survey-2025

This repository contains the processed data and code used to create the UKRN ORP survey reports.

## To Edit Online

If you [edit the file online](https://github.com/UKRN/ORP-survey-2025/blob/master/UKRN-ORP-2025.qmd) and commit, it will automatically render a new version, which will show [on the website](https://ukrn.github.io/ORP-survey-2025/UKRN-ORP-2025.html) and also be [downloadable](https://github.com/UKRN/ORP-survey-2025/blob/master/UKRN-ORP-2025.html). Go to the [actions tab](https://github.com/UKRN/ORP-survey-2025/actions) to check the progress of the render and publish action (it can take a few minutes). Contact [Lisa DeBruine](mailto:debruine@gmail.com) if there are any problems.

## To Edit Offline

To create the institutional report, fFusing quarto. This requires files from the `data` and `scripts` folders, as well as `refs.bib`.

``` r
quarto::quarto_render("UKRN-ORP-2025.qmd")
```

The institutional reports were created using the script `UKRN-ORP-2025-institution.qmd`, but you will not be able to render the script without institutional data, which is private to each institution.