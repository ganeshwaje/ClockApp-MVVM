//
//  AlarmRow.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import SwiftUI

struct AlarmRow: View {
  @ObservedObject var alarm: Alarm
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        Text(alarm.time.formatted(date: .omitted, time: .shortened))
          .font(.title2)
        
        Text(alarm.label)
          .font(.caption)
          .foregroundColor(.secondary)
      }
      
      Spacer()
      
      Toggle("", isOn: $alarm.isEnabled)
        .labelsHidden()
    }
  }
}
