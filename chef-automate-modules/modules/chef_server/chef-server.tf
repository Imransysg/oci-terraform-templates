resource "oci_core_instance" "chefVM" {
    availability_domain = "${var.ad1_name}"
    compartment_id = "${var.compartment_ocid}"
    display_name = "${var.prefix}-server${var.uid}"
    image = "${var.image_ocid}"
    shape = "${var.InstanceShape}"
    subnet_id = "${var.subnet_ocid}"
create_vnic_details {
    subnet_id = "${var.subnet_ocid}"
    display_name = "${var.prefix}-nic1"
    assign_public_ip = true
    private_ip = "10.0.0.3"
    hostname_label = "${var.prefix}-server"
}
metadata {
   ssh_authorized_keys = "${var.sshKey}"
   user_data = "${base64encode(file(var.BootStrapFile1))}"
}
}

resource "null_resource" "remote-exec" {
  depends_on = ["oci_core_instance.chefVM"]
    provisioner "remote-exec" {
     connection {
        agent = false
       timeout = "15m"
       host = "${var.chefserver_public_ip}"
       user = "ubuntu"
       private_key = "${(file(var.ssh_private_key))}"
     }
     inline = [
       "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-chef-automate/chef-automate-modules/userdata/chefserver.sh > chefserver.sh",
       "chmod 777 chefserver.sh",
       "cat chefserver.sh | tr -d '\r' > newchef.sh",
       "chmod +x newchef.sh",
       "./newchef.sh"
     ]
   }
}