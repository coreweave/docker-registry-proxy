SHELL=/usr/bin/env bash -o pipefail

export GLOBALVARS := ./global-values/argocd-app-suites

render:
	@rm -rf rendered/**/*
	@helm template helm/regproxy --namespace regproxy -f ${GLOBALVARS}/values.yaml -f ${GLOBALVARS}/values-base-dev-cluster.yaml -f ${GLOBALVARS}/values-base-dev1.yaml -f ${GLOBALVARS}/values-dev-cluster-internal.yaml -f ${GLOBALVARS}/values-dev1a-internal.yaml -f helm/regproxy/values.yaml > rendered/dev1a-internal/regproxy.yaml

.PHONY: render
