//
//  AlarmViewModel.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import Foundation

class AlarmViewModel: ObservableObject {
  @Published var alarms: [Alarm] = []
  @Published var sleepEnabled = false
  
  init() {
    // Sample alarms
    alarms = [
      Alarm(time: Calendar.current.date(bySettingHour: 6, minute: 30, second: 0, of: Date())!,
            label: "Work", repeatDays: [.monday, .tuesday, .wednesday, .thursday, .friday]),
      Alarm(time: Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!,
            label: "Weekend", repeatDays: [.saturday, .sunday])
    ]
  }
  
  func addAlarm() {
    let newAlarm = Alarm()
    alarms.append(newAlarm)
  }
  
  func deleteAlarm(at offsets: IndexSet) {
    alarms.remove(atOffsets: offsets)
  }
}
