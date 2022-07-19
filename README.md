## What is the image for?
The intended purpose of this image is for it to be used as a Jenkins agent. By using the installed features the user is able to create Jenkins pipelines that are capable of using the AWS CLI. An example of using this image as a Jenkins agent via [Kubernetes](https://plugins.jenkins.io/kubernetes/) can be seen below. 

First, an example of configuring the pod template in yaml to create the agent.

```yaml
jenkins:
  clouds:
    - kubernetes:
        name: "kubernetes"
        templates:
          - name: "image-builder-aws"
            label: "image-builder-aws"
            nodeUsageMode: NORMAL
            containers:
              - name: "image-aws"
                image: "ghcr.io/liatrio/image-builder-aws:${builder_images_version}"
```
And then specifying the agent in the Jenkinsfile for an example step.

```jenkins
stage('Build') {
  agent {
    label "image-builder-aws"
  }
  steps {
    container('image-aws') {
      sh "aws s3 ls"
    }
  }
}
```

## What is installed on this image?
- Version [1.X.Y](https://pypi.org/project/awscli/) of the AWS CLI.

