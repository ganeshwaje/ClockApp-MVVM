//
//  TimerView.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import SwiftUI
import AVFoundation

struct TimerView: View {
  @StateObject private var viewModel = TimerViewModel()
  @State private var remainingTime: TimeInterval = 0
  @State private var timer: Timer?
  @State private var selectedSound = "Bell"
  
  let sounds = ["Bell", "Chime", "Marimba", "Xylophone"]
  let player = AVPlayer()
  
  var body: some View {
    VStack(spacing: 20) {
      // Time Picker
      HStack {
        Picker("Hours", selection: $viewModel.hours) {
          ForEach(0..<24) { hour in
            Text("\(hour)")
          }
        }
        .pickerStyle(WheelPickerStyle())
                
        Picker("Minutes", selection: $viewModel.minutes) {
          ForEach(0..<60) { minute in
            Text("\(minute)")
          }
        }
        .pickerStyle(WheelPickerStyle())
                
        Picker("Seconds", selection: $viewModel.seconds) {
          ForEach(0..<60) { second in
            Text("\(second)")
          }
        }
        .pickerStyle(WheelPickerStyle())
      }
      .disabled(viewModel.isRunning)
      
      // Control Buttons
      controlButtons()
      
      // Remaining Time Label
      Text(timeString(from: remainingTime))
        .font(.largeTitle)
        .monospacedDigit()
      
      // Sound Selection
      Picker("Sound", selection: $selectedSound) {
        ForEach(sounds, id: \.self) { sound in
          Text(sound).tag(sound)
        }
      }
      .pickerStyle(MenuPickerStyle())
      Spacer()
    }
    .padding()
  }
  
  private func controlButtons() -> some View {
    HStack(spacing: 0) {
      Button(action: stopTimer) {
        CircleButton(title: "Cancel",
                     color: .gray)
      }
      .disabled(!viewModel.isRunning)
      
      Spacer()
      
      Button(action: startTimer) {
        CircleButton(title: viewModel.isRunning ? "Stop" : "Start",
                     color: viewModel.isRunning ? .red : .green,
                     tintColor: viewModel.isRunning ? .red : .gray)
      }
    }
  }
  
  private func startTimer() {
    let totalSeconds = TimeInterval(viewModel.hours * 3600 + viewModel.minutes * 60 + viewModel.seconds)
    remainingTime = totalSeconds
    viewModel.isRunning = true
    
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
      if remainingTime > 0 {
        remainingTime -= 1
      } else {
        playSound()
        stopTimer()
      }
    }
  }
  
  private func stopTimer() {
    timer?.invalidate()
    timer = nil
    viewModel.isRunning = false
    remainingTime = 0
  }
  
  private func timeString(from timeInterval: TimeInterval) -> String {
    let hours = Int(timeInterval) / 3600
    let minutes = Int(timeInterval) / 60 % 60
    let seconds = Int(timeInterval) % 60
    return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
  }
  
  private func playSound() {
    // In a real app, you would implement sound playing using AVFoundation
    // This is a placeholder for the sound playing functionality
    print("Playing sound: \(selectedSound)")
  }
}

#Preview {
  TimerView()
}
