# Changelog

All notable changes to this repository are documented in this file.

## 1.0.0 - 2026-03-03
- Initial stable release of the Home Assistant FanCtrl app.
- Wraps `fanctrl` core (`1.0.0`) for Home Assistant with app-level configuration.
- Provides configurable GPIO chip/line, thresholds, poll interval, and minimum switch delay.
- Exposes a local status endpoint (`9101`) for same-network container integrations.
