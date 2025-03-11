variable "cloudtrail_bucket_name" {
  type = string
}

variable "cloudtrail_name" {
  type    = string
  default = "account-trail"
}

variable "cloudtrail_include_global_service_events" {
  type    = bool
  default = true
}

variable "cloudtrail_is_multi_region_trail" {
  type    = bool
  default = true
}

variable "cloudtrail_enable_log_file_validation" {
  type    = bool
  default = true
}