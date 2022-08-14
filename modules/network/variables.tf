variable "cidr_block" {
  type = string
}

variable "public-subnet" {
  type = list(any)
}

variable "private-subnet" {
  type = list(any)
}

variable "availability_zone" {
  type = list(string)
}