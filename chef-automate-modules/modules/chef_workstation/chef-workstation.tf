resource "oci_core_instance" "chefworkstation" {
    availability_domain = "${var.ad1_name}"
    compartment_id = "${var.compartment_ocid}"
    display_name = "${var.prefix}-workstation${var.uid}"
    image = "${var.wimage_ocid}"
    shape = "${var.InstanceShape}"
    subnet_id = "${var.subnet_ocid}"
create_vnic_details {
    subnet_id = "${var.subnet_ocid}"
    display_name = "${var.prefix}-nic1"
    assign_public_ip = true
    hostname_label = "${var.prefix}-ws" 
}
metadata {}
}