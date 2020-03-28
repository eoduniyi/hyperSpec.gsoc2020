# Load styler library
library(lintr)
library(styler)

# Adhere do tidyverse style guide
tidyverse_style(
  scope = "tokens",
  strict = TRUE,
  indent_by = 2,
  start_comments_with_one_space = FALSE,
  reindention = tidyverse_reindention(),
  math_token_spacing = tidyverse_math_token_spacing()
)

# Perform directory level styling
style_dir(getwd(), transformers = tidyverse_style(strict = TRUE))
