# Home Assistant Add-on: FanCtrl

A Home Assistant Add-on to control fans connected via GPIO, using `libgpiod`. This add-on wraps the core `fanctrl` Python package.

## Installation

1.  Navigate to your Home Assistant Add-on Store.
2.  (If using a custom repository) Add the URL of this repository.
3.  Click **Install** on the FanCtrl add-on.

## Configuration

The add-on is configured via the **Configuration** tab in Home Assistant.

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `gpio_chip` | string | `gpiochip0` | The GPIO device path name (e.g. `gpiochip0` for /dev/gpiochip0). |
| `gpio_pin` | int | `33` | The GPIO line offset (BCM Number). **Not physical pin number!** |
| `active_high` | bool | `true` | `true` = High signal turns fan ON. `false` = Low signal turns fan ON. |
| `temp_on_c` | float | `55.0` | Temperature (Celsius) to turn the fan **ON**. |
| `temp_off_c` | float | `45.0` | Temperature (Celsius) to turn the fan **OFF**. |
| `poll_interval_s` | float | `5.0` | How often to read the temperature sensor (seconds). |
| `min_switch_s` | float | `10.0` | Minimum time to stay in a state before switching again (prevents rapid toggling). |

## Hardware Access
This add-on requires access to the GPIO hardware.
- It uses `libgpiod`.
- In Home Assistant OS on Raspberry Pi, this is typically handled automatically by the add-on permission request (`gpio`).

## Status Endpoint
The core service exposes a status endpoint (default port `9101`):
`GET http://<homeassistant-host>:9101/status`

## Troubleshooting
Check the Add-on **Logs** tab.
- **`gpiod import failed`**: Means the underlying system library is missing or incompatible.
- **`GPIO chip not found`**: Ensure the container has access to `/dev/gpiochipX`.

## Note
This add-on depends on the [fanctrl core package](https://github.com/m00sfett/fanctrl).
