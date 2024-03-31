#!/bin/sh

yarn
yarn build:prod
yarn run package

yarn test:setup
yarn test:unit
yarn test:script