set shell := ["nu", "-c"]

default := 'bootstrap'

bootstrap :
  nu miri.nu toolchain

build:
  nu miri.nu build

run +params="tests/pass/hello.rs":
  nu miri.nu run {{params}}
