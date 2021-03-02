# AWS Symfony Webapp Terraform module

Terraform module which creates a Symfony (PHP) Webapp (lambda + api gateway v2 api) on AWS.

## Usage

```hcl
module "webapp-symfony" {
  source       = "genstackio/webapp-symfony/aws"

  name         = "name-of-the-webapp"
  package_file = "/path/to/the/package.zip"
}
```
