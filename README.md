# Infrastructure as Code (IaC) - Golbert Client

Modular Terraform repository for multi-environment client infrastructure management adhering to senior DevOps standards.

## Directory Architecture

```text
infra-cliente-base/
├── versions.tf          # Global version pinning for Terraform (~> 1.9) and AWS provider (~> 5.0)
├── modules/             # Reusable modules
│   ├── vpc/
│   ├── s3/
│   ├── ec2_ebs/
│   ├── iam/
│   ├── eks/
│   ├── ecs/
│   ├── lambda/
│   ├── sqs/
│   ├── sns/
│   ├── ecr/
│   ├── dynamodb/
│   └── cloudfront/
└── envs/                # Environment-specific deployments
    ├── lab/             # Laboratory / Local and CI tests
    ├── dev/             # Development
    └── prd/             # Production
```

## Version Requirements (`versions.tf`)
- **Terraform**: `~> 1.9`
- **AWS Provider**: `~> 5.0`

## Available Modules (`modules/`)
- `vpc`: Virtual networks, subnets, route tables.
- `s3`: Storage buckets with optional lifecycle/encryption policies.
- `ec2_ebs`: Compute instances and attached volumes.
- `iam`: Roles, policies, and instance profiles.
- `eks`: Managed Kubernetes clusters (optional Karpenter/KEDA support).
- `ecs`: Containers with Fargate/EC2 clusters and task definitions.
- `lambda`: Serverless functions.
- `sqs`: Standard/FIFO message queues.
- `sns`: Notification topics.
- `ecr`: Private Docker image registry.
- `dynamodb`: NoSQL tables with provisioned/on-demand capacity.
- `cloudfront`: Global content delivery network (CDN).

## Workflow / Local Validation
To validate syntax and plan without incurring costs on real AWS:

```bash
# 1. Configure credentials (if planning against AWS)
aws configure

# 2. Enter the test environment
cd envs/lab

# 3. Initialize provider and modules
terraform init

# 4. Validate syntax and schema
terraform validate

# 5. Plan (ZERO terraform apply authorized during test validations)
terraform plan
```

Security Note: Do not execute terraform apply in test accounts or without explicit architectural authorization to prevent resource charges in AWS.