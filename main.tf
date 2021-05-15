provider "cloudflare" {
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}

resource "cloudflare_zone" "main" {
  zone = "jeandeau.fr"
  plan = "free"
}

resource "cloudflare_record" "alexis" {
  zone_id = cloudflare_zone.main.id
  name    = "alexis"
  value   = "jeandeaual.github.io"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "jeandeau_fr" {
  zone_id = cloudflare_zone.main.id
  name    = "jeandeau.fr"
  value   = "alexis.jeandeau.fr"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "www_alexis" {
  zone_id = cloudflare_zone.main.id
  name    = "www.alexis"
  value   = "alexis.jeandeau.fr"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "www" {
  zone_id = cloudflare_zone.main.id
  name    = "www"
  value   = "alexis.jeandeau.fr"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "google_site_verification" {
  zone_id = cloudflare_zone.main.id
  name    = "jeandeau.fr"
  value   = "google-site-verification=${var.google_site_verification}"
  type    = "TXT"
  proxied = false
}

resource "cloudflare_page_rule" "opds2_url_forward" {
  zone_id = cloudflare_zone.main.id
  target   = "alexis.jeandeau.fr/partitions/opds2"
  priority = 1

  actions {
    forwarding_url {
      url         = "https://alexis.jeandeau.fr/partitions/opds2/root.json"
      status_code = "301"
    }
  }
}

resource "cloudflare_page_rule" "opds_url_forward" {
  zone_id = cloudflare_zone.main.id
  target   = "alexis.jeandeau.fr/partitions/opds"
  priority = 2

  actions {
    forwarding_url {
      url         = "https://alexis.jeandeau.fr/partitions/opds/root.xml"
      status_code = "301"
    }
  }
}

resource "cloudflare_page_rule" "subdomain_url_forward" {
  zone_id = cloudflare_zone.main.id
  target   = "jeandeau.fr/*"
  priority = 3

  actions {
    forwarding_url {
      url         = "https://alexis.jeandeau.fr/$1"
      status_code = "301"
    }
  }
}
