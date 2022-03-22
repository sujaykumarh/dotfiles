#!/bin/sh

# cd ${USER_HOME}/demos && \
#     cd git && git init && cd .. && \
#     cd nodejs-tag && git tag v1.0.0 && cd .. && \
#     cd git-tag; \
#     touch v1.txt; git add -A; git commit -am "v1"; git tag v1.0.0; \
#     touch v2.txt; git add -A; git commit -am "v2"; git tag v1.0.0;

CURRENT_DIR=`pwd`
DEMO_DIR=${HOME}/demo

cd $DEMO_DIR

# SETUP GIT Example
mkdir git
cd git
git init
touch test.txt
git add -A; git commit -am "Initial commit";
cd $DEMO_DIR


# SETUP GIT new Example
mkdir git-new
cd git-new
git init
touch test.txt
cd $DEMO_DIR


# SETUP GIT TAG Example
mkdir git-tag
cd git-tag
git init
touch v1.txt; git add -A; git commit -am "v1"; git tag v1.0.0;
touch v2.txt; git add -A; git commit -am "v2"; git tag v2.0.0;
cd $DEMO_DIR


# SETUP Node Example
mkdir node-tag
cd node-tag
git init
cp $DEMO_DIR/sample.package.json package.json
touch v1.txt; git add -A; git commit -am "v1";
cd $DEMO_DIR




# SETUP Node + GIT TAG Example
mkdir node-git-tag
cd node-git-tag
git init
cp $DEMO_DIR/sample.package.json package.json
touch v1.txt; git add -A; git commit -am "v1"; git tag v1.0.0;
cd $DEMO_DIR


