#!/bin/bash

# Custom Advanced SMS Library - Build and Publish Script
# This script helps prepare the library for publication

echo "🚀 Custom Advanced SMS Library Setup"
echo "====================================="

echo "📦 Running Flutter pub get..."
flutter pub get

echo "🔍 Running Flutter analyze..."
flutter analyze --no-fatal-infos

echo "🧪 Running tests..."
flutter test

echo "📱 Testing example app compilation..."
cd example
flutter pub get
flutter analyze --no-fatal-infos

echo "✅ Library is ready for publication!"
echo ""
echo "📋 Next steps:"
echo "1. Review the package at pub.dev dry-run: flutter pub publish --dry-run"
echo "2. Publish to pub.dev: flutter pub publish"
echo "3. Update your projects to use: custom_advanced_sms: ^1.2.0"
echo ""
echo "🔗 Remember to update import statements:"
echo "   From: import 'package:sms_advanced/sms_advanced.dart';"
echo "   To:   import 'package:custom_advanced_sms/custom_advanced_sms.dart';"
