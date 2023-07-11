# Project Pisces: AWS S3 Cross Account / Cross Region Replication


## Description

This sample project demonstrate the S3 bucket cross region and cross account replication. Three S3 buckets are created in two regions in Account-A and one bucket in third region in Account-B. All the three buckets are encrypted with KMS Customer Managed Keys. Once an object is uploaded to the bucket in the primary region, the same is replicated in the other two buckets with storage class as Standard IA (in second region is Account-A) and as Glacier Instant Retrieval (in third region in Account-B). The entire stack is created HashiCorp Terraform.

![Project Pisces - Design Diagram](https://subhamay-projects-repository-us-east-1.s3.amazonaws.com/0007-pisces/pisces-architecture-diagram.png?)

![Project Pisces - Services Used](https://subhamay-projects-repository-us-east-1.s3.amazonaws.com/0007-pisces/pisces-services-used-tf.png?)


### Dependencies

*   You need to have two AWS Accounts to implement this.
*   Create three Customer Managed KMS Keys in the regions where you want to create the stack. First two in Account-A and the third one in Account-B
*   Modify the KMS Key Policy to let the AWS Account (root) encrypt / decrypt using any resource using the created KMS Key. In the destination account KMS Key policy, grant permission to source account to use the key for S3 bucket.
*   Create two profiles named Account-A and Account-B to execute AWS CLI Commands
    ![Project Pisces - CLI profiles](https://subhamay-projects-repository-us-east-1.s3.amazonaws.com/0007-pisces/pisces-cli-profiles.png?)

### Installing

*   Clone the repository https://github.com/subhamay-cloudworks/0007-pisces-tf.
*   First create the trust role to access Account-B from Account-B.
    *   change directory to tf_ac_role,modify the `terraform.tfvars` file with appropriate values and run the following terraform commands in sequence:
    *   ```
        terraform init
        ```
    *   ```
        terraform validate
        ```
    *   ```
        terraform plan
        ```
    *   ```
        terraform apply -auto-approve
        ```
*   Create the stack consisting of three S3 buckets in three regions accross two account.
    *   Change the directory to repository root directory,modify the `terraform.tfvars` file with appropriate values and run the following terraform commands in sequence:
    *   ```
        terraform init
        ```
    *   ```
        terraform validate
        ```
    *   ```
        terraform plan
        ```
    *   ```
        terraform apply -auto-approve
        ```

### Executing program

*   Upload the sample sample file to the S3 bucket in Region-1 in Account-A
*   Within a few seconds (depending on the size) the object will be replicated to all the three regions.
![Project Pisces - S3 Cross Region Replication](https://subhamay-projects-repository-us-east-1.s3.amazonaws.com/0007-pisces/pisces-s3-cross-region-replication.png?)

*   To delete the stack run the command
    ```
    terraform destroy -auto-approve
    ```

## Help

Post message in my blog (https://blog.subhamay.com)


## Authors

Contributors names and contact info

Subhamay Bhattacharyya  - [subhamay.aws@gmail.com](https://blog.subhamay.com)

## Version History

* 0.1
    * Initial Release

## License

This project is licensed under Subhamay Bhattacharyya. All Rights Reserved.

## Acknowledgments

Inspiration, code snippets, etc.
* [Stephane Maarek ](https://www.linkedin.com/in/stephanemaarek/)
* [Neal Davis](https://www.linkedin.com/in/nealkdavis/)
* [Adrian Cantrill](https://www.linkedin.com/in/adriancantrill/)
