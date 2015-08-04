aws_vpc "coolvpc" do
  cidr_block '10.0.0.0/24'
  internet_gateway true
end

subnet1 = aws_subnet "subnet" do
  vpc 'coolvpc'
  cidr_block "10.0.0.0/26"
  availability_zone "us-east-1a"
end

subnet2 = aws_subnet "subnet_2" do
  vpc 'coolvpc'
  cidr_block "10.0.0.64/26"
  availability_zone "us-east-1c"
end

aws_rds_subnet_group "db-subnet-group" do
  db_subnet_group_description "some_description"
  subnets ['subnet', subnet2.aws_object.id]
end
