# FanCtrl Home Assistant Add-on

**Version:** `1.0.0`

This repository provides one Home Assistant add-on: **FanCtrl**.
It packages the core [`fanctrl`](https://github.com/m00sfett/fanctrl)
service for Home Assistant and exposes the same temperature-driven fan control
logic through a simple add-on configuration.

## What It Does
- Controls a fan based on temperature thresholds (`temp_on_c` / `temp_off_c`)
- Uses `libgpiod` GPIO access
- Exposes the status endpoint on port `9101`
- Supports configurable GPIO chip/line and switching timings

## Tested Platforms
- Home Assistant Add-on tested on Raspberry Pi 4.
- No verified results yet for x86_64 or other architectures.

## Install
1. Open Home Assistant.
2. Go to **Settings -> Apps**.
3. Open the menu in the top-right and choose **Repositories**.
4. Add this repository URL as a custom repository:
   `https://github.com/m00sfett/ha-addon-fanctrl`
5. Install **FanCtrl**.
6. Start the app.

## Configuration
Configure the add-on in Home Assistant under **Configuration**:

| Option | Type | Default | Description |
|---|---|---|---|
| `gpio_chip` | string | `gpiochip0` | GPIO chip device name (maps to `/dev/<gpio_chip>`). |
| `gpio_pin` | int | `33` | GPIO line offset (BCM line), not physical board pin. |
| `active_high` | bool | `true` | `true`: HIGH means ON, `false`: LOW means ON. |
| `temp_on_c` | float | `55.0` | Turn fan ON at/above this temperature. |
| `temp_off_c` | float | `45.0` | Turn fan OFF at/below this temperature. |
| `poll_interval_s` | float | `5.0` | Sensor poll interval in seconds. |
| `min_switch_s` | float | `10.0` | Minimum time between fan state changes. |

## Hardware Requirements
- Host must expose GPIO character devices (`/dev/gpiochip*`).
- Add-on requires access permissions declared in `fanctrl/config.yaml`.
- Typical target: Raspberry Pi with Home Assistant OS.

## Status Endpoint
- Internally, the app exposes `http://127.0.0.1:9101/status` inside the container.
- Services on the same internal network (for example a DockerServer overview service) can query it through container networking.
- Home Assistant does not expose this endpoint externally by default, and normal app usage does not require it.
- If you need external status access (for example behind a custom reverse proxy), you must add explicit network routing yourself.

## Update Notes in Home Assistant
Home Assistant shows release notes from the `changelog` block in
[`fanctrl/config.yaml`](fanctrl/config.yaml).

## Maintenance Rules
Keep versions aligned across:
- `fanctrl/config.yaml` -> `version`
- `fanctrl/Dockerfile` -> `git+...@<version>`
- `CHANGELOG.md` -> section for the same version

## Related Repositories
- Core service: https://github.com/m00sfett/fanctrl
