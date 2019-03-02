# paystack
Wrapper functions for the Paystack API. A more thorough documentation would be constantly updated [here](http://webne.me/paystack-docs/) where you'll be able to see the expected outputs.

Help pages, containing the functions and the params they receieve can be found [here](http://webne.me/paystack-docs/basics.html#help-pages)


Installation
=========================================================
To install this package run
```{r eval=FALSE}
devtools::install_github("ebinabo/paystack")
```

I understand newer versions of RStudio don't handle downloading from github properly so I've included a manual_installation script as well.

All the lines are commented by default so Ctrl + A, Ctrl + C, Ctrl + Enter. After it's done, delete that script and go to tabs -> Build -> Install and Restart

Please unzip the file to your downloads or anywhere but the reserved folder in ~Documents/R/win-lib/version folder

Set Keys
=========================================================

```{r}
set_keys("", "sk_test_s3cr3tk3y")$secret
```
equivalent to -H "Authorization: Bearer SECRET_KEY"

Notice how the commented line has an empty chr string and `$` to subset the secret key. The first arg is the public key and could be accessed by filling the first arg and subset by replacing secret with public.

Please keep your keys secure

- Don't upload .Rhistory or .RData files to github public repos
- If you're building a Shiny app, you could save them in .rda files and read from them. This could be done locally or internationally(lol), I mean on a secure server but you'll most likely have to do that manually.
```{r eval=FALSE}
set_keys("pk_test_pub1ickey", "")$public %>% saveRDS(file = "path_to_file")
```
- Using the keyring package, you could read and write your keys to a secure location on your computer and still lock them with passwords, cool right?

General Function Structure
========================================================

```{r eval=FALSE}
_function_name(authorization, path_param, ...)
```

The general function structure is shown above,

- most of the functions require authorization which is the result of running set_keys() from the previous slides

- path_param is any string that should be concatenated with the root api
```{r }
paste(urls$transaction$base, "19822", sep = "/") # to request a transaction with id 19822
```

- ... are for you to pass in any other body parameters you might want to use, however, required parameters must be passed in so as to avoid "status": false

eg of how to enter them is

```{r eval=FALSE}
_function_name(authorization, path_param, reference = "28374", amount = 500000)
```

for as many query parameters you might want to include.

if you would need a nested json file returned, just wrap the inner details in a list.

```{r eval=FALSE}
list(email = "customer@email.com", amount = 500000)
```

Would you like to contribute?
=======================================================

- Fork the project & clone locally.
- Create an upstream remote and sync your local copy before you branch.
- Branch for each separate piece of work.
- Do the work, write good commit messages, and send me a mail at edgarjohn95@gmail.com (would be nice if you mail me first)
- Push to your origin repository.
- Create a new PR in GitHub.

You could read details on this post at https://akrabat.com/the-beginners-guide-to-contributing-to-a-github-project/

Resources
=======================================================

Reference : <https://developers.paystack.co/v1.0/reference>

Managing Secrets : <https://httr.r-lib.org/articles/secrets.html>

Keyring : <https://github.com/r-lib/keyring>

