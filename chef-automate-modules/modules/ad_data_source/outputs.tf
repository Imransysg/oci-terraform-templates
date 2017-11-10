output "ad1_name" {
    value = "${lookup(data.oci_identity_availability_domains.chefAD.availability_domains[1],"name")}"
}
