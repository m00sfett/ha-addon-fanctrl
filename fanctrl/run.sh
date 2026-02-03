#!/bin/sh
# Generate config (no set -e yet)
echo "Generating config..."
python3 -c '
import json
import sys
try:
    with open("/data/options.json", "r") as f:
        opts = json.load(f)
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
    print(f"Error: {e}", file=sys.stderr)
    sys.exit(1)
' > /tmp/fanctrl.toml

export FANCTRL_CONFIG="/tmp/fanctrl.toml"

export PYTHONUNBUFFERED=1

echo "System Status:"
python3 --version
ls -l /dev/gpio* || echo "Check /dev/gpio* failed"
pip list | grep fan -i || echo "fanctrl not found in pip"
python3 -c "import fanctrl; print('fanctrl module ok')" || echo "fanctrl module import failed"

echo "Starting Application..."
set -e
exec python3 -u -m fanctrl.main
