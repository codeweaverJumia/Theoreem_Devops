# DevOps Practical Exercise - AWS

## Primary Task:

Create a very simple REST API that when its endpoint is called, it returns one object from S3 that is a JSON file.  For example GET `/api/foo` returns contents of JSON file with something like `{ "greeting": "I am the Foo" }`. But really do whatever you want there as long as it accesses S3 to get the content.  You can create this in any development language with any framework, or you can use a sample app from somewhere online (note your source if you do so).  If you need help with this, let me know.  Keep this simple, its a 10-20 line app at most.

* Use infrastructure as code (i.e. Terraform, Pulumi, or other)
* You may use containers or instances for the application backend, or make a case for other options
* Deploy the backend to VPC / private network
* Create your own S3 bucket for the JSON files
* Make the service autoscale
* Expose the service through a termination on publicly accessible network

