resource "oci_core_virtual_network" "vcn" {
  cidr_block = "10.0.0.0/16"
  dns_label = "${var.prefix}-dns"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.prefix}-vcn"
}