
# set up ------------------------------------------------------------------
library(here)
library(tidyverse)
library(scales)
library(tidylog)
library(janitor)
library(readxl)
library(ggrepel)

here()

# Graph colors -----------------------------------------------------

THF_red <- "#dd0031"
THF_red_25pct <- "#f7bfcc"
THF_light_blue <- "#53a9cd"
THF_light_blue_25pct <- "#d4eaf2"
THF_dark_grey <- "#524c48"
THF_light_grey <- "#e2dfd8"
THF_50pct_light_grey <- "#EEEDE8"

# scale gradients ---------------------------------------------------------

thf_red_gradient <- seq_gradient_pal(THF_red, THF_red_25pct, "Lab")(seq(0, 1, length.out = 5))
thf_blue_gradient <- seq_gradient_pal(THF_light_blue_25pct, THF_light_blue, "Lab")(seq(0, 1, length.out = 5))
thf_red_blue_gradient <- c(thf_red_gradient, thf_blue_gradient)

# ggplot theme ------------------------------------------------------------

THF_theme_basic <- theme(
  axis.line = element_blank(),
  axis.text = element_text(colour = THF_dark_grey, size = 11),
  axis.text.x = element_text(size = 6 * ggplot2:::.pt),
  axis.text.y = element_text(margin = margin(r = 3, unit = "mm"), size = 6 * ggplot2:::.pt),
  axis.ticks = element_line(colour = THF_light_grey),
  axis.ticks.y = element_blank(),
  axis.title.x = element_blank(),
  axis.title.y = element_text(colour = THF_dark_grey, face = "bold", size = 8 * ggplot2:::.pt, margin = margin(r = 3, unit = "mm")),
  panel.background = element_blank(),
  panel.grid = element_blank(),
  panel.grid.major.y = element_line(colour = THF_50pct_light_grey),
  legend.background = element_rect(fill = NA),
  legend.justification = c(1, 0),
  legend.key = element_blank(),
  legend.text = element_text(colour = THF_dark_grey, size = 12),
  legend.title = element_blank(),
  legend.position = "top",
  plot.margin = unit(c(1.1, 1.1, 1.1, 1.1), "cm")
)



# ggplot_functions --------------------------------------------------------

# bar plots for cross-sectional analysis
bar_fun_red_blue_count <- function(dat, x, y) {
  ggplot(data = dat, aes(x = !!sym(x), y = !!sym(y), fill = !!sym(x))) +
    geom_bar(stat = "identity", colour = "black") +
    scale_fill_manual(values = thf_red_blue_gradient) +
    scale_x_discrete(labels = c("1\n(most deprived)", 2:9, "10\n(least deprived)")) +
    THF_theme_basic +
    theme(legend.position = "none")
}


bar_fun_red_blue_perc <- function(dat, x, y) {
  ggplot(data = dat, aes(x = !!sym(x), y = !!sym(y), fill = !!sym(x))) +
    geom_bar(stat = "identity", colour = "black") +
    scale_fill_manual(values = thf_red_blue_gradient) +
    scale_x_discrete(labels = c("1\n(most deprived)", 2:9, "10\n(least deprived)")) +
    THF_theme_basic +
    theme(legend.position = "none")
}


# line plots for longitudinal analysis
line_fun_red_blue <- function(dat, y) {
  ggplot(data = dat, aes(x = Year, y = !!sym(y), group = VariableA_recode, colour = VariableA_recode)) +
    geom_line(size = 2) +
    geom_point(shape = 21, size = 4, fill = "white", stroke = 2) +
    scale_colour_manual(values = thf_red_blue_gradient) +
    THF_theme_basic +
    theme(legend.position = "none") +
    geom_label_repel(aes(label = label), nudge_x = 1, na.rm = TRUE, size = 4, colour = "black")
}
