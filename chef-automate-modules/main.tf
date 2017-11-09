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

module "images_data_source" {
    source = "modules/images_data_source"
    compartment_ocid = "${var.compartment_ocid}"
    LinuxInstanceOS = "${var.LinuxInstanceOS}"
    LinuxInstanceOSVersion = "${var.LinuxInstanceOSVersion}"
}

module "vnic_data_source" {
    source = "modules/vnic_data_source"
    compartment_ocid = "${var.compartment_ocid}"
    ad1_name = "${module.ad_data_source.ad1_name}"
    chef_server_ocid = "${module.instance.chef_server_ocid}"
}

module "instance" {
    source = "modules/chef_server"
    compartment_ocid = "${var.compartment_ocid}"
    prefix = "${var.prefix}"
    image_ocid = "${module.images_data_source.image_ocid}"
    instanceShape = "${var.instanceShape}"
    subnet1_ocid = "${module.subnets.subnet_ocid}"
    bootStrapFileDir = "${var.bootStrapFileDir}"
    ad1_name = "${module.ad_data_source.ad1_name}"
    sshKey = "${var.sshKey}"
    ssh_private_key = "${var.ssh_private_key}"
    chefserver_public_ip = "${module.vnic_data_source.chefserver_public_ip}"
    
}