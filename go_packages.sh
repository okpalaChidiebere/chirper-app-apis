#!/bin/bash

# we find the generated folder and loop through all the first subdirectries
for f in $(find gen/go -maxdepth 1 -mindepth 1 -type d); do
    # get the folder name
    b=$(basename $f)

    # gen/go
    # d=$(dirname $f)

    (
        cd $f; 
        sudo touch go.mod go.sum; 
        sudo chmod -R 777 go.mod go.sum; 
        echo "module github.com/${USER}/${GEN_REPO_GO}/${b}" > go.mod;
        go mod tidy;
    )
    # uncomment below for local testing what whatever reason
    # (cd $f; go mod init "github.com/okpalaChidiebere/chirper-app-gen-protos/${b}"; go mod tidy; rm -f go.sum)
done

# for f in $(find . -name go.mod); do
#     (cd $(dirname $f); go mod tidy)
# done