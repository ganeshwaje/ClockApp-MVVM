//
//  MacAlarmApp.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import SwiftUI

struct MacAlarmApp: View {
  var body: some View {
    NavigationView {
      List {
        NavigationLink("World Clock", destination: WorldClockView())
        NavigationLink("Alarm", destination: AlarmView())
        NavigationLink("Stopwatch", destination: StopwatchView())
        NavigationLink("Timer", destination: TimerView())
      }
      .listStyle(SidebarListStyle())
      .frame(minWidth: 200, maxWidth: 300)
      
      Text("Select a tool")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  }
}
