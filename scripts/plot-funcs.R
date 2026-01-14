# for demographics
n_plot <- function(data, x, title, total = sum(data$n), ylim = NULL, ytext = .1) {
  if (is.null(ylim)) ylim <- c(0, max(data$n))
  data |>
    mutate(pcnt = (n/sum(n)) * 100,
           pcnt = sprintf("%.1f%%", pcnt)) |>
    mutate(x = fct_rev(data[[x]])) |>
    ggplot(aes(x = x, y = n / total, fill = as.factor(x == na_text))) +
    geom_col(show.legend = FALSE) +
    geom_text(aes(label = pcnt, 
                  y = ifelse(n/total < ytext, 
                             (n/total) + ytext - (ylim[[2]]*.01), 
                             ytext),
                  color = I(ifelse(n/total < ytext, "black", "white"))),
              hjust = 1) +
    coord_flip(clip = 'off', ylim = ylim) +
    scale_fill_manual(values = c(yes, "grey30")) +
    scale_x_discrete(drop = FALSE) +
    scale_y_continuous(expand = expansion(0),
                       labels = scales::label_percent(), 
                       sec.axis = sec_axis(~ . * total)) +
    labs(x = NULL,
         y = NULL,
         title = title)
}

# just purple bar (plot 1 thing)
label_plot <- function(data, x, title, label) {
  data$label <- data[[label]]
  data |>
    mutate(x = fct_rev(data[[x]])) |>
    ggplot(aes(x = x, y = pcnt, fill = )) +
    geom_col(fill = yes, na.rm = TRUE) +
    geom_text(aes(label = label,
                  y = ifelse(pcnt<.1, pcnt+.01, .01),
                  color = I(ifelse(pcnt < .1, "black", "white"))),
              hjust = 0) +
    coord_flip(clip = 'off', ylim = c(0, 1)) +
    scale_x_discrete(drop = FALSE) +
    scale_y_continuous(expand = expansion(0),
                       labels = scales::label_percent()) +
    labs(x = NULL,
         y = NULL,
         alt = "",
         title = title)
}

# purple for 1, green for 0
label_plot2 <- function(data, x, title, label,
                             fill_labels = c("No", "Yes")) {
  data$label <- data[[label]]
  data |>
    mutate(pcnt = n/total,
           label = round(pcnt*100) |> paste0("%")) |>
    mutate(x = fct_rev(data[[x]]),
           label = ifelse(value == 0, NA, label)) |>
    ggplot(aes(x = x, y = pcnt, fill = as.factor(value))) +
    geom_col(na.rm = TRUE) +
    geom_text(aes(label = label,
                  y = ifelse(pcnt<.1, pcnt+.01, .01),
                  color = I(ifelse(pcnt < .1, "black", "white"))),
              hjust = 0) +
    coord_flip(clip = 'off', ylim = c(0, 1)) +
    scale_fill_manual(values = c(no, yes),
                      labels = fill_labels,
                      guide=guide_legend(reverse=T)) +
    scale_x_discrete(drop = FALSE) +
    scale_y_continuous(expand = expansion(0),
                       labels = scales::label_percent()) +
    labs(x = NULL,
         y = NULL,
         fill = NULL,
         title = title)
}

table_panel <- function(data, x, title, by, ncol = 6, ylim = NULL, title_labels = NULL, ytext = .17) {
  if (is.null(ylim)) ylim <- c(0, max(data$pcnt))
  data |>
    mutate(x = fct_rev(data[[x]])) |>
    ggplot(aes(x = x, y = pcnt)) +
    geom_col(fill = yes) +
    geom_text(aes(label = label,
                  y = ifelse(pcnt<ytext, pcnt+.01, .01),
                  color = I(ifelse(pcnt < ytext, "black", "white"))),
              hjust = 0, na.rm = TRUE) +
    coord_flip(clip = 'off', ylim = ylim) +
    scale_x_discrete(drop = FALSE) +
    scale_y_continuous(expand = expansion(0),
                       labels = scales::label_percent()) +
    labs(x = NULL,
         y = NULL,
         fill = NULL,
         title = title) +
    facet_wrap(~data[[by]], ncol = ncol, labeller = as_labeller(title_labels))
}

table_panel2 <- function(data, title, by, ncol = 6,
                         fill_labels = c("Unaware", "Aware")) {
  data$by <- data[[by]]

  data <- data |>
    filter(by != na_text) |>
    count(name, by, value) |>
    mutate(total = sum(n), .by = c(name, by)) |>
    mutate(pcnt = n/total,
           label = round(pcnt*100) |> paste0("%"))

  data$x <- fct_rev(data$name)

  ptitle <- data |>
    mutate(title = paste0(by, " (n=", max(total), ")"),
           .by = by) |>
    select(by, title) |>
    unique()
  panel_title <- setNames(ptitle$title, ptitle$by)

  data |>
    mutate(label = ifelse(value == 0, NA, label)) |>
    ggplot(aes(x = x, y = pcnt, fill = as.factor(value))) +
    geom_col(na.rm = TRUE) +
    geom_text(aes(label = label,
                  y = ifelse(pcnt<.1, pcnt+.01, .01),
                  color = I(ifelse(pcnt < .1, "black", "white"))),
              hjust = 0, na.rm = TRUE) +
    coord_flip(clip = 'off', ylim = c(0, 1)) +
    scale_x_discrete(drop = FALSE) +
    scale_y_continuous(expand = expansion(0),
                       labels = scales::label_percent()) +
    scale_fill_manual(values = c(no, yes),
                      labels = fill_labels,
                      guide=guide_legend(reverse=T)) +
    labs(x = NULL,
         y = NULL,
         fill = NULL,
         title = title) +
    facet_wrap(~by, ncol = ncol,
               labeller = as_labeller(panel_title))
}

