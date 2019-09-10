#!/usr/bin/env Rscript

repo <- "http://cran.us.r-project.org"
if (!require("methods")) {
  install.packages("methods", repos=repo)
  library("methods")
}
if (!require("argparser")) {
  install.packages("argparser", repos=repo)
  library("argparser")
}
if (!require("assertthat")) {
  install.packages("assertthat", repos=repo)
  library("assertthat")
}
if (!require("circlize")) {
  install.packages("circlize", repos=repo)
}


script_msg <- "
Create a Chord Diagram

A simple script to create a chord diagram based on a input data file. The chord diagram is saved as a pdf.

Expects a input data file in csv format with the following columns: from, to, count, color. Each row defines a link/edge connecting two objects/arcs.
'from' and 'to' are the names of the arcs/objects, 'count' is the value of the link/edge connecting them, and 'color' is the color of the link/edge.
Colors can be specified using their name (run `colors()` in your R shell to see availabe color names) or hex code (e.g. '#0000ff' for blue). See https://htmlcolorcodes.com/ for selecting desired hex code.

Example of usage
  `./create_chord.R example_data.csv example_chord.pdf`
"

parser <- arg_parser(script_msg)
parser <- add_argument(parser, "data_file", help="\t\tpath to csv to read data to plot")
parser <- add_argument(parser, "output_file", help="\tfilename to write output to")
argv <- parse_args(parser)

input_fp <- argv$data_file
output_fp <- argv$output_file

# read data
df <- read.csv(file=input_fp, header=T, stringsAsFactors=F)
has_cols <- hasName(df, c("from", "to", "count", "color"))
found_cols_str <- paste(names(df), collapse=", ")
assert_msg <- paste(c(
  "Input file must have columns 'from', 'to', 'count', 'color'. Found columns: ",
  found_cols_str
  ),
  collapse = " "
)
assertthat::assert_that(
  all(has_cols),
  msg=assert_msg
)
df <- df[order(df$count, decreasing = F), ]

# set up distinct vals
unique1 <- unique(df$to)
unique2 <- unique(df$from)
unique_vals <- unique(c(unique1, unique2))


# chord
pdf(output_fp, width=12, height=12)
gap_size = 1
circos.par(gap.after = c(rep(gap_size, length(unique1)-1), gap_size, rep(gap_size, length(unique2)-1), gap_size))
circos.par(start.degree = 60)
chordDiagram(df[c("from", "to", "count")],
             col = df$color,
             grid.col = "black",
             annotationTrack = "grid",
             annotationTrackHeight = uh(5, "mm"),
             preAllocateTracks = list(track.height = max(strwidth(unique_vals)))
)
# we go back to the first track and customize sector labels
circos.track(track.index = 1, panel.fun = function(x, y) {
  circos.text(CELL_META$xcenter, CELL_META$ylim[1], CELL_META$sector.index,
              facing = "clockwise", niceFacing = TRUE, adj = c(0, 0.5), cex=.9)
}, bg.border = NA) # here set bg.border to NA is important
dev.off()
circos.clear()
