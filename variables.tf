variable "allowed_ip" {
  description = "IP address allowed for Security group"
  type        = string
  default     = "1.1.1.1/32"
}

variable "ami" {
  description = "Instance image"
  type        = string
  default     = "ami-0f2967bce4653714"
}