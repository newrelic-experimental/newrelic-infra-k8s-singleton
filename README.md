<a href="https://opensource.newrelic.com/oss-category/#new-relic-experimental"><picture><source media="(prefers-color-scheme: dark)" srcset="https://github.com/newrelic/opensource-website/raw/main/src/images/categories/dark/Experimental.png"><source media="(prefers-color-scheme: light)" srcset="https://github.com/newrelic/opensource-website/raw/main/src/images/categories/Experimental.png"><img alt="New Relic Open Source experimental project banner." src="https://github.com/newrelic/opensource-website/raw/main/src/images/categories/Experimental.png"></picture></a>

# New Relic Infrastructure K8s Singleton
![GitHub forks](https://img.shields.io/github/forks/newrelic-experimental/newrelic-infra-k8s-singleton?style=social)
![GitHub stars](https://img.shields.io/github/stars/newrelic-experimental/newrelic-infra-k8s-singleton?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/newrelic-experimental/newrelic-infra-k8s-singleton?style=social)

![GitHub issues](https://img.shields.io/github/issues/newrelic-experimental/newrelic-infra-k8s-singleton)
![GitHub issues closed](https://img.shields.io/github/issues-closed/newrelic-experimental/newrelic-infra-k8s-singleton)
![GitHub pull requests](https://img.shields.io/github/issues-pr/newrelic-experimental/newrelic-infra-k8s-singleton)
![GitHub pull requests closed](https://img.shields.io/github/issues-pr-closed/newrelic-experimental/newrelic-infra-k8s-singleton)


## Value

|Metrics | Events | Logs | Traces | Visualization | Automation |
|:-:|:-:|:-:|:-:|:-:|:-:|
|:-:|:white_check_mark:|:x:|:x:|:x:|:x:|


## Overview

A New Relic Infrastructure deployment example for running [New Relic On-Host Integrations](https://docs.newrelic.com/docs/infrastructure/host-integrations/get-started/introduction-host-integrations/) in Kubernetes.  For Kubernetes performance and state metrics, and most other use cases, customers should use the [New Relic Kubernetes integration](https://docs.newrelic.com/docs/kubernetes-pixie/kubernetes-integration/installation/kubernetes-integration-install-configure/). The New Relic Kubernetes integration is configured to run the New Relic Infrastructure agent as a [Daemonset](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/).  

## When to use

This Singleton should be used instead of the [New Relic Kubernetes Integration](https://docs.newrelic.com/docs/kubernetes-pixie/kubernetes-integration/installation/kubernetes-integration-install-configure/) when:

- The On-Host Integration **does not** need to run on every Kubernetes worker node
- The On-Host Integration is connecting to an endpoint outside of the cluster (e.g. an RDS database)

## Installation

### kubectl

Create a secret containing your New Relic license (ingest) key and store it in the same namespace where your deployment will be running.

```
kubectl create secret generic newrelic-license-key --from-literal=license-key=<NR LICENSE KEY HERE> -n newrelic
```

After creating your secret, update the `configmap.yaml` and deploy the agent.

```
kubectl apply -f ./agent/. -n newrelic
```

### Helm

Coming soon...

## Support

New Relic has open-sourced this project. This project is provided AS-IS WITHOUT WARRANTY OR DEDICATED SUPPORT. Issues and contributions should be reported to the project here on GitHub.

>We encourage you to bring your experiences and questions to the [Explorers Hub](https://discuss.newrelic.com) where our community members collaborate on solutions and new ideas.


## Contributing

We encourage your contributions to improve the New Relic Infrastructure K8s Singleton! Keep in mind when you submit your pull request, you'll need to sign the CLA via the click-through using CLA-Assistant. You only have to sign the CLA one time per project. If you have any questions, or to execute our corporate CLA, required if your contribution is on behalf of a company, please drop us an email at opensource@newrelic.com.

**A note about vulnerabilities**

As noted in our [security policy](../../security/policy), New Relic is committed to the privacy and security of our customers and their data. We believe that providing coordinated disclosure by security researchers and engaging with the security community are important means to achieve our security goals.

If you believe you have found a security vulnerability in this project or any of New Relic's products or websites, we welcome and greatly appreciate you reporting it to New Relic through [HackerOne](https://hackerone.com/newrelic).

## License

New Relic Infrastructure K8s Singleton is licensed under the [Apache 2.0](http://apache.org/licenses/LICENSE-2.0.txt) License.

