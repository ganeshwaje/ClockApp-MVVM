//
//  StopwatchView.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import SwiftUI

struct StopwatchView: View {
  @StateObject private var viewModel = StopwatchViewModel()
  
  var body: some View {
    VStack {
      Text(viewModel.formattedTime)
        .font(.system(size: 90, weight: .thin, design: .monospaced))
        .padding()
      
      HStack(spacing: 20) {
        Button(action: viewModel.lap) {
          CircleButton(title: viewModel.isRunning ? "Lap" : "Reset",
                       color: .gray)
        }
        .disabled(!viewModel.isRunning && viewModel.laps.isEmpty)
        
        Button(action: viewModel.toggleTimer) {
          CircleButton(title: viewModel.isRunning ? "Stop" : "Start",
                       color: viewModel.isRunning ? .red : .green)
        }
      }
      
      if !viewModel.laps.isEmpty {
        List {
          ForEach(viewModel.laps.indices, id: \.self) { index in
            LapRow(index: index, lap: viewModel.laps[index])
          }
        }
      }
    }
    .navigationTitle("Stopwatch")
  }
}
