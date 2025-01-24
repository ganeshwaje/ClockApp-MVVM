//
//  TimerView.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import SwiftUI

struct TimerView: View {
  @StateObject private var viewModel = TimerViewModel()
  
  var body: some View {
    VStack {
#if os(iOS)
      Picker("Hours", selection: $viewModel.hours) {
        ForEach(0..<24) { hour in
          Text("\(hour)").tag(hour)
        }
      }
      .pickerStyle(WheelPickerStyle())
#else
      HStack {
        Picker("Hours", selection: $viewModel.hours) {
          ForEach(0..<24) { hour in
            Text("\(hour)h").tag(hour)
          }
        }
        
        Picker("Minutes", selection: $viewModel.minutes) {
          ForEach(0..<60) { minute in
            Text("\(minute)m").tag(minute)
          }
        }
        
        Picker("Seconds", selection: $viewModel.seconds) {
          ForEach(0..<60) { second in
            Text("\(second)s").tag(second)
          }
        }
      }
      .labelsHidden()
#endif
      
      Button(action: viewModel.start) {
        Text("Start")
          .font(.title2)
          .foregroundColor(.white)
          .frame(width: 200, height: 50)
          .background(Color.green)
          .cornerRadius(25)
      }
    }
    .navigationTitle("Timer")
  }
}
