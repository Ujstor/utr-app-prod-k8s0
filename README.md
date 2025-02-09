# K3S1 Single Node IaC

K3s is stripped down to minimal components. The only components we have are CoreDNS, local-path-provisioner, and metrics-server. Everything else is disabled and configured with custom Helm charts.

The clusters will be automatically bootstrapped and managed with [ArgoCD](https://argo-cd.readthedocs.io/en/stable/).

## Prerequisites

Before you begin, ensure you have the following:

- [Hetzner Cloud account](https://hetzner.cloud/?ref=Ix9xCKNxJriM) (20$ free credits)
- [Terraform](https://www.terraform.io/downloads.html)
- [Helm](https://helm.sh/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
- [K9s](https://k9scli.io/) (optional but recommended)

The main idea is to have a primary single-node operations K3s cluster that has ArgoCD and an App of Apps pattern to manage both operations and other K3s single or multi-node clusters.

Helm charts and Terraform modules are custom-made with the intention to be reusable and reconfigurable:

- [Helm Charts System](https://github.com/Ujstor/helm-charts-system)
- [Helm Charts Apps](https://github.com/Ujstor/helm-charts-apps)
- [Helm Charts Github Apps](https://github.com/Ujstor/helm-charts-github-apps)
- [Terraform Hetzner Modules](https://github.com/Ujstor/terraform-hetzner-modules)

## TF module in provate repo

```bash
~/.terraformrc

credentials "gitlab.k3s0.ujstor.com" {
  token = "gitlab_token"
}
```
