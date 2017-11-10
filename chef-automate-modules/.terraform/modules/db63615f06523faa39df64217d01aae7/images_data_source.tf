data "oci_core_images" "OLImageOCID" {
    compartment_id = "${var.compartment_ocid}"
    operating_system = "${var.LinuxInstanceOS}"
    operating_system_version="${var.LinuxInstanceOSVersion}"
    }

data "oci_core_images" "WLImageOCID" {
    compartment_id = "${var.compId}"
    operating_system = "${var.WindowsInstanceOS}"
    operating_system_version="${var.WindowsInstanceOSVersion}"
    }