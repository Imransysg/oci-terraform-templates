
output "Chefserver_PublicIP" {
  value = ["${module.vnic_data_source.chefserver_public_ip}"]
}
output "Chefautomate_public_ip" {
    value = "${module.vnic_data_source.chefautomate_public_ip}"
}
