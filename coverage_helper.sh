#!/usr/bin/env bash

package=$1
option=$2
file=test/coverage_helper_test.dart

if [ $option = "--create" ]; then
  # create test directory if it doesn't exist.
  if [ ! -d "test" ]; then
    mkdir test
  fi

  # create coverage_helper_test.dart that imports all lib files
  echo "// Helper file to make coverage work for all dart files\n" > $file
  echo "// ignore_for_file: unused_import" >> $file
  echo "import 'package:flutter_test/flutter_test.dart';" >> $file
  find lib -name '*.dart' | cut -c4- | awk -v package=$package '{printf "import '\''package:%s%s'\'';\n", package, $1}' >> $file
  echo "void main(){ test('empty test', () {}); }" >> $file
elif [ $option = "--clean" ]; then
  # delete empty test directory
  rm $file
  if [ ! "$(ls -A test)" ]; then
    rm -r test
  fi
else
  echo "usage: $0 <package-name> [--create | --clean]"
fi

