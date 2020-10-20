# Example of static S3 website deployed by Terraform with remote state on S3 and state locking in DynamoDB

## Infrastructure

This section is used to create an S3 bucket and DynamoDB table, which will store state for S3 static website deployment.

This can be done manually in AWS administrative account, yet for sake of example, it is done via Terraform in the same account as S3 static site.

State lock configuration is located in subfolder [state](../master/state/state.tf) and once applied will create next resources:

* S3 bucket named `tf-state-lock` with versioning enabled;
* DynamoDB table named `tf-state-lock` and configured according to Terraform [documentation](https://www.terraform.io/docs/backends/types/s3.html#dynamodb-state-locking).

## Static website

Static website configuration is located in subfolder [site-s3](../master/site-s3/staticwebsite.tf) and once applied will create next resources:

* S3 bucket named `site-s3`, set to be publicly available;
* S3 static website is configured for bucket `site-s3`;
* `index.html` is uploaded to the bucket and is set to be pulicly available;
* `css/style.css` is uploaded to the bucket and is set to be pulicly available.

Terraform state is stored remotely in S3 and state locked in DynamoDB created in section [Infrastructure](../master/README.md#infrastructure).

## Environment separation

Each of the the envrionemts have separate branch:

* [Staging](../stage/site-s3/terraform.tfvars);
* [Development](../dev/site-s3/terraform.tfvars);
* [Production](../master/site-s3/terraform.tfvars).

`index.html` differs per environment as well:

* [Staging](../stage/site-s3/assets/index.html);
* [Development](../dev/site-s3/assets/index.html);
* [Production](../master/site-s3/assets/index.html).
