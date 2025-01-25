//
//  StopwatchView.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import SwiftUI

struct StopwatchView: View {
  @StateObject private var viewModel = StopwatchViewModel()
  @State private var selectedTab = 0
  
  var body: some View {
    GeometryReader { geometry in
      VStack(spacing: 0) {
        TabView(selection: $selectedTab) {
          DigitalStopwatchView(viewModel: viewModel)
            .tag(0)
          
          AnalogStopwatchView(viewModel: viewModel)
            .tag(1)
        }
        .tabViewStyle(.page)
        .frame(height: geometry.size.height / 2)
        
        controlButtons()
          .padding(.horizontal, 16)
        
        if !viewModel.laps.isEmpty {
          List {
            ForEach(viewModel.laps.indices, id: \.self) { index in
              LapRow(index: index, lap: viewModel.laps[index])
            }
          }
          .listStyle(.plain)
        }
      }
      .navigationTitle("Stopwatch")
    }
  }
  
  private func controlButtons() -> some View {
    HStack(spacing: 0) {
      Button(action: viewModel.lap) {
        CircleButton(title: viewModel.isRunning ? "Lap" : "Reset",
                     color: .gray)
      }
      .disabled(!viewModel.isRunning && viewModel.laps.isEmpty)
      
      Spacer()
      
      Button(action: viewModel.toggleTimer) {
        CircleButton(title: viewModel.isRunning ? "Stop" : "Start",
                     color: viewModel.isRunning ? .red : .green,
                     tintColor: viewModel.isRunning ? .red : .gray)
      }
    }
  }
}


#Preview {
  StopwatchView()
}
