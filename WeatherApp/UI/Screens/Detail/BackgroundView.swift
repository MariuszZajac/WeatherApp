//
//  BackgroundView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 03/10/2023.
//

import SwiftUI

struct BackgroundView: View {
  @Environment(\.colorScheme) var colorScheme

  var topColor: Color
  var bottomColor: Color

  var body: some View {

    LinearGradient(
      gradient: Gradient(colors: [topColor, bottomColor]),
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
    .edgesIgnoringSafeArea(.all)
  }

}
