# chirper-app-apis

This project is about learning how to write CI/CD code in Travis CI to automate generate protos and publishing those protos to the appropriate package directory in our case its just golang. We also learn how [buf CLI](https://docs.buf.build/installation) helps simplifies the headaches of generating protobuf protos.

## How to Build and Deploy

After you update or create new API definition protos on a **branch** locally and push that branch up, the `.proto` files are recompiled and placed in the [chirper-app-gen-protos](https://github.com/okpalaChidiebere/chirper-app-gen-protos) in a branch with thesame name. For the CI build to pass, it must pass the bufbuild lint [rules](https://docs.buf.build/lint/rules). You can lint your code locally if you want :)

The Individual that need those updated or newly created API definitions at `chirper-app-apis` can then run `go get https://github.com/okpalaChidiebere/chirper-app-gen-protos@{version}`. The `version` can be:

- The branch name from `okpalaChidiebere/chirper-app-apis` which is sync with `okpalaChidiebere/chirper-app-gen-protos` after the Travis CI build completes
- A commit ID from the branch in `okpalaChidiebere/chirper-app-gen-protos`
- \*\*\* I did not implement a tagging repos. Bit if i did thesame tags in `okpalaChidiebere/chirper-app-apis` will also exist in `okpalaChidiebere/chirper-app-gen-protos`

You may want to run `go mod tidy` after. See go commands [here](https://faun.pub/understanding-go-mod-and-go-sum-5fd7ec9bcc34)

When the **branch** is finally merged to master in `chirper-app-apis`, the corresponding branch is merged to master in `chirper-app-gen-protos`. At this point though you are likely ready to share your code for code review and merge your code to master on any of the backend service you are working on

## How Adding Google types

1. You have scenarios where you may need to use google types in your proto, you will may to first commit and push those types first before you they commit and push your own protos that depends on those google types. The important for the CI/CD build to work fine
1. You run the command like `curl https://raw.githubusercontent.com/googleapis/googleapis/master/google/api/annotations.proto > google/api/annotations.proto` . See other apis [here](https://github.com/googleapis/googleapis/tree/master/google/api)

## bufbuild

- To install bufbuild locally, you can use the image directly from docker or homebrew. See [doc](https://buf.build/docs/installation)
- It is important that the version of bufbuild packages works for the go version we have. Make sure you using those packages locally with the go version you have before you write use those versions during your CI/CD. Learn how to upgrade or downgrade your go version [here](https://www.practical-go-lessons.com/chap-40-upgrading-or-downgrading-go)
- Sometimes the bufbuild you are currently using does not work well with your go version. An easy way to check it to look at the go.mod file of the particular tag or version you want to try. Eg [here](https://github.com/bufbuild/connect-go/blob/v1.5.2/go.mod)
- This is [an example](https://buf.build/bufbuild/connect-go) of a package in bufbuild registry. Apparently you can add your own api to this registry as well if you have an account. See [doc](https://buf.build/docs/tutorials/getting-started-with-bsr#depend-on-googleapis)

## Shell

You NEED to know how to write bash scripts to be good at writing automation scripts for CI/CD. Here is a good [link](https://effective-shell.com/) to learn shell language from scratch

## About our CI/CD wit Travis

- Some of the times we run a script based on the travis env variables. See all env variables [here](https://docs.travis-ci.com/user/environment-variables/)
- We used a [generic](https://docs.travis-ci.com/user/languages/minimal-and-generic/) travis ci machine

## Useful links

- [https://protobuf.dev/programming-guides/proto2/](https://protobuf.dev/programming-guides/proto2/)
