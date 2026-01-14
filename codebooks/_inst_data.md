# Number of responses per institution

The number of responses from each instituion are available in the file `data/_inst_data.csv`.

| Variable | Description | Type | Values / Notes |
|----------|-------------|------|----------------|
| Institution | Name of the institution | String | One of 20 institutions |
| n | Number of survey respondents. | Integer | |
| n_surveyed | Number of researchers surveyed. | String | When there is a value for both `n_staff` and `n_pgr`, this column is the sum of these two values. Note that University of Surrey was unable to track the number of PGRs with whom they shared the survey, so the value for `n_surveyed` is recorded as `150+`. |
| n_staff | Number of staff researchers surveyed. | Integer | |
| n_pgr | Number of postgraduate research students surveyed. | String | Note that University of Surrey was unable to track the number of PGRs with whom they shared the survey, so the value for that institution is `?`. |
