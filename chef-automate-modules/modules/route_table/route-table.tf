resource "oci_core_route_table" "chefRT" {
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${var.vcn_ocid}"
    display_name = "${var.prefix}-rt${var.uid}"
    route_rules {
        cidr_block = "${var.rtCIDR}"
        network_entity_id = "${var.internet_gateway_ocid}"
    }
}