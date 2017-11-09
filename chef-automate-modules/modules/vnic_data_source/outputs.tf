output "chefserver_public_ip" {
    value = "${data.oci_core_vnic.InstanceVnic.public_ip_address}"
}

output "chefserver_private_ip" {
    value = "${data.oci_core_vnic.InstanceVnic.private_ip_address}"
}
