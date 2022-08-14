Porject use terraform to povisioning and ansible to configuration

 - Delete file "key-ssh.pem" (created from last running), when you running new project file "key-ssh.pem" will be create.

Terraform command to provisioning:

1. terraform init 
2. terraform plan
3. terraform apply -auto-approve
4. when provisiong cpmletetd please copy:
 - "Public IPv4 DNS" address of ec2 instance No1
 - "Public IPv4 DNS" address of ec2 instance No2
 - Load balcer DNS name
 - Database endpoint

Then replace:

1. Open file: inventory.txt
 - repalce 2 ansible_host by 2 ec2 dns name

2. Open file: wp-config.php (database configure file)

 - replace: HOST DB address by db dns name

3. When completed, run ansible command to configure:
 
 - ansible-playbook wordpress-playbook.yaml

4. when ansible configured doned,
 
 - run output lb dns name
