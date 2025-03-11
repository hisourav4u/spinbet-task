variable "config_bucket_name" {
  type = string
}

variable "config_delivery_channel_name" {
  type    = string
  default = "config-delivery-channel"
}

variable "config_recorder_name" {
  type    = string
  default = "config-recorder"
}