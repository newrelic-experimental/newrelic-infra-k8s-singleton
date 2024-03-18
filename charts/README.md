## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

  helm repo add nri-k8s-singleton https://newrelic-experimental.github.io/newrelic-infra-k8s-singleton

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
nri-k8s-singleton` to see the charts.

To install the newrelic-infra-k8s-singleton chart:

    helm install my-newrelic-infra-k8s-singleton nri-k8s-singleton/newrelic-infra-k8s-singleton

To uninstall the chart:

    helm delete my-newrelic-infra-k8s-singleton

## Customization

Customize the integration configuration as needed in templates/configmap.yaml. Use regular Linux OHI examples for this, not Kubernetes OHI examples. Here is an example of the correct type: [mysql-config.yml.sample](https://github.com/newrelic/nri-mysql/blob/master/mysql-config.yml.sample)

Required configuration: set `licenseKey` in `values.yaml` to a valid New Relic ingest license key.

Install the chart:

```
helm install -n newrelic . newrelic-infra-k8s-singleton -f values.yaml
```

# Testing

Install the Bitnami MySQL Helm chart: https://bitnami.com/stack/mysql/helm

Follow the install message directions to open a shell on the MySQL server, and add the `newrelic` user per the directions [here](https://docs.newrelic.com/install/mysql/#enable-your-mysql-server-3).

```
mysql -e "CREATE USER 'newrelic'@'localhost' IDENTIFIED BY $YOUR_PASSWORD WITH MAX_USER_CONNECTIONS 5;"
mysql -e "GRANT REPLICATION CLIENT ON *.* TO 'newrelic'@'localhost' WITH MAX_USER_CONNECTIONS 5;"
mysql -e "GRANT SELECT ON *.* TO 'newrelic'@'localhost' WITH MAX_USER_CONNECTIONS 5;"
```

```
kubectl create ns mysql
helm install -n mysql mysql oci://registry-1.docker.io/bitnamicharts/mysql
```
