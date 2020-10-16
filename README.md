## ERI 5-year review
This repository contains data, scripts, and figures for reporting and institutional review for the UC Santa Barbara Earth Research Institute [ERI](https://www.eri.ucsb.edu/) between 2014 - 2019. Administrative documents are found [here](https://adminweb.eri.ucsb.edu/Review/ReviewDocuments/). Here, data are pre-processed for later analysis with [topic modeling](https://github.com/saralafia/ERI-maps) and [mapping](https://github.com/saralafia/ERI-dashboard).

### Data

- PI (**data/people**) data includes active researchers from 2009 - 2014 and from 2014 with tags from their Google Scholar profiles when available. Processed data are cleaned. Difference data are PIs gained/lost between analysis periods.
- Publication (**data/publications**) data for the researchers comes from Dimensions.ai and includes publications co-authored by active ERI researchers; ERI staff validated and cleaned the data. Directories for 09-14 and 14-19 contain individual PI records from Dimensions.ai. Deduplicated and processed data are cleaned. Treemap data have been reformated for visualization.
- Projects (**data/projects**) data comes from ERI, which maintains funding records for affiliates' projects, and includes summary statistics of funded and unfunded projects. Processed data are cleaned. Difference data are funders gained/lost between analysis periods.

### Scripts

- People (**scripts/ERI-people.ipynb**) gathers Google Scholar keywords for researchers
- Publications (**scripts/ERI-publications.ipynb**) concatenates PI publication records
- Journals (**scripts/ERI-journals.ipynb**) summarizes most cited publications, top source titles
- Projects (**scripts/ERI-projects.ipynb**) summarizes funding and relationships
- Treemap (**scripts/ERI-treemap.R**) takes output from Publications (**scripts/ERI-publications.ipynb**) and visualizes division and group subjects as a treemap

### Figures

- Signatures (**figures/signatures**) summarize change in publication fields of research over time
- Bar charts (**figures/barcharts**) summarize publication outlets and funding types
- Treemaps (**figures/treemaps**) summarizes publication fields of research and project funding with examples of treemaps for individual researchers and changes over time

