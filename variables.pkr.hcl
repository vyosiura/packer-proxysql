variable "source_ami_name" {
    type    = string
    default = "amzn2-ami-hvm-2.0.20210427.0-x86_64-gp2"
}

variable "source_root_device_type" {
    type    = string
    default = "ebs"
}

variable "source_virtualization_type" {
    type    = string
    default = "hvm"
}

variable "source_most_recent" {
    type    = bool
    default = true
}

variable "source_owners" {
    type    = list(string)
    default = ["137112412989"]
}

variable "ami_name" {
    type    = string
    default = "proxysql-image-"
}

variable "ami_description" {
    type    = string
    default = "Amazon Linux 2 with lastest ProxySQL Version"
}

variable "profile" {
    type    = string
    default = null
}

variable "iam_instance_profile" {
    type    = string 
    default = null
}

variable "ssh_username" {
    type    = string
    default = "ec2-user"
}

variable "instance_type" {
    type    = string
    default = "t3.medium"
}

variable "subnet_id" {
    type    = string 
    default = null
}

variable "vpc_id" {
    type    = string
    default = null
}

variable "tags" {
    type    = map(string)
    default = {
        Name = "proxysql"
        Packer = "true"
    }
}