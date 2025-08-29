#!/bin/bash
# Run ITS pipeline visualization and render HTML report
Rscript -e "rmarkdown::render('scripts/vizualize_ITS_results.Rmd')"
echo "ITS results visualization complete. HTML report generated."
