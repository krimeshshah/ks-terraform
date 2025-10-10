# Generate new RSA key pair
resource "tls_private_key" "ks_ssh_keypair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Register the public key in AWS EC2
resource "aws_key_pair" "ks_ssh_pub_key" {
  key_name   = "ks-ssh-tf"
  public_key = tls_private_key.ks_ssh_keypair.public_key_openssh
}

####  Save the private key locally but in this case it will still store the private key to tf state  in plain text formate so ignoring below block

# resource "local_file" "private_key_pem" {
#   content          = tls_private_key.ks_ssh_key.private_key_pem
#   filename         = "~/.ssh/ks_bastion_from_tf.pem"
#   file_permission  = "0600"
# }

### Instead of above block to store private key locally, we generate and store the private key locally to avoid private key being store in tf state
resource "null_resource" "save_private_key" {
  provisioner "local-exec" {
    command = <<EOT
      umask 077
      echo '${tls_private_key.ks_ssh_keypair.private_key_pem}' > ~/.ssh/ks_bastion_from_tf.pem
    EOT
  }
}

### If we are in shared environment where we work with team , we can store the private key in secret manager by uncommenting below two block

# resource "aws_secretsmanager_secret" "ssh_private_key" {
#   name        = "ks-bastion-private-key"
#   description = "Private SSH key for Bastion host"
# }

# resource "aws_secretsmanager_secret_version" "ssh_private_key_value" {
#   secret_id     = aws_secretsmanager_secret.ssh_private_key.id
#   secret_string = tls_private_key.ks_key.private_key_pem
# }



