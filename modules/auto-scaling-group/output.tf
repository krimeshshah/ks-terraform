output "private_key_pem" {
  value     = tls_private_key.ks_ssh_keypair.private_key_pem
  sensitive = true
}