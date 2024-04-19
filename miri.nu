export def echo_purple [...message: string] {
    print $"(ansi purple_bold)($message | str join ' ')(ansi reset)"
}

def main [miri_script_param: string = "toolchain"] {
    let MIRI_SCRIPT_DIR = ($env.CURRENT_FILE | path dirname | path join miri-script)
    let MIRI_SCRIPT_TARGET_DIR = ($MIRI_SCRIPT_DIR | path join target)
    let MIRI_SCRIPT_CARGO = ($MIRI_SCRIPT_DIR | path join Cargo.toml)

    if ($env.CARGO_EXTRA_FLAGS? | default false) {
        echo_purple $"running cargo build with CARGO_EXTRA_FLAGS=($env.CARGO_EXTRA_FLAGS)"
        cargo +stable build $env.CARGO_EXTRA_FLAGS -q --target-dir $MIRI_SCRIPT_TARGET_DIR --manifest-path $MIRI_SCRIPT_CARGO
    } else {
        echo_purple "running cargo build"
        cargo +stable build -q --target-dir $MIRI_SCRIPT_TARGET_DIR --manifest-path $MIRI_SCRIPT_CARGO
    }

    echo_purple "running miri-script $miri_script_param"
    ^($MIRI_SCRIPT_TARGET_DIR | path join "debug/miri-script" | path parse | path join) $miri_script_param
}


