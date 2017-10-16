resource "oci_core_instance" "chefVM-server" {
    availability_domain = "${lookup(data.oci_identity_availability_domains.chefAD.availability_domains[1],"name")}"
    compartment_id = "${var.compId}"
    display_name = "${var.vcnDisplayName}-VM-server${random_id.unq.hex}"
    image = "${lookup(data.oci_core_images.OLImageOCID.images[0], "id")}"
    shape = "${var.InstanceShape}"
    subnet_id = "${oci_core_subnet.chefsubnet1.id}"

create_vnic_details {
    subnet_id = "${oci_core_subnet.chefsubnet1.id}"
    display_name = "${var.nicName}"
    assign_public_ip = true
    hostname_label = "chef${random_id.unq.hex}"
}
metadata {
   ssh_authorized_keys = "${var.sshKey}"
   }
}
resource "null_resource" "remote-exec" {
  depends_on = ["oci_core_instance.chefVM-server"]
    provisioner "remote-exec" {
     connection {
        agent = false
       timeout = "15m"
       host = "${data.oci_core_vnic.InstanceVnic.public_ip_address}"
       user = "ubuntu"
       private_key = "${(file(var.BootStrapFile))}"
     }
     inline = [
       "curl https://raw.githubusercontent.com/sudheermareddy/test/master/chefautomate.sh > chefautomate.sh",
       "chmod +x chefautomate.sh",
       "./chefautomate.sh"
     ]
   }
}
