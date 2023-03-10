# chirper-app-apis

This project is about learning how to write CI/CD code in Travis CI to automate generate protos and publishing those protos to the appropriate package directory in our case its just golang. We also learn how [buf CLI](https://docs.buf.build/installation) helps simplifies the headaches of generating protobuf protos

## How Adding Google types

1. You have scenarios where you may need to use google types in your proto, you will may to first commit and push those types first before you they commit and push your own protos that depends on those google types. The important for the CI/CD build to work fine
1. You run the command like `curl https://raw.githubusercontent.com/googleapis/googleapis/master/google/api/annotations.proto > google/api/annotations.proto` . See other apis [here](https://github.com/googleapis/googleapis/tree/master/google/api)
