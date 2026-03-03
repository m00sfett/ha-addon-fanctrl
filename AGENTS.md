# AGENTS.md - ha-addon-fanctrl

## Zweck
Dieses Repository liefert das Home Assistant Add-on fuer `fanctrl`.
Home Assistant erkennt Updates und Release-Notes aus den Add-on-Metadaten, nicht aus dem Core-Repo allein.

## Release-Regeln
Bei jeder Core-Aenderung, die in Home Assistant ankommen soll, immer das Add-on ebenfalls anheben.

1. `fanctrl/config.yaml`
- `version` auf neue Add-on-Version setzen (z. B. `0.5.2`).
- Unter `changelog` einen Eintrag fuer genau diese Version ergaenzen.

2. `fanctrl/Dockerfile`
- Den Pin fuer das Core-Paket auf dieselbe Version setzen:
  `git+https://github.com/m00sfett/fanctrl.git@<version>`

3. `CHANGELOG.md`
- Abschnitt fuer dieselbe Version anlegen und kurz beschreiben, was neu ist.

## Konsistenz (Pflicht)
Vor Commit muessen diese drei Versionen uebereinstimmen:
- `fanctrl/config.yaml` -> `version`
- `fanctrl/Dockerfile` -> `@<version>`
- `CHANGELOG.md` -> Abschnitt `## <version> - <datum>`

Zusatz:
- `fanctrl/config.yaml` muss einen `changelog`-Block mit derselben Version enthalten, damit Home Assistant Release-Notes anzeigen kann.

## Branching
- Release-Branches folgen dem Muster: `release/0.x.x` oder `release/0.x` nach Teamvorgabe.
- Kein automatischer Merge nach `main` ohne explizite Freigabe.