table_panel5 <- function(data, x, title, by, ncol = 6,
                         fill_cols = NULL) {
  data$x <- data[[x]]
  data$by <- data[[by]]

  ptitle <- data |>
    mutate(title = paste0(by, " (n=", max(total), ")"),
           .by = by) |>
    select(by, title) |>
    unique()
  panel_title <- setNames(ptitle$title, ptitle$by)

  ggplot(data, aes(x = x, y = pcnt, fill = fct_rev(value))) +
    geom_col() +
    facet_wrap(~by,
               labeller = as_labeller(panel_title)) +
    coord_flip(clip = 'off', ylim = c(0,1)) +
    scale_y_continuous(expand = expansion(c(0)),
                       labels = scales::label_percent()) +
    scale_fill_manual(values = fill_cols,
                      guide=guide_legend(reverse=T)) +
    labs(x = NULL,
         y = NULL,
         fill = NULL,
         title = title)
}


# n_plot_tabs not used
# n_plot_tabs <- function(data, x, title, by, add_total = TRUE) {
#   groups <- unique(data[[by]]) |> sort()
#   names(groups) <- groups
#   plots <- lapply(groups, \(group) {
#     subdat <- data[data[[by]] == group, ]
#     range <- max(subdat$total) |> unique() |> paste(collapse = "-")
#     subdat |>
#       mutate(x = fct_rev(subdat[[x]]),
#              pcnt = n/total) |>
#       ggplot(aes(x = x, y = pcnt)) +
#       geom_col(fill = yes) +
#       geom_text(aes(label = label,
#                     y = ifelse(pcnt<.1, pcnt+.01, .01),
#                     color = I(ifelse(pcnt < .1, "black", "white"))),
#                 hjust = 0, na.rm = TRUE) +
#       coord_flip(clip = 'off') +
#       scale_x_discrete(drop = FALSE) +
#       scale_y_continuous(expand = expansion(0),
#                          labels = scales::label_percent(),
#                          limits = c(0, 1)) +
#       labs(x = NULL,
#            y = NULL,
#            fill = NULL,
#            alt="",
#            title = ifelse(add_total,
#                           paste0(group, " (n=", range, ")"),
#                           as.character(group)))
#   })
#
#   cat("::: {.panel-tabset}\n\n")
#
#   for (i in seq_along(plots)) {
#     cat("##", names(groups)[i], "\n\n")
#     print(plots[[i]])
#     cat("\n\n")
#   }
#
#   cat(":::\n\n")
# }

n_plot_tabs2 <- function(data, x, title, by,
                         add_total = TRUE,
                         fill_labels = c("Unaware", "Aware")) {


  groups <- unique(data[[by]]) |> sort()
  names(groups) <- groups
  plots <- lapply(groups, \(group) {
    subdat <- data[data[[by]] == group, ]
    range <- max(subdat$total) |> unique() |> paste(collapse = "-")

    if (max(subdat$total) < 5) return(NULL)

    subdat |>
      mutate(x = fct_rev(subdat[[x]]),
             label = ifelse(value == 0, NA, label)) |>
      ggplot(aes(x = x, y = n/total, fill = as.factor(value))) +
      geom_col(na.rm = TRUE) +
      geom_text(aes(label = label), y = .01,
                hjust = 0, color = "white", na.rm = TRUE) +
      coord_flip(clip = 'off') +
      scale_x_discrete(drop = FALSE) +
      scale_y_continuous(expand = expansion(0),
                         labels = scales::label_percent(),
                         limits = c(0, 1)) +
      scale_fill_manual(values = c(no, yes),
                        labels = fill_labels,
                        guide=guide_legend(reverse=T)) +
      labs(x = NULL,
           y = NULL,
           fill = NULL,
           alt = "",
           title = ifelse(add_total,
                          paste0(group, " (n=", range, ")"),
                          as.character(group)))
  })

  cat("::: {.panel-tabset}\n\n")

  for (i in seq_along(plots)) {
    if (!is.null(plots[[i]])) {
      cat("##", names(groups)[i], "\n\n")
      print(plots[[i]])
      cat("\n\n")
    }
  }

  cat(":::\n\n")
}

