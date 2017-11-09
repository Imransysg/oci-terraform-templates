module "vcn" {
    source = "modules/vcn"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}"
}