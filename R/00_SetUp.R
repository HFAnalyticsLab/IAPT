
# set up ------------------------------------------------------------------


## @knitr libraries

library(tidyverse)
library(janitor)
library(scales)
library(cowplot)
library(magrittr)
library(here)
library(knitr)
library(tidylog)
library(readxl)

here::here()

options(max.print=1000000)
options(scipen=100000)

## @knitr ggplot_functions

#bar plots with labels
bar_fun2 = function(dat, x, y) {
  ggplot(data = dat, aes(x = !!sym(x), y = !!sym(y), fill = !!sym(x), label=round(!!sym(y),1))) +
    geom_bar(stat = "identity") +
    geom_text(vjust=1.6, color="white") +
    scale_fill_manual(values=c(hue_pal()(n_factor))) +
    theme_classic(base_size=18) +
    theme(legend.position="none", axis.text.x = element_text(angle = 45, hjust=1))
}

#bar plots with two stacked values
bar_fun_stack = function(dat, x, y, z) {
  ggplot(data = dat) +
    geom_col(aes(x = !!sym(x), y = !!sym(y), fill = !!sym(x), alpha = 0.6), colour="black") + 
    geom_col(aes(x = !!sym(x),y = !!sym(z), fill = !!sym(x)), colour="black") +
    geom_text(aes(x = !!sym(x), y=!!sym(y), label = !!sym(y)),vjust=1.6, color="black") +
    geom_text(aes(x = !!sym(x), y=!!sym(z), label = !!sym(z)),vjust=1.6, color="white") +
    scale_fill_manual(values=c(hue_pal()(n_factor))) +
    theme_classic() +
    theme(legend.position="none", axis.text.x = element_text(angle = 45, hjust=1))
}

#line plots for longitudinal analysis
line_fun = function(dat, y, title, ylabel) {
  ggplot(data = dat) +
    aes(x = Year, y=!!sym(y), group=VariableA, colour=VariableA, label=round(!!sym(y),1)) +
    geom_line(size=2) +
    geom_point() +
    geom_label(label.padding= unit(0.2, "lines")) +
    scale_colour_manual(values=c(hue_pal()(10))) +
    theme_classic() +
    theme(legend.title = element_blank(), legend.position="right", axis.text.x = element_text(angle = 45, hjust=1)) +
    ggtitle(title) +
    ylab(ylabel)
}



        



