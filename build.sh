#!/bin/bash

# Install essential packages
apt-get update && apt-get install -y \
  build-essential \
  coreutils \
  curl \
  git \
  unzip \
  xz-utils \
  zip \
  libglu1-mesa \
  lib32stdc++6 \
  lib32z1

# Install RVM (Ruby Version Manager) if required
if ! command -v rvm &> /dev/null; then
  curl -sSL https://get.rvm.io | bash -s stable
  source /etc/profile.d/rvm.sh
fi

# Install Flutter SDK
if [ ! -d "$FLUTTER_HOME" ]; then
  git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_HOME
fi

# Enable Flutter and Dart in PATH
export PATH="$FLUTTER_HOME/bin:$FLUTTER_HOME/bin/cache/dart-sdk/bin:$PATH"

# Verify Flutter installation
flutter doctor

# Install dependencies
flutter pub get

# Build the Flutter web app
flutter build web