n_plot_use_tabs3 <- function(data,
                            by = "method",
                            use_cols) {

  groups <- unique(data[[by]]) |> sort()
  names(groups) <- groups

  plots <- lapply(groups, function(group) {
    subdat <- data[data[[by]] == group, ]

    if (nrow(subdat) == 0) return(NULL)
    if (max(subdat$total, na.rm = TRUE) < 5) return(NULL)

    range <- max(subdat$total, na.rm = TRUE) |>
      unique() |>
      paste(collapse = "-")

    ggplot(
      subdat,
      aes(
        x = forcats::fct_rev(name),
        y = pcnt,
        fill = forcats::fct_rev(value)
      )
    ) +
      geom_col() +
      coord_flip(clip = "off") +
      scale_y_continuous(
        expand = expansion(0),
        labels = scales::label_percent()
      ) +
      scale_fill_manual(
        values = use_cols,
        guide = guide_legend(reverse = TRUE)
      ) +
      labs(
        x = NULL,
        y = NULL,
        fill = NULL,
        alt = "",
        title = paste0(group, " (n=", range, ")")
      ) +
      theme(
        plot.margin = unit(c(0.2, 0.5, 0.1, 0.2), "cm"),
        panel.grid.major.y = element_blank(),
        legend.position = "bottom",
        panel.spacing.x = unit(0.75, "cm")
      )
  })

  cat("::: {.panel-tabset}\n\n")

  for (i in seq_along(plots)) {
    if (!is.null(plots[[i]])) {
      cat("## ", names(groups)[i], "\n\n")
      print(plots[[i]])
      cat("\n\n")
    }
  }

  cat(":::\n\n")
}


# same as n_plot_tabs2 but adds discipline_cats
n_plot_tabs2disc <- function(data, x, title, by,
                             add_total = TRUE,
                             fill_labels = c("Unaware", "Aware")) {

  groups <- unique(data[[by]]) |> sort()
  names(groups) <- groups
  plots <- lapply(groups, \(group) {
    subdat <- data[data[[by]] == group, ]
    range <- max(subdat$total) |> unique() |> paste(collapse = "-")
    g <- subdat |>
      mutate(x = fct_rev(subdat[[x]]),
             label = ifelse(value == 0, NA, label)) |>
      ggplot(aes(x = x, y = n/total, fill = as.factor(value))) +
      geom_col(na.rm = TRUE) +
      geom_text(aes(label = label), y = .01,
                hjust = 0, color = "white", na.rm = TRUE) +
      coord_flip(clip = 'off') +
      scale_x_discrete(drop = FALSE) +
      scale_y_continuous(expand = expansion(0),
                         labels = scales::label_percent(),
                         limits = c(0, 1)) +
      scale_fill_manual(values = c(no, yes),
                        labels = fill_labels,
                        guide=guide_legend(reverse=T)) +
      labs(x = NULL,
           y = NULL,
           fill = NULL,
           alt = "",
           title = ifelse(add_total,
                          paste0(group, " (n=", range, ")"),
                          as.character(group)))

    gp <- grid::gpar(cex = 0.85, lineheight = 0.8, col=ukrn$dark)
    label_y <- -0.55
    disc_type(g, gp, label_y)
  })

  cat("::: {.panel-tabset}\n\n")

  for (i in seq_along(plots)) {
    cat("##", names(groups)[i], "\n\n")
    print(plots[[i]])
    cat("\n\n")
  }

  cat(":::\n\n")
}


disc_type <- function(g, gp, label_y) {
  g + annotation_custom(
    grob = grid::textGrob(label = "Arts &\nHumanities",
                          rot = 90,
                          gp = gp),
    ymin = label_y, ymax = label_y,
    xmin = 22, xmax = 22) +
    annotation_custom(
      grob = grid::textGrob(label = "Social\nSciences",
                            rot = 90,
                            gp = gp),
      ymin = label_y, ymax = label_y,
      xmin = 15, xmax = 15) +
    annotation_custom(
      grob = grid::textGrob(label = "Health &\nBioSciences",
                            rot = 90,
                            gp = gp),
      ymin = label_y, ymax = label_y,
      xmin = 8.5, xmax = 8.5) +
    annotation_custom(
      grob = grid::textGrob(label = "Physical\nSciences",
                            rot = 90,
                            gp = gp),
      ymin = label_y, ymax = label_y,
      xmin = 3.5, xmax = 3.5) +
    annotation_custom(
      grob = grid::linesGrob(gp = grid::gpar(col=ukrn$pink)),
      ymin = label_y-5, ymax = 0,
      xmin = 18.4, xmax = 18.4) +
    annotation_custom(
      grob = grid::linesGrob(gp = grid::gpar(col=ukrn$pink)),
      ymin = label_y-5, ymax = 0,
      xmin = 11.4, xmax = 11.4) +
    annotation_custom(
      grob = grid::linesGrob(gp = grid::gpar(col=ukrn$pink)),
      ymin = label_y-5, ymax = 0,
      xmin = 5.4, xmax = 5.4) +
    annotation_custom(
      grob = grid::linesGrob(gp = grid::gpar(col=ukrn$pink)),
      ymin = label_y-5, ymax = 0,
      xmin = 1.4, xmax = 1.4) +
    theme(plot.margin = unit(c(0, 0.5, 0, 1.4), "cm"), aspect.ratio = 1)
}
