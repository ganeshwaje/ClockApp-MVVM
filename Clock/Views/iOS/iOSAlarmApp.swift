//
//  iOSAlarmApp.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import SwiftUI

struct iOSAlarmApp: View {
  var body: some View {
    TabView {
      WorldClockView()
        .tabItem {
          Image(systemName: "globe")
          Text("World Clock")
        }
      
      AlarmView()
        .tabItem {
          Image(systemName: "alarm.fill")
          Text("Alarms")
        }
      
      StopwatchView()
        .tabItem {
          Image(systemName: "stopwatch.fill")
          Text("Stopwatch")
        }
      
      TimerView()
        .tabItem {
          Image(systemName: "timer")
          Text("Timers")
        }
    }
    .accentColor(.orange)
  }
}
