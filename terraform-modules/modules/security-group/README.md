# security-group module
Creates a security group with one ingress rule per port (dynamic block) and allow-all egress.

Inputs: `vpc_id`, `sg_name`, `ingress_ports` (default [22, 80]), `tags`
Outputs: `sg_id`
