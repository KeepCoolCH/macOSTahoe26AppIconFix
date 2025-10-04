#!/bin/zsh
# macOS Tahoe 26 App Icon Fix by Kevin Tobler - www.kevintobler.ch
# Refresh existing App icons via fileicon in macOS Tahoe 26

# start Terminal
# if you haven't installed homebrew run: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# to install fileicon run: brew install fileicon
# run script with: sudo zsh macOS_Tahoe_AppIconFix.sh
# type in your sudo password

set -e

echo "🚀 Starting macOS Tahoe 26 App Icon Fix ..."

if [[ -x "/opt/homebrew/bin/fileicon" ]]; then
  FILEICON="/opt/homebrew/bin/fileicon"
elif [[ -x "/usr/local/bin/fileicon" ]]; then
  FILEICON="/usr/local/bin/fileicon"
else
  echo "❌ fileicon not found. Please run: brew install fileicon"
  exit 1
fi

APP_DIRS=(
  "/Applications"
)

echo "🎨 Refreshing App icons ..."

for DIR in "${APP_DIRS[@]}"; do
  [[ -d "$DIR" ]] || continue

  find "$DIR" -maxdepth 1 -type d -name "*.app" | while read -r APP; do
    echo "🔧 $(basename "$APP")"

    if $FILEICON test "$APP" >/dev/null 2>&1; then
      TMPICON="/tmp/icon_${RANDOM}.icns"
      $FILEICON get "$APP" "$TMPICON" >/dev/null 2>&1
      if [[ -f "$TMPICON" ]]; then
        $FILEICON set "$APP" "$TMPICON" >/dev/null 2>&1 \
          && echo "♻️ refreshed existing icon" \
          || echo "⚠️ failed to refresh icon"
        rm -f "$TMPICON"
      else
        echo "⚠️ could not extract icon"
      fi
    else
      # if no custom icon exists → use standard icon
      ICONSRC=$(find "$APP/Contents/Resources" -maxdepth 1 -type f -name "*.icns" | head -n 1)
      if [[ -n "$ICONSRC" ]]; then
        $FILEICON set "$APP" "$ICONSRC" >/dev/null 2>&1 \
          && echo "✨ re-applied default icon" \
          || echo "⚠️ skipped"
      else
        echo "⚠️ no icon found"
      fi
    fi
  done
done

echo "🔄 Reloading Finder..."
killall Finder >/dev/null 2>&1 || true
echo "✅ Done!"
echo "Thanks for using! macOS Tahoe 26 App Icon Fix by Kevin Tobler www.kevintobler.ch - Because a refreshed Mac deserves refreshed icons."