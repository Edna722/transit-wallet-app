#!/bin/bash

# Ensure we have sudo privileges
if ! command -v sudo &> /dev/null; then
  echo 'Error: sudo command not found. Exiting.'
  exit 1
fi

# Install Flutter SDK if not already installed
if [ ! -d "$FLUTTER_HOME" ]; then
  sudo git clone https://github.com/flutter/flutter.git -b stable $FLUTTER_HOME
fi

# Enable Flutter and Dart in PATH
export PATH="$FLUTTER_HOME/bin:$FLUTTER_HOME/bin/cache/dart-sdk/bin:$PATH"

# Verify Flutter installation
flutter --version

# Navigate to the Flutter project directory
cd C:\flutterapp\transit-wallet-app

# Install dependencies
flutter pub get

# Build the Flutter web app
flutter build web
