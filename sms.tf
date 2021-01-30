
resource "aws_cloudformation_stack" "sms" {
  name = "CHK-SMS1"
  parameters = {
	VPC =  aws_vpc.web-vpc.id
	ManagementSubnet = aws_subnet.public-subnet.id
  ManagementInstanceType = "m5.xlarge"
  KeyName = "sms-pair"
 ManagementPermissions = "None (configure later)"
 ManagementVersion = var.sms-version
ManagementPasswordHash = "$1$r6M1WRb0$03V5.OCs4ZtoCucuVgm2g."
 AdminCIDR = "0.0.0.0/0"
 GatewaysAddresses = "0.0.0.0/0"
  }
  template_url       = "https://cgi-cfts.s3.amazonaws.com/management/management.yaml"
  capabilities       = ["CAPABILITY_IAM"]
  timeout_in_minutes = 30
}

# openssl passwd -1 actualpassword                                                                                            $1$8Hs5QUmS$h2B0ZdPpP52pTCKjJDGDC0