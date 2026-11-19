PKG="steamcommunity-302"
PAGE="https://www.dogfight360.com/blog/18682/"

WEB_CONTENT=$(curl -s "$PAGE")

# 从页面内联配置里取当前版本号
VERSION=$(echo "$WEB_CONTENT" \
  | grep -oE 'version:[[:space:]]*"V[0-9.]+"' | head -n1 \
  | grep -oE '[0-9]+\.[0-9.]+')

AMD64_URL=$(echo "$WEB_CONTENT" | grep -o 'https://[^"]*x64\.deb' | head -n 1)
ARM64_URL=$(echo "$WEB_CONTENT" | grep -o 'https://[^"]*arm64\.deb' | head -n 1)

./check_downloader.py "$PKG" "$VERSION" "$AMD64_URL" amd64
./check_downloader.py "$PKG" "$VERSION" "$ARM64_URL" arm64
