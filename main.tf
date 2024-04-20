resource "tls_private_key" "this" {
  count = length(var.key_name)
  algorithm = element(var.private_key_algorithm, count.index) 
  rsa_bits  = element(var.private_key_rsa_bits, count.index) 
}

resource "aws_key_pair" "keypair" {
  count = length(var.key_name)
  key_name   = element(var.key_name, count.index) 
  public_key = tls_private_key.this[count.index].public_key_openssh
}

# save private key
resource "local_sensitive_file" "private_key_pem" {  
  count = length(var.key_name)
  filename        = element(var.private_key_path, count.index) 
  file_permission = element(var.key_pair_permission, count.index) 
  content         = tls_private_key.this[count.index].private_key_pem
}

# save public key
resource "local_sensitive_file" "public_key_openssh" {
  count = length(var.key_name)
  filename        = element(var.public_key_path, count.index) 
  file_permission = element(var.key_pair_permission, count.index) 
  content         = tls_private_key.this[count.index].public_key_openssh
}



