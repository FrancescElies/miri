set shell := ["nu", "-c"]

default := 'bootstrap'

bootstrap cargo_extra_flags="":
  nu miri.nu
