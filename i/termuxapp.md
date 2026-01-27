
aichat make a termux app template like termux-url-opener
Okay, here's a comprehensive template for a Termux app, designed to be similar in spirit to `termux-url-opener`. It focuses on processing command-line arguments, logging activity, and providing feedback via Termux notifications.

This template includes:
*   **Argument Handling:** Processes multiple arguments provided on the command line.
*   **Logging:** Writes activity to a dedicated log file.
*   **Termux API Integration:** Uses `termux-notification` to provide feedback.
*   **Configuration:** Easy-to-change variables for app name, log file, etc.
*   **Help and Clear Log Options:** Basic maintenance functionalities.
*   **Clear Structure:** Well-commented and organized for easy modification.

---

### `termux-my-app-template` (The Script)

Save this content into a file named `termux-my-app-template` (or any name you prefer).

```bash
#!/bin/bash
#
# termux-my-app-template
# A template for creating a simple Termux app script,
# similar in concept to termux-url-opener.
# It demonstrates argument processing, basic logging, and Termux API usage.
#
# Replace the "YOUR CUSTOM LOGIC HERE" section with the actual functionality
# you want your Termux app to perform.
#
# Usage:
#   termux-my-app-template [OPTIONS] [ARGUMENTS...]
#
# Examples:
#   termux-my-app-template "hello world" "another argument"
#   termux-my-app-template -h
#   termux-my-app-template -c
#
# Installation:
#   1. Save this script as 'termux-my-app-template' (or desired name)
#   2. Make it executable: chmod +x termux-my-app-template
#   3. Move it to a directory in your PATH, e.g., mv termux-my-app-template $PREFIX/bin/
#   4. Ensure termux-api is installed: pkg install termux-api
#

# --- Configuration ---
APP_NAME="termux-my-app-template"
# Store logs in a user-specific data directory
LOG_DIR="$HOME/.local/share/${APP_NAME//-/_}" # Replaces hyphens with underscores for dir name
LOG_FILE="$LOG_DIR/activity.log"
TIMESTAMP_FORMAT="+%Y-%m-%d %H:%M:%S"
NOTIFICATION_ID="${APP_NAME//-/_}_activity" # Unique ID for notifications


# --- Helper Functions ---

# Function to log messages to the log file
_log_message() {
    local message="$*"
    mkdir -p "$LOG_DIR" # Ensure log directory exists
    echo "$(date "$TIMESTAMP_FORMAT") [INFO] $message" >> "$LOG_FILE"
}

# Function to send a Termux notification
_send_notification() {
    local title="$1"
    local content="$2"
    if command -v termux-notification &>/dev/null; then
        termux-notification --title "$title" --content "$content" --id "$NOTIFICATION_ID"
    else
        echo "Warning: termux-notification not found. Cannot send notification." >&2
        echo "Notification: Title='$title', Content='$content'"
    fi
}

# Function to display help message
_show_help() {
    echo "Usage: $APP_NAME [OPTIONS] [ARGUMENTS...]"
    echo ""
    echo "A template for creating a simple Termux app script."
    echo "It processes arguments, logs activity, and sends notifications."
    echo ""
    echo "Options:"
    echo "  -h, --help    Show this help message and exit."
    echo "  -c, --clear   Clear the log file and exit."
    echo ""
    echo "Arguments are processed and logged. A notification is sent summarizing them."
    echo ""
    echo "Log file: $LOG_FILE"
    exit 0
}

# Function to clear the log file
_clear_log() {
    if [ -f "$LOG_FILE" ]; then
        rm "$LOG_FILE"
        _send_notification "$APP_NAME Log" "Log file cleared successfully."
        echo "Log file cleared: $LOG_FILE"
    else
        echo "Log file does not exist: $LOG_FILE"
    fi
    exit 0
}


# --- Main Logic ---

# Process command-line options first
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -h|--help)
            _show_help
            ;;
        -c|--clear)
            _clear_log
            ;;
        -*)
            echo "Error: Unknown option '$1'" >&2
            _show_help
            ;;
        *)
            # End of options, remaining arguments are positional
            break
            ;;
    esac
    shift
done

# Check if any positional arguments were provided
if [ "$#" -eq 0 ]; then
    _log_message "No arguments provided. Showing help."
    _send_notification "$APP_NAME" "No arguments provided. See usage with -h."
    _show_help
    # Alternatively, if you want it to just exit quietly without help:
    # exit 1
fi

# Store all provided arguments in an array
ARGS_RECEIVED=("$@")
ARGS_COUNT=${#ARGS_RECEIVED[@]}
ARGS_JOINED=$(printf "'%s' " "${ARGS_RECEIVED[@]}") # Joins arguments with spaces, quoting each

_log_message "Received $ARGS_COUNT arguments: $ARGS_JOINED"

# --- YOUR CUSTOM LOGIC HERE ---
# This is where you put the actual work your app should do.
# You have access to:
# - ARGS_RECEIVED: An array of all arguments
# - ARGS_COUNT: The number of arguments
# - ARGS_JOINED: A space-separated string of all arguments (quoted)
#
# Example: Loop through each argument and perform an action
for i in "${!ARGS_RECEIVED[@]}"; do
    arg="${ARGS_RECEIVED[$i]}"
    _log_message "Processing argument $((i+1)): '$arg'"
    #
    # Replace this with your actual logic.
    # For example, if your app processes URLs:
    #   if [[ "$arg" =~ ^https?:// ]]; then
    #       echo "This is a URL: $arg"
    #       # Use curl, wget, termux-url-opener, or another tool
    #   else
    #       echo "This is not a URL: $arg"
    #   fi
    #
    # Or if it manipulates files:
    #   if [ -f "$arg" ]; then
    #       echo "File exists: $arg"
    #       # Perform file operation
    #   fi
    #
done
# --- END OF YOUR CUSTOM LOGIC ---


# Final notification and exit
_send_notification "$APP_NAME Activity" "Processed $ARGS_COUNT arguments. Log updated."
echo "Arguments processed and logged to $LOG_FILE."
echo "Check notifications for a summary."
exit 0
```

