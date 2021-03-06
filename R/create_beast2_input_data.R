#' Creates the \code{data} section of a BEAST2 XML parameter file
#' @inheritParams default_params_doc
#' @return lines of XML text
#' @author Richèl J.C. Bilderbeek
#' @export
create_beast2_input_data <- function(
  input_filename,
  beauti_options = beautier::create_beauti_options(),
  input_filenames = "deprecated"
) {
  if (input_filenames != "deprecated") {
    stop("'input_filenames' is deprecated. Use 'input_filename' instead")
  }
  testthat::expect_equal(length(input_filename), 1)
  testthat::expect_true(file.exists(input_filename))

  # Data opening tag
  id <- beautier::get_alignment_id(
    fasta_filename = input_filename,
    capitalize_first_char_id = beauti_options$capitalize_first_char_id
  )
  data_start_text <- beautier::create_data_xml(
    id = id,
    beast2_version = beauti_options$beast2_version
  )
  # Sequences
  sequences_text <- beautier::create_beast2_input_data_sequences(
    input_fasta_filename = input_filename,
    beauti_options = beauti_options
  )
  # Data closing tag
  data_close_text <- beautier::indent(
    "</data>", n_spaces = beauti_options$sequence_indent - 4
  )
  if (beauti_options$beast2_version == "2.6") {
    c(
      data_start_text,
      paste0(rep(" ", 20 + beauti_options$sequence_indent), collapse = ""),
      sequences_text,
      paste0(rep(" ", 16 + beauti_options$sequence_indent), collapse = ""),
      data_close_text
    )
  } else {
    c(
      data_start_text,
      sequences_text,
      data_close_text
    )
  }
}
