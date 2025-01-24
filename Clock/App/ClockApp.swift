//
//  ClockApp.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import SwiftUI

@main
struct ClockApp: App {
  var body: some Scene {
#if os(iOS)
    WindowGroup {
      iOSAlarmApp()
    }
#else
    WindowGroup {
      MacAlarmApp()
    }
#endif
  }
}
