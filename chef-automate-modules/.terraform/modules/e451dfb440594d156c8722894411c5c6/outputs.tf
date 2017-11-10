output "chef_server_ocid" {
    value = "${oci_core_instance.chefVM.id}"
}
