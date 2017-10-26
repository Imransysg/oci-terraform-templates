output "workstation_InstancePublicIP" {
  value = ["${oci_core_instance.chefworkstation.public_ip}"]
}
output "Automate_InstancePublicIP" {
  value = ["https://${oci_core_instance.chefVM-2.public_ip}"]
}
output "automateusername" {
  value = ["${var.admin-username}"]
}
output "automatepassword" {
  value = ["${var.password}"]
}
output "Workstation_Username" {
  value = ["${data.oci_core_instance_credentials.InstanceCredentials.username}"]
}
output "Workstation_Password" {
  value = ["${data.oci_core_instance_credentials.InstanceCredentials.password}"]
}
