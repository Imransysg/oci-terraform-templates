output "image_ocid" {
    value = "${lookup(data.oci_core_images.OLImageOCID.images[0], "id")}"
}
output "wimage_ocid" {
    value = "${lookup(data.oci_core_images.WLImageOCID.images[0], "id")}"
}