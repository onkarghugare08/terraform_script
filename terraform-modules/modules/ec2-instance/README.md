# ec2-instance module
Creates a single `aws_instance`.

| Input | Type | Default |
|---|---|---|
| ami_id | string | - |
| instance_type | string | t2.micro |
| subnet_id | string | - |
| security_group_ids | list(string) | - |
| instance_name | string | - |
| tags | map(string) | {} |

Outputs: `instance_id`, `public_ip`, `private_ip`
