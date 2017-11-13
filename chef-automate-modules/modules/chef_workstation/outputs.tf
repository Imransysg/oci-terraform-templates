output "chef_workstation_ocid" {
    value = "${oci_core_instance.chefworkstation.id}"
}
output "chef_workstation_publicip" {
   value = "${oci_core_instance.chefworkstation.public_ip}"
}