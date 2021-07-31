variable "firewall_name" {
  description = "Firewall module name."
  type        = string
  default     = "allow-http"
}

variable "network_name" {
  description = "Network to use."
  type        = string
  default     = "default"
}

variable "protocol_name" {
  description = "Name for protocol."
  type        = string
  default     = "tcp"
}