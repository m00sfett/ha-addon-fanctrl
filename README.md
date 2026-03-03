# FanCtrl Home Assistant Add-on

**Version:** `0.5.2`

This repository provides one Home Assistant add-on: **FanCtrl**.

## Install
1. Open Home Assistant.
2. Go to **Settings -> Add-ons -> Add-on Store**.
3. Add this repository URL as a custom add-on repository:
   `https://github.com/m00sfett/ha-addon-fanctrl`
4. Install **FanCtrl**.

## Update Notes in Home Assistant
Home Assistant shows release notes from the `changelog` block in
[`fanctrl/config.yaml`](fanctrl/config.yaml).

## Maintenance Rules
Keep versions aligned across:
- `fanctrl/config.yaml` -> `version`
- `fanctrl/Dockerfile` -> `git+...@<version>`
- `CHANGELOG.md` -> section for the same version
