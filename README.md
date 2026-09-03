# ColdWhite 0.5.0

Phase 1 validation build for iOS rootless jailbreaks.

This build intentionally removes the previous macOS Quartz Display Services calls. It validates:
- rootless Theos packaging
- SpringBoard tweak injection filter
- PreferenceLoader registration
- a real PreferenceBundle with Info.plist + Root.plist
- slider/reset persistence and Darwin notification

The display color-temperature backend is NOT enabled in this validation build. It must be implemented with an iOS-specific display API after the Settings entry is confirmed working.
