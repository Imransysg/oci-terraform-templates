resource "oci_core_virtual_network" "vcn" {
  cidr_block = "${var.vcnCidr}"
  dns_label = "${var.DnsLabel}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.prefix}-vcn"
}