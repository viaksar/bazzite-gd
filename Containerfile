FROM ghcr.io/ublue-os/bazzite-handheld:latest

# UnityHub
UNITY_WD="/run/user/$(id -u)/unityhub-repo"
UNITY_REPO_PATH="/etc/yum.repos.d/unityhub.repo"
UNITY_URL="https://hub.unity3d.com/linux/repos/rpm/stable"
mkdir -p "$UNITY_WD"
cd "$UNITY_WD"
cat > unityhub.repo <<EOF
[unityhub]
name=Unity Hub Repository
baseurl=$UNITY_URL
enabled=1
gpgcheck=0
repo_gpgcheck=0
EOF
sudo install -Dm644 unityhub.repo "$UNITY_REPO_PATH"
VSCODE_WD="/run/user/$(id -u)/vscode-repo"
VSCODE_REPO_PATH="/etc/yum.repos.d/vscode.repo"
VSCODE_KEY_PATH="/etc/pki/rpm-gpg/MICROSOFT-GPG-KEY"
VSCODE_URL="https://packages.microsoft.com"
mkdir -p "$VSCODE_WD"
cd "$VSCODE_WD"
curl -fsSL -o microsoft.asc "$VSCODE_URL/keys/microsoft.asc"
cat > vscode.repo <<EOF
[code]
name=Visual Studio Code
baseurl=$VSCODE_URL/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=file://$VSCODE_KEY_PATH
EOF
sudo install -Dm644 microsoft.asc "$VSCODE_KEY_PATH"
sudo install -Dm644 vscode.repo "$VSCODE_REPO_PATH"
BRAVE_WD="/run/user/$(id -u)/brave-repo"
BRAVE_REPO_PATH="/etc/yum.repos.d/brave-browser.repo"
BRAVE_KEY_PATH="/etc/pki/rpm-gpg/brave-core.asc"
BRAVE_URL="https://brave-browser-rpm-release.s3.brave.com"
mkdir -p "$BRAVE_WD"
cd "$BRAVE_WD"
curl -fsSL -o brave-core.asc "$BRAVE_URL/brave-core.asc"
cat > brave-browser.repo <<EOF
[brave-browser]
name=Brave Browser
baseurl=$BRAVE_URL/\$basearch/
enabled=1
gpgcheck=1
gpgkey=file://$BRAVE_KEY_PATH
EOF
sudo install -Dm644 brave-core.asc "$BRAVE_KEY_PATH"
sudo install -Dm644 brave-browser.repo "$BRAVE_REPO_PATH"
rpm-ostree refresh-md
sudo rpm-ostree install \
  code \
  unityhub \
  gdb \
  brave-browser
BRAVE_WD="/run/user/$(id -u)/brave-repo"
BRAVE_REPO_PATH="/etc/yum.repos.d/brave-browser.repo"
BRAVE_KEY_PATH="/etc/pki/rpm-gpg/brave-core.asc"
BRAVE_URL="https://brave-browser-rpm-release.s3.brave.com"
mkdir -p "$BRAVE_WD"
cd "$BRAVE_WD"
curl -fsSL -o brave-core.asc "$BRAVE_URL/brave-core.asc"
cat > brave-browser.repo <<EOF
[brave-browser]
name=Brave Browser
baseurl=$BRAVE_URL/\$basearch/
enabled=1
gpgcheck=1
gpgkey=file://$BRAVE_KEY_PATH
EOF
sudo install -Dm644 brave-core.asc "$BRAVE_KEY_PATH"
sudo install -Dm644 brave-browser.repo "$BRAVE_REPO_PATH"
sudo rpm-ostree install \
  code \
  unityhub \
  gdb \
  brave-browser
VSCODE_WD="/run/user/$(id -u)/vscode-repo"
VSCODE_REPO_PATH="/etc/yum.repos.d/vscode.repo"
VSCODE_KEY_PATH="/etc/pki/rpm-gpg/MICROSOFT-GPG-KEY"
VSCODE_URL="https://packages.microsoft.com"
mkdir -p "$VSCODE_WD"
cd "$VSCODE_WD"
curl -fsSL -o microsoft.asc "$VSCODE_URL/keys/microsoft.asc"
cat > vscode.repo <<EOF
[code]
name=Visual Studio Code
baseurl=$VSCODE_URL/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=file://$VSCODE_KEY_PATH
EOF
sudo install -Dm644 microsoft.asc "$VSCODE_KEY_PATH"
sudo install -Dm644 vscode.repo "$VSCODE_REPO_PATH"
sudo rpm-ostree install \
  code \
  unityhub \
  gdb \
  brave-browser
BRAVE_WD="/run/user/$(id -u)/brave-repo"
BRAVE_REPO_PATH="/etc/yum.repos.d/brave-browser.repo"
BRAVE_KEY_PATH="/etc/pki/rpm-gpg/brave-core.asc"
BRAVE_URL="https://brave-browser-rpm-release.s3.brave.com"
mkdir -p "$BRAVE_WD"
cd "$BRAVE_WD"
curl -fsSL -o brave-core.asc "$BRAVE_URL/brave-core.asc"
cat > brave-browser.repo <<EOF
[brave-browser]
name=Brave Browser
baseurl=$BRAVE_URL/\$basearch/
enabled=1
gpgcheck=1
gpgkey=file://$BRAVE_KEY_PATH
EOF
sudo install -Dm644 brave-core.asc "$BRAVE_KEY_PATH"
sudo install -Dm644 brave-browser.repo "$BRAVE_REPO_PATH"
sudo rpm-ostree install \
  code \
  unityhub \
  gdb \
  brave-browser

RUN rpm-ostree install \
    unityhub \
    brave-browser \
    code \
    clang \
    gnome-screensaver \
    && rpm-ostree cleanup -m
