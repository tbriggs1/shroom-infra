variable "my-var" {
  description = "Testing Variables"
  type        = string
  default     = "hello"
}

variable "docker_ports" {
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = [
    {
      internal = 443
      external = 555
      protocol = "tcp"
    }
  ]
}

variable "key_path" {
  description = "Key for the ec2 instance"
  default     = "~/.ssh/tom.pem"
}