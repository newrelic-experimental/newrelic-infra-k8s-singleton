[![Experimental header](https://github.com/newrelic/opensource-website/raw/master/src/images/categories/Experimental.png)](https://opensource.newrelic.com/oss-category/#new-relic-experimental)

# newrelic-infra-k8s-singleton

![Version: 1.1.1](https://img.shields.io/badge/Version-1.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.2.24](https://img.shields.io/badge/AppVersion-3.2.24-informational?style=flat-square)

Installs the New Relic Infrastructure agent as a Kubernetes singleton deployment

# Helm installation

You can install this chart by adding this Helm repository:

```shell
helm repo add nri-k8s-singleton https://newrelic-experimental.github.io/newrelic-infra-k8s-singleton
helm repo update
helm upgrade --install nri-k8s-singleton nri-k8s-singleton/newrelic-infra-k8s-singleton -f values.yaml
```

## Values managed globally

This chart implements the [New Relic's common Helm library](https://github.com/newrelic/helm-charts/tree/master/library/common-library) which
means that it honors a wide range of defaults and globals common to most New Relic Helm charts.

Options that can be defined globally include `affinity`, `nodeSelector`, `tolerations`, `proxy` and others. The full list can be found at
[user's guide of the common library](https://github.com/newrelic/helm-charts/blob/master/library/common-library/README.md).

## Chart particularities

Here is where you should add particularities for this chart like what does the chart do with the privileged and
low data modes or any other quirk that it could have.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| cluster | string | `""` |  |
| clusternamehack | string | `"{\"clusterName\": \"\"}"` |  |
| config."nri-flex.yaml" | string | `"integrations:\n- name: nri-flex\n  # interval: 30s\n  config:\n    name: pingFlex\n    apis:\n      - name: ping\n        commands:\n          - name: google\n            run: ping -c 5 google.com || true\n            split_output: statistics ---\n            regex_matches:\n              - expression: ([0-9]+\\.?[0-9]+)\\/([0-9]+\\.?[0-9]+)\\/([0-9]+\\.?[0-9]+)\n                keys: [min, avg, max]\n                ### there are two different variants for the packet statistics returned, below allows support for both\n              - expression: (\\d+) packets transmitted, (\\d+) packets received, (\\S+)% packet loss\n                keys: [packetsTransmitted, packetsReceived, packetLoss]\n              - expression: (\\d+) packets transmitted, (\\d+) received, (\\d+)% packet loss, time (\\d+)\n                keys:\n                  [packetsTransmitted, packetsReceived, packetLoss, timeMs]\n        custom_attributes:\n          url: google.com\n"` |  |
| containerSecurityContext | object | `{}` |  |
| customSecretLicenseKey | string | `""` |  |
| customSecretName | string | `""` |  |
| deploymentAnnotations | object | `{}` |  |
| dnsconfig | object | `{}` |  |
| fedRamp.enabled | string | `nil` |  |
| fullnameOverride | string | `""` |  |
| hostNetwork | string | `nil` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `nil` |  |
| image.repository | string | `"newrelic/infrastructure-bundle"` |  |
| image.tag | string | `"3.2.24"` |  |
| imagePullSecrets | list | `[]` |  |
| labels | object | `{}` |  |
| licenseKey | string | `""` |  |
| lowDataMode | string | `nil` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| nrStaging | string | `nil` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| priorityClassName | string | `""` |  |
| privileged | string | `nil` |  |
| proxy | string | `nil` |  |
| resources | object | `{}` |  |
| serviceAccount.annotations | string | `nil` |  |
| serviceAccount.create | string | `nil` |  |
| serviceAccount.name | string | `nil` |  |
| tolerations | list | `[]` |  |
| verboseLog | string | `nil` |  |

## Maintainers

* [Max Lemieux](https://github.com/maxlemieux)
* [Brad Schmitt](https://github.com/bpschmitt)
