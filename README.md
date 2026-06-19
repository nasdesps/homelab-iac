# homelab-iac

Infrastructure as Code for my homelab, managed entirely through a GitOps
pipeline: every infrastructure change goes through a pull request, gets
validated automatically, and only applies on merge to `main`.

## What this manages

- **Cloudflare DNS** — all DNS records for `prajwolbikramadhikari.com.np`,
  including the AdGuard DNS-over-TLS/HTTPS endpoint
- **Oracle Cloud infrastructure** — the VCN, subnet, and compute instance
  running AdGuard Home, a K3s worker node, and DeepSeek-R1 inference via Ollama

## GitOps pipeline

- PR opened/updated  → terraform-plan.yml runs terraform plan, posts the diff
- PR merged to main  → terraform-apply.yml runs terraform apply automatically

No infrastructure change is ever applied by hand. Every change is reviewable,
auditable in git history, and automatically validated before merge.

## State management

- **Backend**: AWS S3, with S3-native locking (`use_lockfile = true`) —
  no DynamoDB table required
- **Auth**: GitHub Actions authenticates to AWS via OIDC — no long-lived AWS
  credentials stored in CI

## Structure
.

├── main.tf                 # root module, wires the providers together

├── variables.tf            # root-level variable declarations

├── backend.tf              # S3 remote state config

├── terraform.tfvars        # local variable values (not committed)

└── modules/

├── cloudflare/             # DNS records

└── oracle/                 # VCN, subnet, compute instance

## Why this exists

This repo replaced manually clicking through the Cloudflare dashboard and
Oracle Cloud console. Every DNS record and every piece of Oracle infrastructure
is now defined in code, reviewed via pull request, and applied consistently —
the same workflow a platform team would use to manage production infrastructure,
scaled down to a homelab.

## Stack

Terraform · AWS S3 (remote state) · GitHub Actions (OIDC) · Cloudflare · Oracle Cloud Infrastructure
