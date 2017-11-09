data "oci_identity_availability_domains" "chefAD" {
  compartment_id = "${var.compartment_ocid}"
}
