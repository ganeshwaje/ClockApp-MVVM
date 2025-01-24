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
  
  var body: some View {
    Text(title)
      .font(.title3)
      .foregroundColor(color)
      .frame(width: 80, height: 80)
      .background(Color.black.opacity(0.1))
      .clipShape(Circle())
  }
}
