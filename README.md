# Report for Week of 7-6-20

## Github Actions and `pkgdown`
To be honest, the whole devops side of the project (and software development in general) has been lost of me. I don't really understand what Github Actions or Github workflows are or why they're useful. I don't really understand how to use `pkgdown`. So, today we must do research into the nature of both of these systems.

### Github Actions
 Well, to get started with Github Actions (GA) - _A way to trigger (workflow) task when one or more events (pull request, issue, merging) have occurred within a repo_. one needs a Github repo. Additionally Within that repo a .yml file is specified (workflow.yml):

 ```
 name: hyperSpec CI

 on:
    event:
        branches: [develop]

jobs:
    test_pull_request:
    runs-on: ubuntu-latest
    steps:
        - uses: actions/
        - uses: actions/
            with:
            ...
        - run: ..
        - run: ..
 ```

 There are a number of open-source .yml solutions, as well as, configurations one can specify.

### Secrets
So, what is the difference between "personal access tokens", "Github secrets", "keys", etc.

* Personal Access Tokens - Personal access tokens (PATs) are an alternative to using passwords for authentication to GitHub when using the GitHub API or the command line.

* Secrets -

### `pkgdown`
According to the main website for `pkgdown`
> pkgdown is designed to make it quick and easy to build a website for your package.


### `drat`
According to the maintainers, "Drat is an R package which makes it really easy to provide R packages via a repository, and also makes it easy to use such repositories for package installation and upgrades." via:
> Drat tries to help here and supports two principal modes:
>
> * GitHub by leveraging gh-pages
> * Other repos by using other storage where you can write and provide html access

### Issue #2: Use Github Actions to Move .tar.gz over to hySpc.pkgs
According to Bryan, the team will be using `drat` and `hySpc.pkgs` to, "[hold] certain packages in the `r-hyperspec` series (in particular, data-rich packages that are too large to be distributed on CRAN)." The purpose of this is to avoid using git-lfs, and `make` and so that users can just install these large than life pkgs directly: `install_github(hySpc.pkgs)`. With that being said, we will still need CI/CD via GA. So, to test this out we're going to move `hySpc.read.Witec` to `hySpc.pkgs`


#### Issue #2: Chef Hanson, Chef Oduniyi -- Serving up some actions
Over the weekend Bryan and I worked on fleshing out our drat formula, which basically looks like this, but in GA/.yml speak:

```R
if (package.size > CRAN.size) {
 # put package on GH
}
else {
 # put package on CRAN
}
```

A lot of these `hySpc.pkgs` are will be data packages.

## `hySpc.read.Witec`
Still working on the `hySpc.read.Witec` function. Most of the parsing of the Witec_TrueMatch file has been done. Additionally, a number of unittest have been implemented. The next couple task are to:

* <s>find out better name</s>
* <s>provide axis labels</s>
* <s>x axis units are in $SpectrumHeader$XDataKind</s>
* <s>allow users to specify extra data to keep</s>
* <s>unit testing</s>
* documentation

Instead of moving on to preparing the appropriate x-axis labels, I'm going to work on allowing the users to specify extra data columns, which I believe can be accomplished by having an argument in the `read_txt_Witec_TrueMatch` function:

```R
read_txt_Witec_TrueMatch <- function(file, keys.2header) {
    .
    .
    .
}
```

The `keys.2header` argument is taken from `hyperSpec::read.ENVI.R`, but I don't really understand how it's implemented. Instead, I'm going to take the `dplyr::mutate` approach, where the argument `.keep` can be set to either `c("all", "used", "unused", "none")`.

```R
read_txt_Witec_TrueMatch <- function(file, keys.2header = c("all", "none")) {
    .
    .
    .
    keys.2header <- arg_match(keys.2header)
    if (keys.2header == "all") {
        # Basically do what I've been doing
    } else if (keys.2header == "none") {
        # Only retain `spc`
    } else if (keys.2header != "all" && != "none") {
        # collect those columns + spc from the generated hyperSpec object
    } else {
        # Default to do what I've been doing
    }
    .
    .
    .
}
```
---

# [Meeting notes for 7-6-20](/blog/meeting_notes.md)

 **Things to do:**
 * Finish the todo list for the `hySpc.read.Witec` pkg
 * Start implementation of the `hySpc.read.JCAMP-DX` pkg

 **Things to look into:**
 * `drat` and `piggyback` packages
  * `drat` is more of a strategy - repo with data in it
  * `piggyback` - ...
 * Color palettes for spectroscopy analysis
 * `usethis` strategy
 * Strategy for skeleton
  * GitHub templates
  * Make a checklist of what files should be effected
    * patches
 * Github Actions and pkgdown
 * Claudia's hyperSpec lecture