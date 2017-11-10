output "chefserver_public_ip" {
    value = "${data.oci_core_vnic.InstanceVnic.public_ip_address}"
}

output "chefserver_private_ip" {
    value = "${data.oci_core_vnic.InstanceVnic.private_ip_address}"
}
output "chefautomate_public_ip" {
    value = "${data.oci_core_vnic.nstanceVnic-2.public_ip_address}"
}

output "chefautomate_private_ip" {
    value = "${data.oci_core_vnic.nstanceVnic-2.private_ip_address}"
}
