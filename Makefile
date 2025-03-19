all: update-repos k3s1

k3s1: build_system_k3s1 build_apps_k3s1

update-repos:
	@echo "Updating Helm repositories..."
	@helm repo update

# Paths
CHART_DIR_SYSTEM_K3S1 := gitops/helm/system
CHART_DIR_APPS_K3S1 := gitops/helm/apps

# k3s1-app cluster packages
CHART_SYSTEM_K3S1 := cert-manager cilium ingress-nginx cluster-issuer external-secrets postgres-operator minio-operator metallb-operator metallb-config prometheus-grafana kyverno ingress-nginx-ds

CHART_APPS_K3S1 := portfolio streamlit-wh todo-go-htmx notes-flask plausible-analytics wordpress-ds probit-api github-readme-stats todo-django fastapi s3-storage s3-harbor-backup

# Define pattern rules for k3s1
build_system_k3s1: $(addprefix k3s1-system-,$(CHART_SYSTEM_K3S1))
build_apps_k3s1: $(addprefix k3s1-apps-,$(CHART_APPS_K3S1))

k3s1-system-%:
	@echo "Packaging $* chart for k3s1 system..."
	@helm dependency update --skip-refresh $(CHART_DIR_SYSTEM_K3S1)/$*

k3s1-apps-%:
	@echo "Packaging $* chart for k3s1 apps..."
	@helm dependency update --skip-refresh $(CHART_DIR_APPS_K3S1)/$*

.PHONY: all k3s1 build_system_k3s1 build_apps_k3s1
