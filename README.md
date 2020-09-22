# Example of static S3 website deployed by Terraform with remote state on S3 and state locking in DynamoDB

## Infrastructure

This section is used to create an S3 bucket and DynamoDB table, which will store state for S3 static website deployment.

This can be done manually in AWS administrative account, yet for sake of example, it is done via Terraform in the same account as S3 static site.

Infrasturcutre configuration is located in subfolder [weissbeerger-s3-infra](../master/weissbeerger-s3-infra/infra.tf) and once applied will create next resources:

* S3 bucket named `weissbeerger-state-lock` with versioning enabled;
* DynamoDB table named `weissbeerger-state-lock` and configured according to Terraform [documentation](https://www.terraform.io/docs/backends/types/s3.html#dynamodb-state-locking).

## Static website

Static website configuration is located in subfolder [weissbeerger-s3](../master/weissbeerger-s3/staticwebsite.tf) and once applied will create next resources:

* S3 bucket named `weissbeerger-s3`, set to be publicly available;
* S3 static website is configured for bucket `weissbeerger-s3`;
* `index.html` is uploaded to the bucket and is set to be pulicly available;
* `css/style.css` is uploaded to the bucket and is set to be pulicly available.

Terraform state is stored remotely in S3 and state locked in DynamoDB created in section [Infrastructure](../master/README.md#infrastructure).

## Envrionment separation

Each of the the envrionemts have separate branch:

* [Staging](../stage/terraform.tfvars);
* [Development](../dev/terraform.tfvars);
* [Production](../master/terraform.tfvars).

`index.html` differs per environment as well:

* [Staging](../stage/assets/index.html);
* [Development](../dev/assets/index.html);
* [Production](../master/assets/index.html).