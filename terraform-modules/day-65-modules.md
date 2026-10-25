# Day 65 -- Terraform Modules

Region: `us-west-2` | OS: Ubuntu 22.04 LTS (Canonical AMI, looked up via data source)

## Task 1: Module structure

```
terraform-modules/
  main.tf
  variables.tf
  outputs.tf
  providers.tf
  modules/
    ec2-instance/      (main.tf, variables.tf, outputs.tf, README.md)
    security-group/    (main.tf, variables.tf, outputs.tf, README.md)
```

**Root module vs child module:** the root module is the directory where you run `terraform init/plan/apply`; it is the entry point. A child module is any module called from another module with a `module` block. It takes inputs, creates resources, and returns outputs. Root = the caller, child = the reusable building block.

## Task 2: EC2 module
See `modules/ec2-instance/variables.tf`, `main.tf`, `outputs.tf` (paste contents here).

## Task 3: Security group module
Uses `dynamic "ingress"` to generate one rule per entry in `ingress_ports`. Egress allows all.

## Task 4: Root module wiring
`web_sg` -> `web_server` and `api_server` (same EC2 module, called twice with different names). Paste root `main.tf` here.

## Task 5: Registry VPC module
`terraform-aws-modules/vpc/aws ~> 5.0` replaces hand-written VPC resources.

| | Hand-written (Day 62) | Registry module |
|---|---|---|
| Resources | ~6 (vpc, igw, subnet, route table, route, association) | run `terraform state list \| grep module.vpc \| wc -l` and fill in |
| Subnets | 1 public | 2 public + 2 private |
| Lines of code | ~50 | ~15 |

Registry modules are downloaded to `.terraform/modules/` (plus `modules.json` listing them).

## Task 6: Versioning and best practices
- `version = "5.1.0"` exact | `"~> 5.0"` any 5.x | `">= 5.0, < 6.0"` range
- `terraform init -upgrade` checks for newer allowed versions
- `terraform state list` shows `module.vpc.*`, `module.web_sg.*`, `module.web_server.*`, `module.api_server.*`

### Five best practices
1. Pin registry module versions so upgrades never surprise you.
2. One concern per module (EC2 separate from security group).
3. Everything configurable is a variable; nothing hardcoded.
4. Always output IDs/IPs so callers can wire modules together.
5. Add a README.md to every custom module.

## Screenshot
(Add screenshot of both EC2 instances in the us-west-2 console here.)
