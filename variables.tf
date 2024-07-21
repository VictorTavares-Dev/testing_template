variable "environment" {
    description = "The environment (dev, hom, prod)"
    type        = string
    default     = "dev"
}

variable "role_arns" {
    description = "List of possible role ARNs based on the environment"
    type        = map(list(string))
    default     = {
        dev  = [
            "arn:aws:iam::123456789012:role/dev-role"
        ],
        hom  = [
            "arn:aws:iam::123456789012:role/dev-role",
            "arn:aws:iam::123456789012:role/hom-role"
        ],
        prod = [
            "arn:aws:iam::123456789012:role/dev-role",
            "arn:aws:iam::123456789012:role/hom-role",
            "arn:aws:iam::123456789012:role/prod-role"
        ]
    }
}