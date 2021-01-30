variable "web_vpc" {
    description = "CIDR block of the created VPC"
    type        = string
    default     = "10.0.0.0/16"
}
variable "public1" {
    description = "CIDR block for public subnet in AZ1"
    type        = string
    default     = "10.0.0.0/24"
}
variable "private1" {
    description = "CIDR block for public subnet in AZ2"
    type        = string
    default     = "10.0.1.0/24"
}
variable "sms-version" {
    type        = string
    default     = "R81-BYOL"
}