# Terraform Module Template
This terraform module automates populating some Tamr config variables that are generated as outputs from other GCP scale-out modules.

# Examples
## Minimal
Smallest complete fully working example. This example might require extra resources to run the example.
- [Minimal](https://github.com/Datatamer/terraform-gcp-tamr-config/tree/master/examples/minimal)

# Resources Created
This modules creates:
* A template_file data source which renders the contents of a populated Tamr config.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| google | >= 4.6.0 |

## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| tamr\_bigtable\_cluster\_id | Bigtable cluster ID | `string` | n/a | yes |
| tamr\_bigtable\_instance\_id | Bigtable instance ID | `string` | n/a | yes |
| tamr\_bigtable\_max\_nodes | Max number of nodes to scale up to | `string` | n/a | yes |
| tamr\_bigtable\_min\_nodes | Min number of nodes to scale down to | `string` | n/a | yes |
| tamr\_cloud\_sql\_location | location for cloud sql instance. NOTE: this is either a region or a zone. | `string` | n/a | yes |
| tamr\_cloud\_sql\_name | name of cloud sql instance | `string` | n/a | yes |
| tamr\_dataproc\_bucket | GCS bucket to use for the tamr dataproc cluster | `string` | n/a | yes |
| tamr\_dataproc\_region | Region the dataproc uses. | `string` | n/a | yes |
| tamr\_filesystem\_bucket | GCS bucket to use for the tamr default file system | `string` | n/a | yes |
| tamr\_instance\_internal\_ip | internal ip of tamr vm | `string` | n/a | yes |
| tamr\_instance\_project | The project to launch the tamr VM instance in. | `string` | n/a | yes |
| tamr\_instance\_service\_account | email of service account to attach to the tamr instance | `string` | n/a | yes |
| tamr\_instance\_subnet | subnetwork to attach instance too | `string` | n/a | yes |
| tamr\_instance\_zone | zone to deploy tamr vm | `string` | n/a | yes |
| tamr\_sql\_password | password for the cloud sql user | `string` | n/a | yes |
| dataproc\_network\_tags | list of network tags to attach to the dataproc nodes | `list(string)` | `[]` | no |
| tamr\_bigtable\_project\_id | The google project that the bigtable instance lives in. If not set will use the tamr\_instance\_project as the default value. | `string` | `""` | no |
| tamr\_cloud\_sql\_project | project containing cloudsql instance. If not set will use the tamr\_instance\_project as the default value. | `string` | `""` | no |
| tamr\_dataproc\_cluster\_config | If you do not want to use the default dataproc configuration template, pass in a complete dataproc configuration file to variable.<br>If you are passing in a dataproc configure it should not be left padded, we will handle that inside of our template. It is expected to<br>a yaml document of a dataproc cluster config<br>Refrence spec is https://cloud.google.com/dataproc/docs/reference/rest/v1/ClusterConfig | `string` | `""` | no |
| tamr\_dataproc\_cluster\_enable\_stackdriver\_logging | Enabled stackdriver logging on dataproc clusters. This only used if using the built in tamr\_dataproc\_cluster\_config configuration | `bool` | `true` | no |
| tamr\_dataproc\_cluster\_master\_disk\_size | Size of disk to use on dataproc master disk This only used if using the built in tamr\_dataproc\_cluster\_config configuration | `number` | `1000` | no |
| tamr\_dataproc\_cluster\_master\_instance\_type | Instance type to use as dataproc master This only used if using the built in tamr\_dataproc\_cluster\_config configuration | `string` | `"n1-highmem-4"` | no |
| tamr\_dataproc\_cluster\_service\_account | Service account to attach to dataproc workers. If not set will use the tamr\_instance\_service\_account as the default value. This only used if using the built in tamr\_dataproc\_cluster\_config configuration | `string` | `""` | no |
| tamr\_dataproc\_cluster\_subnetwork\_uri | Subnetwork URI for dataproc to use. If not set will use the tamr\_instance\_subnet as the default value. This only used if using the built in tamr\_dataproc\_cluster\_config configuration | `string` | `""` | no |
| tamr\_dataproc\_cluster\_version | Version of dataproc to use. This only used if using the built in tamr\_dataproc\_cluster\_config configuration | `string` | `"2.0"` | no |
| tamr\_dataproc\_cluster\_worker\_machine\_type | machine type of default worker pool. This only used if using the built in tamr\_dataproc\_cluster\_config configuration | `string` | `"n1-standard-16"` | no |
| tamr\_dataproc\_cluster\_worker\_num\_instances | Number of default workers to use. This only used if using the built in tamr\_dataproc\_cluster\_config configuration | `number` | `4` | no |
| tamr\_dataproc\_cluster\_worker\_num\_local\_ssds | Number of localssds to attach to each worker node. This only used if using the built in tamr\_dataproc\_cluster\_config configuration | `number` | `2` | no |
| tamr\_dataproc\_cluster\_worker\_preemptible\_machine\_type | machine type of preemptible worker pool. This only used if using the built in tamr\_dataproc\_cluster\_config configuration | `string` | `"n1-standard-16"` | no |
| tamr\_dataproc\_cluster\_worker\_preemptible\_num\_instances | Number of preemptible workers to use. This only used if using the built in tamr\_dataproc\_cluster\_config configuration | `number` | `0` | no |
| tamr\_dataproc\_cluster\_worker\_preemptible\_num\_local\_ssds | Number of localssds to attach to each preemptible worker node. This only used if using the built in tamr\_dataproc\_cluster\_config configuration | `number` | `2` | no |
| tamr\_dataproc\_cluster\_zone | Zone to launch dataproc cluster into. If not set will use the tamr\_instance\_zone as the default value. This only used if using the built in tamr\_dataproc\_cluster\_config configuration | `string` | `""` | no |
| tamr\_dataproc\_image\_version | Dataproc image versionmage | `string` | `"2.0"` | no |
| tamr\_dataproc\_project\_id | Project for the dataproc cluster. If not set will use the tamr\_instance\_project as the default value. | `string` | `""` | no |
| tamr\_es\_apihost | The hostname and port of the REST API endpoint of the Elasticsearch cluster to use. If unset will use < ip of vm>:9200 | `string` | `""` | no |
| tamr\_es\_enabled | Whether Tamr will index user data in Elasticsearch or not.  Elasticsearch is used to power Tamr's interactive data UI, so when this is set to false Tamr will run 'headless,' that is, without its core UI capabilities.  It can be useful to disable Elasticsearch in production settings where the models are trained on a separate instance and the goal is to maximize pipeline throughput. | `bool` | `true` | no |
| tamr\_es\_number\_of\_shards | The number of shards to set when creating the Tamr index in Elasticsearch.  Default value is the number of cores on the local host machine, so this should be overridden when using a remote Elasticsearch cluster.  Note: this value is only applied when the index is created. | `number` | `1` | no |
| tamr\_es\_password | Password to use to authenticate to Elasticsearch, using basic authentication.  Not required unless the Elasticsearch cluster you're using has security and authentication enabled.  The value passed in may be encrypted. | `string` | `null` | no |
| tamr\_es\_socket\_timeout | Defines the socket timeout for Elasticsearch clients, in milliseconds. This is the timeout for waiting for data or, put differently, a maximum period of inactivity between two consecutive data packets. A timeout value of zero is interpreted as an infinite timeout. A negative value is interpreted as undefined (system default).  The default value is 900000, i.e., fifteen minutes. | `number` | `900000` | no |
| tamr\_es\_ssl\_enabled | Whether to connect to Elasticsearch over https or not.  Default is false (http). | `bool` | `false` | no |
| tamr\_es\_user | Username to use to authenticate to Elasticsearch.  Not required unless the Elasticsearch cluster you're using has security and authentication enabled. | `string` | `""` | no |
| tamr\_hbase\_namespace | HBase namespace to user, for bigtable this will be the table prefix. | `string` | `"ns0"` | no |
| tamr\_json\_logging | Toggle json formatting for tamr logs. | `bool` | `false` | no |
| tamr\_license\_key | Set a tamr license key | `string` | `""` | no |
| tamr\_spark\_driver\_memory | Amount of memory spark should allocate to spark driver | `string` | `"12G"` | no |
| tamr\_spark\_executor\_cores | Amount of cores spark should allocate to each spark executor | `number` | `5` | no |
| tamr\_spark\_executor\_instances | number of spark executor instances | `number` | `12` | no |
| tamr\_spark\_executor\_memory | Amount of memory spark should allocate to each spark executor | `string` | `"13G"` | no |
| tamr\_spark\_properties\_override | json blob of spark properties to override, if not set will use a default set of properties that should work for most use cases | `string` | `""` | no |
| tamr\_sql\_user | username for the cloud sql user | `string` | `"tamr"` | no |

## Outputs

| Name | Description |
|------|-------------|
| tamr\_config\_file | full tamr config file |
| tmpl\_dataproc\_config | dataproc config |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# References
This repo is based on:
* [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure)
* [templated terraform module](https://github.com/tmknom/template-terraform-module)

# Development
## Generating Docs
Run `make terraform/docs` to generate the section of docs around terraform inputs, outputs and requirements.

## Checkstyles
Run `make lint`, this will run terraform fmt, in addition to a few other checks to detect whitespace issues.
NOTE: this requires having docker working on the machine running the test

## Releasing new versions
* Update version contained in `VERSION`
* Document changes in `CHANGELOG.md`
* Create a tag in github for the commit associated with the version

# License
Apache 2 Licensed. See LICENSE for full details.
