//
//  WorldClock.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import Foundation

struct WorldClock: Identifiable {
  let id = UUID()
  let city: String
  let hourDifference: Int
}
