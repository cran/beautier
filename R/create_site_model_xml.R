#' Internal function to creates the XML text for the \code{siteModel} tag
#' of a BEAST2 parameter file.
#'
#' Creates the XML text for the \code{siteModel} tag of
#' a BEAST2 parameter file,
#' which is part of the \code{distribution} node for the
#' \code{treeLikelihood} ID.
#'
#' The \code{siteModel} tag has these elements:
#'
#' \preformatted{
#'   <siteModel[...]>
#'
#'       [parameters]
#'
#'       <substModel[...]>
#'         [...]
#'       </substModel>
#'   </siteModel>
#' }
#'
#' The \code{parameter} section is created by
#' \link{create_site_model_parameters_xml}
#' The \code{substModel} section is created by \link{create_subst_model_xml}
#' @inheritParams default_params_doc
#' @return the site model as XML text
#' @author Richèl J.C. Bilderbeek
#' @examples
#' check_empty_beautier_folder()
#'  # <distribution id="posterior"[...]">
#'  #     <distribution id="likelihood" [...]>
#'  #       <siteModel...>
#'  #         [parameters]
#'  #       </siteModel>
#'  #     </distribution>
#'  # </distribution>
#'
#' check_empty_beautier_folder()
#' @export
create_site_model_xml <- function(
  inference_model
) {
  id <- inference_model$site_model$id
  check_true(is_id(id))

  # gcc: gamma category count
  gcc <- inference_model$site_model$gamma_site_model$gamma_cat_count

  site_model_begin_tag <- paste0(
    "<siteModel id=\"SiteModel.s:", id, "\" spec=\"SiteModel\""
  )
  if (gcc >= 1) {
    site_model_begin_tag <- paste0(
      site_model_begin_tag,
      " gammaCategoryCount=\"", gcc, "\""
    )
  }
  if (gcc >= 2) {
    site_model_begin_tag <- paste0(
      site_model_begin_tag,
      " shape=\"@gammaShape.s:", id, "\""
    )
  }
  site_model_begin_tag <- paste0(site_model_begin_tag, ">")


  site_model_parameters <- create_site_model_parameters_xml(
    inference_model
  )
  subst_model_xml <- create_subst_model_xml(inference_model)
  site_model_end_tag <- "</siteModel>"

  # Layout of the text
  c(
    site_model_begin_tag,
    indent(site_model_parameters),
    indent(subst_model_xml),
    site_model_end_tag
  )
}
