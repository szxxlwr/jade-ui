#! /bin/sh
mkdir temp_web
npm run deploy:build
cd temp_web
git clone -b gh-pages https://github.com/zzzgit/jade-ui.git && cd element

# build sub folder
SUB_FOLDER='2.0'
mkdir $SUB_FOLDER
rm -rf *.js *.css *.map static
rm -rf $SUB_FOLDER/**
cp -rf ../../examples/jade-ui/** .
cp -rf ../../examples/jade-ui/** $SUB_FOLDER/
cd ../..

# deploy domestic site
faas deploy alpha
    rm -rf temp_web