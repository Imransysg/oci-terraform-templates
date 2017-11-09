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