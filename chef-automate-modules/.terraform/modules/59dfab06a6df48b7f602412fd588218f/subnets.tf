resource "oci_core_subnet" "chefsubnet1" {
  compartment_id = "${var.compartment_ocid}"
  availability_domain = "${var.ad1_name}"
  route_table_id      = "${var.route_table_ocid}"
  vcn_id              = "${var.vcn_ocid}"
  security_list_ids   = ["${var.security_list_ocid}"]
  dhcp_options_id     = "${var.dhcp_ocid}"
  dns_label = "chefautomate"
  display_name               = "${var.prefix}-subnet1${var.uid}"
  cidr_block                 = "${var.subnet1}"
}