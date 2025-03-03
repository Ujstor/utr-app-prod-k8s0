module "grafana_client" {
  source                       = "git::https://gitlab.k3s0.ujstor.com/devops/terraform/terraform-keycloak-modules//modules/clients/oidc?ref=0.0.1"
  realm_id                     = local.realm_id
  client_id                    = "minio-harbor-backup-oauth"
  name                         = "Minio SSO"
  description                  = "Minio UTR-APP-PROD-K8S0"
  access_type                  = "CONFIDENTIAL"
  client_authenticator_type    = "client-secret"
  standard_flow_enabled        = true
  direct_access_grants_enabled = true
  valid_redirect_uris          = ["*"]
  root_url                     = local.minio_harbor_url
  base_url                     = local.minio_harbor_url
  web_origins                  = ["+"]
  admin_url                    = local.minio_harbor_url
  full_scope_allowed           = true
}
