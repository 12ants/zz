center_text() { local target_width
# Detect width from first argument if numeric, otherwise default to terminal width
if [[ $1 =~ ^[0-9]+$ ]]; then target_width=$1; shift; 
else target_width=$(tput cols 2>/dev/null || echo 80); fi
# Process each line of input
while IFS= read -r line || [[ -n $line ]]; do
# Remove any trailing carriage return (Windows line endings)
line=${line%$'\r'}
# Workaround for wide Unicode characters – using bash string length
# gives number of bytes; for proper grapheme handling you would need
# something like `awk '{print length($0)}'` with locale support.  For
# most ASCII‑centric scripts this is fine.
local text_len=${#line}
# Do not attempt to centre if the line is longer than the width
if (( text_len >= target_width )); then printf '%s\n' "$line"; continue; fi; 
# Calculate padding on each side.
# (target_width - text_len)/2  → left padding.
# The right padding is whatever remains.
local left_pad=$(((target_width - text_len) / 2))
local right_pad=$((target_width - text_len - left_pad))        
printf '%*s%s%*s\n' "$left_pad" '' "$line" "$right_pad" ''
done; 
}; 
