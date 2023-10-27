//
//  WindIconView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 01/09/2023.
//

import SwiftUI

struct WindIconView: View {
  var wind: Wind
  var body: some View {
    let icon = WindIcon.getWindIcon(from: wind)
    switch icon {
    case .lightNorth, .moderateNorth, .strongNorth:
      Image(systemName: "arrow.up")
        .foregroundStyle(Color.primary)
    case .lightEast, .moderateEast, .strongEast:
      Image(systemName: "arrow.right")
        .foregroundStyle(Color.primary)
    case .lightSouth, .moderateSouth, .strongSouth:
      Image(systemName: "arrow.down")
        .foregroundStyle(Color.primary)
    case .lightWest, .moderateWest, .strongWest:
      Image(systemName: "arrow.left")
        .foregroundStyle(Color.primary)
    }
  }

}
