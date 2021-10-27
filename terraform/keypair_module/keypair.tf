resource "aws_key_pair" "my_custom_key" {
    key_name = "my_custom_key"
    public_key = file("${var.PATH_TO_PUBLIC_KEY}")

    tags = {
        "description" : "My custom public key to connect using SSH"
    }
}