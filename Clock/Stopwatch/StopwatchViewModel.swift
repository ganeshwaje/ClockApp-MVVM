//
//  StopwatchViewModel.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import Foundation

class StopwatchViewModel: ObservableObject {
  @Published var isRunning = false
  @Published var elapsedTime: TimeInterval = 0
  @Published var laps: [TimeInterval] = []
  
  private var timer: Timer?
  private var lastLapTime: TimeInterval = 0
  
  var formattedTime: String {
    let minutes = Int(elapsedTime) / 60
    let seconds = Int(elapsedTime) % 60
    let milliseconds = Int((elapsedTime.truncatingRemainder(dividingBy: 1)) * 100)
    return String(format: "%02d:%02d:%02d", minutes, seconds, milliseconds)
  }
  
  func toggleTimer() {
    if isRunning {
      stopTimer()
    } else {
      startTimer()
    }
  }
  
  func lap() {
    if isRunning {
      let lapTime = elapsedTime - lastLapTime
      laps.insert(lapTime, at: 0)
      lastLapTime = elapsedTime
    } else {
      reset()
    }
  }
  
  private func startTimer() {
    isRunning = true
    timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] _ in
      self?.elapsedTime += 0.01
    }
  }
  
  private func stopTimer() {
    isRunning = false
    timer?.invalidate()
    timer = nil
  }
  
  private func reset() {
    stopTimer()
    elapsedTime = 0
    lastLapTime = 0
    laps.removeAll()
  }
}

extension StopwatchViewModel {
  var seconds: Double {
    elapsedTime.truncatingRemainder(dividingBy: 60)
  }
  
  var minutes: Double {
    (elapsedTime / 60).truncatingRemainder(dividingBy: 60)
  }
  
  var hours: Double {
    elapsedTime / 3600
  }
}
