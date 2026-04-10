terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# ── GitHub Pages CNAMEs ─────────────────────────────────────────────

resource "cloudflare_record" "portfolio_root" {
  zone_id = var.cloudflare_zone_id
  name    = "prajwolbikramadhikari.com.np"
  content = "nasdeps.github.io"
  type    = "CNAME"
  proxied = true
  comment = "Portfolio root — GitHub Pages"
}

resource "cloudflare_record" "portfolio_www" {
  zone_id = var.cloudflare_zone_id
  name    = "www"
  content = "nasdeps.github.io"
  type    = "CNAME"
  proxied = true
  comment = "Portfolio www — GitHub Pages"
}

# ── Cloudflare Tunnel CNAMEs ────────────────────────────────────────

resource "cloudflare_record" "tunnel_adguard" {
  zone_id = var.cloudflare_zone_id
  name    = "adguardhome"
  content = "${var.tunnel_id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
  comment = "AdGuard Home — homelab tunnel"
}

resource "cloudflare_record" "tunnel_cadvisor" {
  zone_id = var.cloudflare_zone_id
  name    = "cadvisor"
  content = "${var.tunnel_id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
  comment = "cAdvisor — homelab tunnel"
}

resource "cloudflare_record" "tunnel_grafana" {
  zone_id = var.cloudflare_zone_id
  name    = "grafana"
  content = "${var.tunnel_id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
  comment = "Grafana — homelab tunnel"
}

resource "cloudflare_record" "tunnel_homer" {
  zone_id = var.cloudflare_zone_id
  name    = "homer"
  content = "${var.tunnel_id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
  comment = "Homer — homelab tunnel"
}

resource "cloudflare_record" "tunnel_n8n" {
  zone_id = var.cloudflare_zone_id
  name    = "n8n"
  content = "${var.tunnel_id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
  comment = "n8n — homelab tunnel"
}

resource "cloudflare_record" "tunnel_npm" {
  zone_id = var.cloudflare_zone_id
  name    = "npm"
  content = "${var.tunnel_id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
  comment = "Nginx Proxy Manager — homelab tunnel"
}

resource "cloudflare_record" "tunnel_prometheus" {
  zone_id = var.cloudflare_zone_id
  name    = "prometheus"
  content = "${var.tunnel_id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
  comment = "Prometheus — homelab tunnel"
}

# ── Email security TXT records ──────────────────────────────────────

resource "cloudflare_record" "dmarc" {
  zone_id = var.cloudflare_zone_id
  name    = "_dmarc"
  content = "v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s; rua=mailto:prajwolad18@gmail.com"
  type    = "TXT"
  proxied = false
  comment = "DMARC policy"
}

resource "cloudflare_record" "dkim" {
  zone_id = var.cloudflare_zone_id
  name    = "*._domainkey"
  content = "v=DKIM1; p="
  type    = "TXT"
  proxied = false
  comment = "DKIM — domain sends no email"
}

resource "cloudflare_record" "spf" {
  zone_id = var.cloudflare_zone_id
  name    = "prajwolbikramadhikari.com.np"
  content = "v=spf1 -all"
  type    = "TXT"
  proxied = false
  comment = "SPF — domain sends no email"
}

resource "cloudflare_record" "github_pages_verify" {
  zone_id = var.cloudflare_zone_id
  name    = "_github-pages-challenge-nasdesps"
  content = "61850b8b0dccdbe19dc1468c18d53a"
  type    = "TXT"
  proxied = false
  comment = "GitHub Pages domain verification"
}
