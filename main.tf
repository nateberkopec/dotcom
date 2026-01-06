locals {
  canonical_host = "www.nateberkopec.com"
}

provider "cloudflare" {}

resource "cloudflare_ruleset" "blog_legacy_redirects" {
  kind    = "zone"
  name    = "default"
  phase   = "http_request_dynamic_redirect"
  zone_id = var.cloudflare_zone_id

  rules {
    action      = "redirect"
    description = "Redirect from HTTP to HTTPS [Template]"
    enabled     = true
    expression  = <<-EOT
      (http.request.full_uri wildcard r"http://*")
    EOT

    action_parameters {
      from_value {
        preserve_query_string = false
        status_code           = 301
        target_url {
          expression = "wildcard_replace(http.request.full_uri, r\"http://*\", r\"https://$${1}\")"
        }
      }
    }
  }

  rules {
    action      = "redirect"
    description = "Redirect from Root to WWW [Template]"
    enabled     = true
    expression  = <<-EOT
      (http.request.full_uri wildcard r"https://nateberkopec.com/*")
    EOT

    action_parameters {
      from_value {
        preserve_query_string = false
        status_code           = 301
        target_url {
          expression = "wildcard_replace(http.request.full_uri, r\"https://nateberkopec.com/*\", r\"https://www.nateberkopec.com/$${1}\")"
        }
      }
    }
  }

  rules {
    action      = "redirect"
    description = "Legacy blog URLs to /blog/:slug/"
    enabled     = true
    expression  = <<-EOT
      (http.request.full_uri wildcard r"https://www.nateberkopec.com/blog/*/*/*/*.html")
    EOT

    action_parameters {
      from_value {
        preserve_query_string = true
        status_code           = 301
        target_url {
          expression = <<-EOT
            wildcard_replace(http.request.full_uri, r"https://www.nateberkopec.com/blog/*/*/*/*.html", r"https://www.nateberkopec.com/blog/$${4}/")
          EOT
        }
      }
    }
  }
}
