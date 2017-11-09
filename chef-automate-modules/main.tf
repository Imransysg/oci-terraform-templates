module "vcn" {
    source = "modules/vcn"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}"
    vcnCidr ="${var.vcnCidr}"
}

module "internet_gateway" {
    source = "modules/internet_gateway"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}"
    vcn_ocid = "${module.vcn.vcn_ocid}"
    uid="${module.unique_id.unqid}"
}

module "unique_id" {
  source = "modules/unique_id"
}

module "route_table" {
    source = "modules/route_table"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}"
    vcn_ocid = "${module.vcn.vcn_ocid}"
    internet_gateway_ocid = "${module.internet_gateway.internet_gateway_ocid}"
     uid= "${module.unique_id.unqid}"
     rtCIDR ="${var.rtCIDR}"
}

module "security_list" {
    source = "modules/security_list"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}"
    vcn_ocid = "${module.vcn.vcn_ocid}"
    uid= "${module.unique_id.unqid}"
}

module "dhcp" {
     source = "modules/dhcp"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}"
    vcn_ocid = "${module.vcn.vcn_ocid}"
    uid= "${module.unique_id.unqid}"
}

module "ad_data_source" {
    source = "modules/ad_data_source"
    compartment_ocid = "${var.compartment_ocid}"    
}

module "subnets" {
    source = "modules/subnets"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}"
    vcn_ocid = "${module.vcn.vcn_ocid}"
    security_list_ocid = "${module.security_list.security_list_ocid}"
    route_table_ocid = "${module.route_table.route_table_ocid}"
    dhcp_ocid = "${module.dhcp.dhcp_ocid}"
    ad1_name = "${module.ad_data_source.ad1_name}"
    uid= "${module.unique_id.unqid}"
    subnet1 ="${var.subnet1}"
}