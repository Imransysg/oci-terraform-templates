resource "oci_core_dhcp_options" "chefdhcp" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${var.vcn_ocid}"
  display_name = "${var.prefix}-chefdhcp${var.uid}"

  // required
  options {
    type = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }

  // optional
  options {
    type = "SearchDomain"
    search_domain_names = [ "chefautomate.oraclevcn.com" ]
}
}