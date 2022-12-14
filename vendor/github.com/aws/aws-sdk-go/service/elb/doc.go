// Code generated by private/model/cli/gen-api/main.go. DO NOT EDIT.

// Package elb provides the client and types for making API
// requests to Elastic Load Balancing.
//
// A load balancer can distribute incoming traffic across your EC2 instances.
// This enables you to increase the availability of your application. The load
// balancer also monitors the health of its registered instances and ensures
// that it routes traffic only to healthy instances. You configure your load
// balancer to accept incoming traffic by specifying one or more listeners,
// which are configured with a protocol and port number for connections from
// clients to the load balancer and a protocol and port number for connections
// from the load balancer to the instances.
//
// Elastic Load Balancing supports three types of load balancers: Application
// Load Balancers, Network Load Balancers, and Classic Load Balancers. You can
// select a load balancer based on your application needs. For more information,
// see the Elastic Load Balancing User Guide (https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/).
//
// This reference covers the 2012-06-01 API, which supports Classic Load Balancers.
// The 2015-12-01 API supports Application Load Balancers and Network Load Balancers.
//
// To get started, create a load balancer with one or more listeners using CreateLoadBalancer.
// Register your instances with the load balancer using RegisterInstancesWithLoadBalancer.
//
// All Elastic Load Balancing operations are idempotent, which means that they
// complete at most one time. If you repeat an operation, it succeeds with a
// 200 OK response code.
//
// See https://docs.aws.amazon.com/goto/WebAPI/elasticloadbalancing-2012-06-01 for more information on this service.
//
// See elb package documentation for more information.
// https://docs.aws.amazon.com/sdk-for-go/api/service/elb/
//
// # Using the Client
//
// To contact Elastic Load Balancing with the SDK use the New function to create
// a new service client. With that client you can make API requests to the service.
// These clients are safe to use concurrently.
//
// See the SDK's documentation for more information on how to use the SDK.
// https://docs.aws.amazon.com/sdk-for-go/api/
//
// See aws.Config documentation for more information on configuring SDK clients.
// https://docs.aws.amazon.com/sdk-for-go/api/aws/#Config
//
// See the Elastic Load Balancing client ELB for more
// information on creating client for this service.
// https://docs.aws.amazon.com/sdk-for-go/api/service/elb/#New
package elb
