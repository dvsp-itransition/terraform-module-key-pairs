variable "key_pair_permission" {
  description = "Permission to set for the private key file."  
  type        = list(number)
  sensitive = true # Mark the variable as sensitive
}

variable "private_key_path" {
  description = "Path to the private key file."  
   type        = list(string)
   sensitive = true # Mark the variable as sensitive
}

variable "public_key_path" {
  description = "Path to the public key file."  
   type        = list(string)   
}

variable "key_name" {
  description = "Name of the key pair."  
   type        = list(string)
}

variable "private_key_algorithm" {
  description = "Algorithm used for generating the private key."  
   type        = list(string)
   sensitive = true # Mark the variable as sensitive
}

variable "private_key_rsa_bits" {
  description = "the size of the generated RSA key, in bits"  
  type        = list(number)
  sensitive = true # Mark the variable as sensitive
}
