//
//  WeatherNoonView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 30/08/2023.
//

import SwiftUI

struct OneDayShortView: View {
  var viewModel: OneDayShortViewModel

  var body: some View {
    VStack {
      VStack {
        Text(viewModel.dayOfWeek)
          .font(.subheadline.bold())
          .foregroundColor(.secondary)
        Text(viewModel.shortDayOfWeek)
          .font(.subheadline.bold())
          .foregroundColor(.secondary)
      }
      .frame(maxWidth: .infinity)

      Image(systemName: viewModel.weatherIcon.systemImageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 48, height: 48)

      if viewModel.pop > 0 {
        Text(String(format: "%.0f%%", viewModel.pop))
          .font(.system(size: 9))
          .foregroundStyle(Color.primary)
      } else {
        Color.clear.frame(width: 0, height: 0)
      }

      VStack {
        Text(String(format: "%.0f°", viewModel.tempMax))
          .font(.title2)
          .foregroundColor(.secondary)

        Text(String(format: "%.0f°", viewModel.tempMin))
          .font(.title2)
          .foregroundColor(.secondary)
      }
      .frame(maxWidth: .infinity)
    }
    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
  }
}
