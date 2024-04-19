
def main [] {
    let MIRI_SCRIPT_DIR = ($env.CURRENT_FILE | path dirname | path join miri-script)
    let MIRI_SCRIPT_TARGET_DIR = ($MIRI_SCRIPT_DIR | path join target)
    let MIRI_SCRIPT_CARGO = ($MIRI_SCRIPT_DIR | path join Cargo.toml)

    if ($env.CARGO_EXTRA_FLAGS? | default false) {
        print $"running cargo build with CARGO_EXTRA_FLAGS=($env.CARGO_EXTRA_FLAGS)"
        cargo +stable build $env.CARGO_EXTRA_FLAGS -q --target-dir $MIRI_SCRIPT_TARGET_DIR --manifest-path $MIRI_SCRIPT_CARGO
    } else {
        print "running cargo build"
        cargo +stable build -q --target-dir $MIRI_SCRIPT_TARGET_DIR --manifest-path $MIRI_SCRIPT_CARGO
    }
}


