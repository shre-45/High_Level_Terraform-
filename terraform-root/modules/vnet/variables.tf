variable "vnet_name" {
  type        = string
  description = "Name of virtual network"
}

variable "address_space" {
  type        = list(string)
  description = "Address prefixes for virtual network"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for VNet"
}

variable "subnets" {
  type = list(object({
    name           = string
    address_prefix = string
  }))
  description = "List of subnets"
}

variable "priority" {
  description = "The priority of the network security rule."
  type        = number
}

variable "direction" {
  description = "The direction of the network security rule. Allowed values: 'Inbound' or 'Outbound'."
  type        = string
}

variable "access" {
  description = "Whether network traffic is allowed or denied. Allowed values: 'Allow' or 'Deny'."
  type        = string
}

variable "protocol" {
  description = "The network protocol to which this rule applies. Allowed values: 'Tcp', 'Udp', or '*' for any."
  type        = string
}

variable "source_port_range" {
  description = "The source port or range of ports for the rule. Use '*' for any."
  type        = string
}

variable "destination_port_range" {
  description = "The destination port or range of ports for the rule. Use '*' for any."
  type        = string
}

variable "source_address_prefix" {
  description = "The source address prefix. Use '*' for any."
  type        = string
}

variable "destination_address_prefix" {
  description = "The destination address prefix. Use '*' for any."
  type        = string
}
