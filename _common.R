set.seed(1014)

knitr::opts_chunk$set(
    comment = "#>",
    collapse = TRUE,
    # cache = TRUE,
    fig.retina = 2,
    fig.width = 6,
    fig.asp = 2 / 3,
    fig.show = "hold"
)

options(
    dplyr.print_min = 6,
    dplyr.print_max = 6,
    pillar.max_footer_lines = 2,
    pillar.min_chars = 15,
    stringr.view_n = 6,
    # Temporarily deactivate cli output for quarto
    cli.num_colors = 0,
    cli.hyperlink = FALSE,
    pillar.bold = TRUE,
    width = 77 # 80 - 3 for #> comment
)

ggplot2::theme_set(ggplot2::theme_gray(12))

# use results: "asis" when setting a status for a chapter
# Fonction de statut pour l'état d'avancement des chapitres
status <- function(type) {
    status <- switch(type,
        draft = "est en version préliminaire et peut être incomplet",
        review = "est en cours de révision et peut nécessiter des modifications",
        testing = "nécessite des tests avec des utilisateurs réels",
        complete = "est complet et prêt à l'emploi",
        stop(
            "Type invalide, utilisez `draft`, `review`, `testing`, ou `complete`",
            call. = FALSE
        )
    )

    class <- switch(type,
        draft = "warning",
        review = "note",
        testing = "important",
        complete = "tip"
    )

    cat(
        paste0(
            "\n",
            ":::: status\n",
            "::: callout-", class, " \n",
            "Ce chapitre ", status, ".\n",
            ":::\n",
            "::::\n"
        )
    )
}
