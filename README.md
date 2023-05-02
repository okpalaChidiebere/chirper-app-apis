# chirper-app-apis

This project is about learning how to write CI/CD code in Travis CI to automate generate protos and publishing those protos to the appropriate package directory in our case its just golang. We also learn how [buf CLI](https://docs.buf.build/installation) helps simplifies the headaches of generating protobuf protos.

## How Adding Google types

1. You have scenarios where you may need to use google types in your proto, you will may to first commit and push those types first before you they commit and push your own protos that depends on those google types. The important for the CI/CD build to work fine
1. You run the command like `curl https://raw.githubusercontent.com/googleapis/googleapis/master/google/api/annotations.proto > google/api/annotations.proto` . See other apis [here](https://github.com/googleapis/googleapis/tree/master/google/api)

## bufbuild

- It is important that the version of bufbuild packages works for the go version we have. Make sure you using those packages locally with the go version you have before you write use those versions during your CI/CD. Learn how to upgrade or downgrade your go version [here](https://www.practical-go-lessons.com/chap-40-upgrading-or-downgrading-go)
- Sometimes the bufbuild you are curreently using does not work well with your go version. An easy way to check it to look at the go.mod file of the particular tag or version you want to try. Eg [here](https://github.com/bufbuild/connect-go/blob/v1.5.2/go.mod)
- This is [an example](https://buf.build/bufbuild/connect-go) of a package in bufbuild registry. Apparently you can add your own api to this registry as well if you have an account. See [doc](https://buf.build/docs/tutorials/getting-started-with-bsr#depend-on-googleapis)
- To install bufbuild locally, you can use the image directly from docker or homebrew. See [doc](https://buf.build/docs/installation)

## Shell

You NEED to know how to write bash scripts to be good at writing automations scripts for CI/CD. Here is a good [link](https://effective-shell.com/) to learn shell language from scratch

## About our CI/CD wit Travis

- Some of the times we run a script based on the travis env variables. See all env variables [here](https://docs.travis-ci.com/user/environment-variables/)
- We used a [generic](https://docs.travis-ci.com/user/languages/minimal-and-generic/) travis ci machine

## Useful links

- [https://protobuf.dev/programming-guides/proto2/](https://protobuf.dev/programming-guides/proto2/)
