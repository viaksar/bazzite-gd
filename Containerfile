FROM ghcr.io/ublue-os/bazzite-handheld:latest

COPY unityhub.repo /etc/yum.repos.d/unityhub.repo
COPY vscode.repo /etc/yum.repos.d/vscode.repo
COPY brave-browser.repo /etc/yum.repos.d/brave-browser.repo

RUN curl -fsSL https://packages.microsoft.com/keys/microsoft.asc -o /etc/pki/rpm-gpg/MICROSOFT-GPG-KEY
RUN curl -fsSL https://brave-browser-rpm-release.s3.brave.com/brave-core.asc -o /etc/pki/rpm-gpg/brave-core.asc

RUN rpm-ostree refresh-md &&     rpm-ostree install code unityhub gdb brave-browser clang gnome-screensaver &&     rpm-ostree cleanup -m
