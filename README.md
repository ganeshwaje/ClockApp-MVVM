# SwiftUI Clock App

A native iOS and macOS clock application built with SwiftUI, featuring World Clock, Alarm, Stopwatch, and Timer functionality.

## Features

- 🌍 World Clock: Track time across different time zones
- ⏰ Alarm: Set and manage multiple alarms with repeat options
- ⏱️ Stopwatch: Precise timing with lap support
- ⌛ Timer: Countdown timer with custom duration

## Requirements

- iOS 15.0+
- macOS 12.0+
- Xcode 13.0+
- Swift 5.5+

## Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/ClockApp.git
```

2. Open in Xcode
```bash
cd Clock
open Clock.xcodeproj
```

## Architecture

- MVVM Architecture
- SwiftUI for UI
- Shared codebase between iOS and macOS
- Platform-specific UI components where needed

## Project Structure
```
Clock/
├── App/
│   └── ClockApp.swift
├── Models/
│   ├── Alarm.swift
│   ├── WeekDay.swift
│   └── WorldClock.swift
├── ViewModels/
│   ├── AlarmViewModel.swift
│   ├── StopwatchViewModel.swift
│   └── TimerViewModel.swift
└── Views/
    ├── Shared/
    ├── iOS/
    └── macOS/
```
