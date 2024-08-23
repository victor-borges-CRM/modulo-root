locals {
  vpc_id    = "vpc-0708bc60b0f86d2d7"
  subnet_id = "subnet-0b95c3402dc7a40bd"
}

module "ec2" {
  source                 = "git@github.com:victor-borges-CRM/modulo-ec2.git?ref=v1.0.6"
  tipo_instancia         = "t3.micro"
  nome                   = "Teste_INF_561"
  vpc_id                 = local.vpc_id
  iam_instance_profile   = module.iam.nome_role
  vpc_security_group_ids = [module.securityGroup.sg_id]
  subnet_id              = local.subnet_id
  #key_name               = "Teste_INF_561"
}

#module "iam" {
#  source                = "git@github.com:victor-borges-CRM/modulo-iam.git?ref=v1.0.2"
#  nome_role_iam         = "PermiteSSMGenrenciarEC2"
#  nome_instance_profile = "test_perfil_ec2"
#}

module "securityGroup" {
  source              = "git@github.com:victor-borges-CRM/modulo-securityGroup.git?ref=v1.0.2"
  nome_security_group = "Teste_INF_561"
  vpc_id              = local.vpc_id
}
