//
//  WorldClockView.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import SwiftUI

struct WorldClockView: View {
  @State private var clocks: [WorldClock] = [
    WorldClock(city: "San Francisco", hourDifference: 0),
    WorldClock(city: "New York", hourDifference: 3),
    WorldClock(city: "London", hourDifference: 8),
    WorldClock(city: "Tokyo", hourDifference: 16)
  ]
  
  var body: some View {
    List {
      ForEach(clocks) { clock in
        WorldClockRow(clock: clock)
      }
      .onDelete(perform: deleteClock)
    }
    .navigationTitle("World Clock")
    .toolbar {
      Button(action: addClock) {
        Image(systemName: "plus")
      }
    }
  }
  
  func deleteClock(at offsets: IndexSet) {
    clocks.remove(atOffsets: offsets)
  }
  
  func addClock() {
    // Add new clock functionality
  }
}
