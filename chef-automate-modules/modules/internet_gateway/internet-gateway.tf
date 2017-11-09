resource "oci_core_internet_gateway" "chefIG" {
    compartment_id = "${var.compartment_ocid}"
    display_name = "${var.prefix}-igw${random_id.unq.hex}"
    vcn_id = "${var.vcn_ocid}"
}