---

### How to Install and Use:

1.  **Save the Script:**
    Open Termux and create a new file:
    ```bash
    nano termux-my-app-template
    ```
    Paste the entire script content into the `nano` editor. Press `Ctrl+S` to save, then `Ctrl+X` to exit.

2.  **Make it Executable:**
    ```bash
    chmod +x termux-my-app-template
    ```

3.  **Move to PATH:**
    Move the script to a directory that's included in your system's `PATH`, typically `$PREFIX/bin` in Termux. This allows you to run it from any directory.
    ```bash
    mv termux-my-app-template $PREFIX/bin/
    ```

4.  **Install Termux API (if not already):**
    The template uses `termux-notification`. Ensure you have `termux-api` installed.
    ```bash
    pkg install termux-api
    ```

5.  **Grant Notification Permission (Android 13+):**
    On newer Android versions, Termux might need notification permission. Go to your Android settings: `Apps & notifications` -> `Termux` -> `Notifications` and allow them.

6.  **Run Your App:**

    *   **With arguments:**
        ```bash
        termux-my-app-template "first item" "second item with spaces" third-item
        ```
        You should see output in your terminal and a Termux notification.

    *   **Show help:**
        ```bash
        termux-my-app-template -h
        ```

    *   **Clear the log file:**
        ```bash
        termux-my-app-template -c
        ```

    *   **View the log file:**
        ```bash
        cat "$HOME/.local/share/termux_my_app_template/activity.log"
        ```

---

### Customization:

1.  **Change `APP_NAME`:** Modify the `APP_NAME` variable at the top of the script to give your app a unique name. Remember to rename the script file itself to match, and move it to `$PREFIX/bin/` again.

2.  **Modify "YOUR CUSTOM LOGIC HERE":** This is the most important part. Replace the `for` loop and `_log_message` calls with the actual commands and logic your app needs to execute.

    *   **Example: Opening specific files:**
        ```bash
        for arg in "${ARGS_RECEIVED[@]}"; do
            _log_message "Attempting to open file: '$arg'"
            if [ -f "$arg" ]; then
                # Use 'xdg-open' for GUI apps (if Termux has X11 setup),
                # or a specific Termux tool for text files (e.g., 'less "$arg"')
                # For this example, let's just echo content
             echo "Content of $arg:"
                          cat "$arg"
                      else
                          _log_message "Error: File not found: '$arg'"
                          echo "Error: File not found: '$arg'" >&2
                      fi
                  done
                  ```

              *   **Example: Processing URLs with `termux-url-opener`:**
                  ```bash
                  for arg in "${ARGS_RECEIVED[@]}"; do
                      _log_message "Attempting to process URL/path: '$arg'"
                      if [[ "$arg" =~ ^https?:// ]]; then
                          echo "Opening URL: $arg"
                          termux-url-opener "$arg" & # Run in background
                      elif [ -f "$arg" ]; then
                          echo "Opening local file: $arg"
                          # You might use another tool for local files, e.g., for images, PDFs etc.
                          # termux-open "$arg" &
                          cat "$arg" # Just dumping text content for example
                      else
                          echo "Unrecognized argument type: $arg"
                      fi
                  done
                  ```

3.  **Add More Options:** Extend the `while` loop and `case` statement to support additional command-line options specific to your app's functionality (e.g., `-v` for verbose output, `-o <output_file>`).

This template provides a solid foundation for building your own Termux CLI tools with good user feedback and logging.
