locals {
    formatted_date = formatdate("YYYYMMDDhhmm", timestamp())
    ami_name = "${var.ami_name}${local.formatted_date}"
}

source "amazon-ebs" "proxysql"{
    ami_name = "${local.ami_name}"
    ami_description = "${var.ami_description}"
    profile = "${var.profile}"                  
    iam_instance_profile = "${var.iam_instance_profile}"
    ssh_username = "${var.ssh_username}"
    instance_type = "${var.instance_type}"
    subnet_id = "${var.subnet_id}"
    vpc_id = "${var.vpc_id}"

    source_ami_filter {
        filters = {
            name = "${var.source_ami_name}"
            root-device-type = "${var.source_root_device_type}"
            virtualization-type = "${var.source_virtualization_type}"
        }
        most_recent ="${var.source_most_recent}"
        owners = "${var.source_owners}"
    }

    tags = "${var.tags}"
}

build {
    sources = ["source.amazon-ebs.proxysql"]
    # provisioner "shell" {
    #    inline = ["sudo yum install -y python3-pip python3 python3-setuptools"]
    # }
    provisioner "ansible" {
        playbook_file = "./ansible/proxysql.yaml"
        roles_path = "./ansible/roles"
        keep_inventory_file = "false" 
        # extra_arguments = "${var.extra_arguments}"
        host_alias = "proxysql"
    }
}