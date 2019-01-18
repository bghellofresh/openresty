# OpenResty Docker Image

## Purpose

[Openresty](https://openresty.org/en/) is a web platform that incorporates nginx and LuaJIT to offer an extensible foundation for creating web applications, services, and gateways. This repository produces a docker image for use in application services in place of the standard nginx image and offers metrics in prometheus format for better observability of our internal network traffic.

## Usage

- Instead of using `nginx:stable` in your kube deployment, use this openresty image with tag `bionic`.
- Include your nginx site configuration as a parameter `siteConf` to the container
- Metrics will be available on port `9145` and will be consumed by prometheus

## Example

The repository `hellofresh/metrics` offers examples that uses this repository to expose metrics on internal network traffic
