//
//  CircleButton.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import SwiftUI

struct CircleButton: View {
  let title: String
  let color: Color
  let tintColor: Color
  
  init(title: String, color: Color, tintColor: Color = .gray) {
    self.title = title
    self.color = color
    self.tintColor = tintColor
  }
  
  var body: some View {
    Text(title)
      .font(.title3)
      .foregroundColor(color)
      .frame(width: 80, height: 80)
      .background(tintColor.opacity(0.1))
      .clipShape(Circle())
  }
}
