module "lambda" {
  source             = "genstackio/lambda/aws"
  version            = "0.1.0"
  name               = var.name
  file               = var.package_file
  runtime            = var.runtime
  timeout            = var.timeout
  memory_size        = var.memory_size
  handler            = var.handler
  variables          = var.variables
  enabled            = var.enabled
  policy_statements  = var.policy_statements
  tags               = var.tags
  layers             = var.layers
  subnet_ids         = length(var.subnet_ids) > 0 ? var.subnet_ids : null
  security_group_ids = length(var.security_group_ids) > 0 ? var.security_group_ids : null
}

module "apigw" {
  source     = "genstackio/apigateway2-api/aws"
  version    = "0.1.2"
  name       = var.name
  lambda_arn = module.lambda.arn
  cors       = true
}