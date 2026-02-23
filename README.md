# Meadows-Hale Web Application

A web application for viewing land property boundaries on an interactive map with geolocation features.

## Features

- **Admin Portal**: Submit and validate Land ID URLs to extract property boundary data
- **Client View**: Interactive map displaying property polygons with user's current location
- **Custom Domain Support**: Option to use custom subdomains (e.g., julie.land)
- **Geolocation**: Shows user's current position on the map
- **Responsive Design**: Modern, mobile-friendly interface

## Admin authentication

The admin page is protected by username/password. **No plain-text credentials are stored:** only SHA-256 hashes (with a salt) are in the source. The default credentials in the repo are for development only.

**For production:** generate your own hashes and replace the `AUTH` object in `admin.html`:

```bash
# Node (one-liner). Replace YOUR_SALT, YOUR_USER, YOUR_PASS.
node -e "const s='YOUR_SALT',u='YOUR_USER',p='YOUR_PASS';const h=x=>require('crypto').createHash('sha256').update(x).digest('hex');console.log('userHash:',h(s+u),'passHash:',h(s+p));"
```

Use the same salt for both. Update `AUTH.salt`, `AUTH.userHash`, and `AUTH.passHash` in the script.

## Hosting (GitHub Pages)

For shareable links that work on iOS, host the app on GitHub Pages. Repo: **meadows-hale-parcel-locator**. See [GITHUB_PAGES.md](GITHUB_PAGES.md) for step-by-step setup.

## Quick Start

### Admin Portal (`admin.html`)

1. Open `admin.html` in your web browser
2. Enter a Land ID URL (e.g., `https://id.land/maps/db72d71ef72e192c30e66256e0cf6fc5/share`)
3. Optionally add a custom subdomain
4. Click "Validate & Generate Client Link"
5. Click the generated link to view the property on the map

### Client View (`client.html`)

The client page displays:
- Property boundaries as colored polygons
- Your current location (requires location permission)
- Property information panel
- Interactive map controls

## How It Works

1. **Admin submits URL**: The admin portal accepts Land ID URLs from `id.land` or custom subdomains
2. **Data extraction**: The app fetches property data from `api.id.land/maps/{id}/share`
3. **Polygon rendering**: GeoJSON polygon coordinates are extracted and rendered on the map
4. **User location**: Browser geolocation API determines the user's position
5. **Interactive map**: Built with Leaflet.js for smooth map interactions

## Technologies Used

- HTML5, CSS3, JavaScript
- [Leaflet.js](https://leafletjs.com/) - Open-source mapping library
- OpenStreetMap tiles
- Browser Geolocation API

## API Integration

The app integrates with Land ID's public API:
- Endpoint: `https://api.id.land/maps/{mapId}/share`
- Returns GeoJSON data with property boundaries and metadata

## Local Development

Simply open the HTML files in a modern web browser. No build process or server required!

### Git hooks (after clone)

The repo includes a pre-commit hook that bumps the patch version in `VERSION`, `admin.html`, and `client.html` on every commit. **Run once after cloning** so Git uses the repo's hooks:

```bash
./scripts/install-hooks.sh
```

Or manually: `git config core.hooksPath .githooks`

For testing with geolocation features, you may need to run a local server (due to browser security restrictions):

```bash
# Python 3
python -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000
```

Then navigate to `http://localhost:8000/admin.html`

## Browser Support

- Chrome/Edge (recommended)
- Firefox
- Safari
- Requires JavaScript and HTML5 Geolocation support

## Example URL

```
https://id.land/maps/db72d71ef72e192c30e66256e0cf6fc5/share
```

This example shows the "Sugar Shack" property in Vermont.

## License

This project is open source and available for use.

