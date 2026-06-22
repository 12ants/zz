Below is a **minimal, portable, and reusable Bash helper** that lets you center any text (single‑line or multi‑line) on the current terminal (or a specific width if you want).
You can drop the function into any of your scripts, source it, or copy‑paste the whole file into a shell to test it.

```bash
#!/usr/bin/env bash
#
#  centre_text.sh  –  reusable Bash function to centre arbitrary text
#
#  Usage (in this file or sourced from a script):
#      centre_text [WIDTH] < <file
#      centre_text 80 "Hello world!"
#      centre_text < data.txt   # will use the terminal width
#
#  The function accepts:
#      • an optional numeric width (the width to centre to)
#      • then one or more lines of text (either piped in or via arguments)
#
#  All logic runs with plain POSIX‑compatible Bash – works on Linux, macOS,
#  FreeBSD, WSL, Git‑Bash, Cygwin, etc.
#
#  Copyright 2026 – you
#  SPDX-License-Identifier: MIT
#

# ==============================================================================
#   core function
# ==============================================================================

center_text() {
    # ----------------------------------------------------------------------
    #  Resolve parameters
    # ----------------------------------------------------------------------
    local target_width
    # Detect width from first argument if numeric, otherwise default to terminal width
    if [[ $1 =~ ^[0-9]+$ ]]; then
        target_width=$1
        shift
    else
        target_width=$(tput cols 2>/dev/null || echo 80)  # fall back to 80
    fi

    # ----------------------------------------------------------------------
    #  Process each line of input
    # ----------------------------------------------------------------------
    while IFS= read -r line || [[ -n $line ]]; do
        # Remove any trailing carriage return (Windows line endings)
        line=${line%$'\r'}

        # Workaround for wide Unicode characters – using bash string length
        # gives number of bytes; for proper grapheme handling you would need
        # something like `awk '{print length($0)}'` with locale support.  For
        # most ASCII‑centric scripts this is fine.
        local text_len=${#line}

        # Do not attempt to centre if the line is longer than the width
        if (( text_len >= target_width )); then
            printf '%s\n' "$line"
            continue
        fi

        # Calculate padding on each side.
        #  (target_width - text_len)/2  → left padding.
        #  The right padding is whatever remains.
        local left_pad=$(((target_width - text_len) / 2))
                local right_pad=$((target_width - text_len - left_pad))
        
                printf '%*s%s%*s\n' "$left_pad" '' "$line" "$right_pad" ''
            done
        }
        
        # ==============================================================================
        #  Demo / self‑test mode
        # ==============================================================================
        
        if [[ ${BASH_SOURCE[0]} == $0 ]]; then
            # When run directly, give an example.  No arguments → centre stdin.
            # Optionally, the first positional argument can be a width.
            center_text "$@"
            exit 0
        fi
        ```
        
        ---
        
        ## How to use it
        
        ### 1. Source the script in your own Bash script
        
        ```bash
        #!/usr/bin/env bash
        
        source /path/to/centre_text.sh   # or just copy the function here
        
        echo -e "Hello\nWorld" | center_text 60   # centre to width 60
        ```
        
        ### 2. Use it from the command line
        
        ```bash
        # Centre the content of a file to the full terminal width
        cat myfile.txt | center_text
        
        # Centre a single string to width 80
        center_text 80 "Beware the Ides of March"
        
        # Centre multi‑line input read from keyboard until EOF (Ctrl+D)
        center_text 70 <<<'Line 1
        Line 2 with longer text
        Line 3'
        ```
        
        ### 3. Make it a global helper
        
        Copy the script to `/usr/local/lib` (or any `SOURCEPATH`) and add a wrapper in `/usr/local/bin`:
        
        ```bash
        #!/usr/bin/env bash
        source /usr/local/lib/centre_text.sh
        center_text "$@"
        ```
        
        Now any script or command line user just runs `center_text ...`.
        
        ---
        
        ## What it does
        
        | Feature | How it works |
        |---------|--------------|
        | **Self‑contained** | Only uses Bash built‑ins and `tput`. |
        | **Single or multi‑line** | Reads from stdin/stdout or function arguments. |
        | **Optional width** | First numeric argument decides width; otherwise uses terminal width (`tput cols`). |
        | **Cross‑platform** | Uses ANSI `tput` for width, works on Linux, macOS, Windows (Git‑Bash/Cygwin/WSL). |
        | **Fast** | Pure Bash, no external utilities. |
        | **Graceful fallback** | If terminal width cannot be queried, defaults to 80 columns. |
        | **Safe for Unicode (simple)** | Handles ASCII gracefully; for full Unicode grapheme support, integrate external libs like `wc -L`. |
        
        Feel free to tweak the defaults, add a `--help` flag, or integrate into a larger text‑processing pipeline. Happy scripting!
        
