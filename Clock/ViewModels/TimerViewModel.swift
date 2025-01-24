//
//  TimerViewModel.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import Foundation

class TimerViewModel: ObservableObject {
  @Published var hours: Int = 0
  @Published var minutes: Int = 0
  @Published var seconds: Int = 0
  @Published var isRunning = false
  
  private var timer: Timer?
  
  func start() {
    isRunning = true
    // Timer implementation
  }
  
  func stop() {
    isRunning = false
    timer?.invalidate()
    timer = nil
  }
}
