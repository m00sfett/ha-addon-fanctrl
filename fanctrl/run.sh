#!/usr/bin/env bash
set -e

CONFIG_PATH="/data/options.json"

# In a real HA Add-on, options are at /data/options.json.
# We need to map these to what fanctrl expects.
# Our refactored fanctrl uses one TOML config file OR env vars? 
# The refactored main.py loads from FANCTRL_CONFIG or /config/config.toml.
# HA options.json is flat JSON. We can create a toml from it or pass env vars.

# Let's generate a toml config from the json options
echo "Generating config from options.json..."
python3 -c '
import json
import tomllib
import sys

# Minimal converter
try:
    with open("/data/options.json", "r") as f:
        opts = json.load(f)
    
    # Map flat options to [fan] section
    # Note: validation happens in fanctrl
    
    print("[fan]")
    for k, v in opts.items():
        if isinstance(v, bool):
            val = "true" if v else "false"
        elif isinstance(v, (int, float)):
            val = str(v)
        else:
            val = f"\"{v}\""
        print(f"{k} = {val}")

except Exception as e:
    print(f"Error converting options: {e}", file=sys.stderr)
    sys.exit(1)
' > /tmp/fanctrl_generated.toml

export FANCTRL_CONFIG="/tmp/fanctrl_generated.toml"

echo "System Check..."
python3 --version
which fanctrl || echo "fanctrl not found in PATH"
ls -l /usr/bin/fanctrl || ls -l /usr/local/bin/fanctrl || echo "fanctrl not found in common bins"

echo "Starting FanCtrl..."
exec fanctrl
