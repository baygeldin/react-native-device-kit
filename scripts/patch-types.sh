#!/bin/sh

# https://github.com/DefinitelyTyped/DefinitelyTyped/issues/15960
sed -i -e "s/\(^declare var require: NodeRequire;\)/\/\/\1/g" node_modules/\@types/node/index.d.ts
sed -i -e "s/\(^declare var console: Console;\)/\/\/\1/g" node_modules/\@types/node/index.d.ts