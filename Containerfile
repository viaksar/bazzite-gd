FROM ghcr.io/ublue-os/bazzite-deck-gnome:stable

COPY unityhub.repo /etc/yum.repos.d/
COPY vscode.repo /etc/yum.repos.d/
COPY brave-browser.repo /etc/yum.repos.d/

RUN curl -fsSL https://packages.microsoft.com/keys/microsoft.asc -o /etc/pki/rpm-gpg/MICROSOFT-GPG-KEY && \
    curl -fsSL https://brave-browser-rpm-release.s3.brave.com/brave-core.asc -o /etc/pki/rpm-gpg/brave-core.asc

RUN rpm-ostree refresh-md && \
    rpm-ostree install code unityhub gdb brave-browser && \
    ostree container commit

