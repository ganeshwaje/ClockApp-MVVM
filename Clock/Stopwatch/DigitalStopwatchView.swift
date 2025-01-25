//
//  DigitalStopwatchView.swift
//  Clock
//
//  Created by Ganesh Waje on 24/01/25.
//

import SwiftUI

struct DigitalStopwatchView: View {
  @ObservedObject var viewModel: StopwatchViewModel
  
  var body: some View {
    Text(viewModel.formattedTime)
      .font(.system(size: 65, weight: .thin, design: .monospaced))
      .monospacedDigit()
  }
}

#Preview {
  DigitalStopwatchView(viewModel: .init())
}
