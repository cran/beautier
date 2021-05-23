## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(beautier)

## -----------------------------------------------------------------------------
inference_model <- create_inference_model()

## -----------------------------------------------------------------------------
names(inference_model)

## -----------------------------------------------------------------------------
get_site_model_names()

## -----------------------------------------------------------------------------
inference_model <- create_inference_model(
  site_model = create_jc69_site_model()
)

## -----------------------------------------------------------------------------
get_clock_model_names()

## -----------------------------------------------------------------------------
inference_model <- create_inference_model(
  clock_model = create_strict_clock_model()
)

## -----------------------------------------------------------------------------
get_tree_prior_names()

## -----------------------------------------------------------------------------
inference_model <- create_inference_model(
  tree_prior = create_yule_tree_prior()
)

## -----------------------------------------------------------------------------
# The alignmet
fasta_filename <- get_beautier_path("anthus_aco.fas")

# The alignment's ID
alignment_id <- get_alignment_id(fasta_filename)

# Get the first two taxa's names
taxa_names <- get_taxa_names(fasta_filename)[1:2]

# Specify that the first two taxa share a common ancestor
mrca_prior <- create_mrca_prior(
  alignment_id = alignment_id,
  taxa_names = taxa_names
)

# Use the MRCA prior in inference
inference_model <- create_inference_model(
  mrca_prior = mrca_prior
)

## -----------------------------------------------------------------------------
inference_model <- create_inference_model(
  beauti_options = create_beauti_options_v2_4()
)

## -----------------------------------------------------------------------------
inference_model <- create_inference_model(
  tipdates_filename = get_beautier_path("G_VII_pre2003_dates_4.txt")
)

## -----------------------------------------------------------------------------
output_filename <- get_beautier_tempfilename()

create_beast2_input_file_from_model(
  input_filename = get_beautier_path("G_VII_pre2003_msa.fas"),
  inference_model = inference_model,
  output_filename = output_filename
)
# Cleanup
file.remove(output_filename)

