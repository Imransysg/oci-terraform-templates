module "vcn" {
    source = "modules/vcn"
    compartment_ocid = "${var.compartment_ocid}"
    cidr_block = "${var.vcnCidr}"
    prefix = "${var.prefix}"
}