# ChronoGrid Systems — Website

Statische Homepage für das ChronoGrid-Projekt.
Hosted via GitHub Pages.

## Struktur

```
chronogrid-website/
├── index.html                  # Haupt-Homepage
├── assets/                     # Zukünftige Assets (CSS, Bilder, etc.)
└── .github/workflows/
    └── deploy.yml              # Automatisches Deployment via GitHub Actions
```

## Lokale Vorschau

```bash
# Einfach direkt im Browser öffnen:
open index.html

# Oder mit Python-Webserver (vermeidet CORS-Probleme):
python -m http.server 8080
# → http://localhost:8080
```

## Deployment (GitHub Pages)

1. Repository auf GitHub erstellen: `ChronoGrid-Systems/website` (oder `chronogrid-website`)
2. Code pushen:
   ```bash
   git init
   git add .
   git commit -m "chore: initial website"
   git remote add origin https://github.com/DEIN-ORG/chronogrid-website.git
   git push -u origin main
   ```
3. GitHub → Settings → Pages → Source: **GitHub Actions**
4. Bei jedem Push auf `main` wird die Seite automatisch deployed.

## Benutzerdefinierte Domain (optional)

1. DNS-Eintrag setzen: `CNAME chronogrid.systems → DEIN-ORG.github.io`
2. Datei `CNAME` im Root erstellen:
   ```
   chronogrid.systems
   ```
3. GitHub → Settings → Pages → Custom domain: `chronogrid.systems`

## Aktualisierung

Die Homepage basiert auf dem Briefing `CG-DOC-0000_Briefing_Claude_*.md`.
Bei neuen Versionsständen: Briefing an Claude übergeben → aktualisierte `index.html` generieren → ersetzen → pushen.

## Technische Details

- Reine statische HTML-Datei, kein Build-Step, keine Abhängigkeiten
- Fonts: IBM Plex Sans / IBM Plex Mono / Barlow Condensed (Google Fonts CDN)
- Live-Zeitumrechnung: Web Crypto API (`crypto.subtle.digest`) für SHA-256 MachineID
- Kein Framework, kein npm, kein Build-Tool erforderlich

---

**ChronoGrid Systems** · Kurt, Founder & Lead Architect · Neunkirchen, NÖ, Österreich  
Normierungspfad: ASI/ON → CEN/CENELEC → ISO TC 154
