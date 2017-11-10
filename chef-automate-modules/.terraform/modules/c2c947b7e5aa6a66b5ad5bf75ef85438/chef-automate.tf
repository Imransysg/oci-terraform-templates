resource "oci_core_instance" "chefVM2" {
    availability_domain = "${var.ad1_name}"
    compartment_id = "${var.compartment_ocid}"
    display_name = "${var.prefix}-automate${var.uid}"
    image = "${var.image_ocid}"
    shape = "${var.InstanceShape}"
    subnet_id = "${var.subnet_ocid}"
create_vnic_details {
    subnet_id = "${var.subnet_ocid}"
    display_name = "${var.prefix}-nic1"
    assign_public_ip = true
    private_ip = "10.0.0.4"
    hostname_label = "${var.prefix}-server"
}
metadata {
   ssh_authorized_keys = "${var.sshKey}"
}
}

resource "null_resource" "remote-exec2" {
  depends_on = ["oci_core_instance.chefVM2"]
    provisioner "remote-exec" {
     connection {
        agent = false
       timeout = "15m"
       host = "${var.chefautomate_public_ip}"
       user = "ubuntu"
       private_key = "${(file(var.ssh_private_key))}"
     }
     inline = [
       "curl https://raw.githubusercontent.com/sysgain/oci-terraform-templates/oci-chef-automate/chef-automate-modules/userdata/chefautomate.sh > chefserver.sh",
       "chmod 777 chefautomate.sh",
       "cat chefautomate.sh | tr -d '\r' > newchef.sh",
       "chmod +x newchef.sh",
       "./newchef.sh"
     ]
   }
}