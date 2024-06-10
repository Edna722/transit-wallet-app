#!/bin/bash

# Install essential packages
apt-get update && apt-get install -y \
  build-essential \
  curl \
  git \
  unzip \
  xz-utils \
  zip \
  libglu1-mesa \
  lib32stdc++6 \
  lib32z1

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
