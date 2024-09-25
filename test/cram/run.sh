#! /bin/bash

# Command to run cram tests
# $TESTDIR is a variable made available by cram that contains the
# path to the directory where the test file lives.
# This means that all files must be in the same directory as this runner.

cd $TESTDIR/../..
$(cabal list-bin hdc) \
  --cache-dir $TESTDIR/cram-data \
  --cache unlimited\
  $@




