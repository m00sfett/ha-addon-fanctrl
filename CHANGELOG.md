# Changelog

All notable changes to this repository are documented in this file.

## 0.5.4 - 2026-03-03
- Fixed core fallback config path to `/config/fanctrl.toml`.
- Hardened app security profile (AppArmor enabled, no full access, no `/dev/mem`/`/dev/gpiomem`, no `SYS_RAWIO`).
- Updated add-on docs to current Home Assistant Apps navigation and clarified status endpoint scope.

## 0.5.3 - 2026-03-03
- Updated documentation to match current Home Assistant "Apps" navigation.
- Core package pin in add-on image updated to `fanctrl` `0.5.3`.

## 0.5.2 - 2026-03-03
- Core package pin in add-on image updated to `fanctrl` `0.5.2`.
- `AGENTS.md` removed from repository and excluded via `.gitignore`.

## 0.5.1 - 2026-03-03
- Core package pin in add-on image updated to `fanctrl` `0.5.1`.
- Home Assistant update notes are now provided via `fanctrl/config.yaml` `changelog`.
- Added metadata validation workflow for version/changelog consistency.

## 0.5.0 - 2026-03-03
- Initial `0.5.x` add-on line for `fanctrl` `0.5.0`.
