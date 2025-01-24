//
//  AlarmView.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import SwiftUI

struct AlarmView: View {
  @StateObject private var viewModel = AlarmViewModel()
  
  var body: some View {
    List {
      Section(header: Text("SLEEP | WAKE UP")) {
        Toggle(isOn: $viewModel.sleepEnabled) {
          VStack(alignment: .leading) {
            Text("Sleep | Wake Up")
              .font(.body)
            Text("No Alarm")
              .font(.caption)
              .foregroundColor(.secondary)
          }
        }
      }
      
      Section(header: Text("OTHER")) {
        ForEach(viewModel.alarms) { alarm in
          AlarmRow(alarm: alarm)
        }
        .onDelete(perform: viewModel.deleteAlarm)
      }
    }
    .navigationTitle("Alarm")
    .toolbar {
#if os(iOS)
      EditButton()
#endif
      Button(action: viewModel.addAlarm) {
        Image(systemName: "plus")
      }
    }
  }
}
