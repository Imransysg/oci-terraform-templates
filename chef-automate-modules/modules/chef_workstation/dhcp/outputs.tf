output "dhcp_ocid" {
    value = "${oci_core_dhcp_options.chefdhcp.id}"
}