# Gets a list of vNIC attachments on the instance
data "oci_core_vnic_attachments" "InstanceVnicas" {
    compartment_id = "${var.compartment_ocid}" 
    availability_domain = "${var.ad1_name}"
    instance_id = "${var.chef_server_ocid}"
    } 

# Gets the OCID of the first (default) vNIC
data "oci_core_vnic" "InstanceVnic" {
    vnic_id = "${lookup(data.oci_core_vnic_attachments.InstanceVnicas.vnic_attachments[0],"vnic_id")}"
}    


# Gets a list of vNIC attachments on the instance
data "oci_core_vnic_attachments" "InstanceVnicas-2" {
    compartment_id = "${var.compartment_ocid}" 
    availability_domain = "${var.ad1_name}"
    instance_id = "${var.chef_automate_ocid}"
} 

# Gets the OCID of the first (default) vNIC
data "oci_core_vnic" "InstanceVnic-2" {
    vnic_id = "${lookup(data.oci_core_vnic_attachments.InstanceVnicas-2.vnic_attachments[0],"vnic_id")}"
}