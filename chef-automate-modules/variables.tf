variable "compartment_ocid" {
  default = "ocid1.compartment.oc1..aaaaaaaajgefvmehc6szlyyt66aiu6ecefhr7myrn32w2c5prxng5mq3wu7q"
}
variable "prefix" {
    default= "chef"
}
variable "vcnCidr" {
  default= "10.0.0.0/16"
}
variable "rtCIDR" {
  default = "0.0.0.0/0"
}
variable "subnet1" {
  default = "10.0.0.0/24"
}
variable "LinuxInstanceOS" {
  default = "Canonical Ubuntu"
}
variable "LinuxInstanceOSVersion" {
  default = "16.04"
}
variable "InstanceShape" {
  default = "VM.Standard1.2"
}
variable "BootStrapFile1" {
  default ="./user-data/enablepassword.sh"
}
variable "sshKey" {
  default="ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAoI3G2NvBStynJXG6cXPuT8PlzJVVHUd8v7mAbK2E+d4kdm0pt/1VMWfA5p0UMaLw6vG0ZxEqUoDObHHV18cTTDG95CXXDgiM5mMPepXgeQZpG+TxJ5NJq+Z4IwPt0q6W0L9AYFCg50b7BhO3S/jngYY74kh4T63gNJ/OlUzL8hnOT93Cq+XNBrAZZdzC/k2nqLxJfM/l5EccYGnaGkdm34C4JCacRKTb43CDK9JXe3n7SrahsfeybYWsxfw69gwNj0fxwzPUDeyEsprjqZEjGGR3H58gmFe3+2TN7Bmv6TZK2H3W4EU0yQpWoPpYz0oDmyHHbf3/Ia8Vhgqg0rV3UQ== rsa-key-20171110"
}
variable "ssh_private_key" {
  default ="./user-data/ssh_private_key.pem"
}
variable "WindowsInstanceOS" {
  default = "Windows"
}
variable "WindowsInstanceOSVersion" {
  default = "Server 2012 R2 Standard"
}