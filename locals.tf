locals {
    role_arns = lookup(var.role_arns, var.environment)
}