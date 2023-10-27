//
//  MainWeatherStatusview.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 13/10/2023.
//

import SwiftUI

struct MainWeatherStatusView: View {
  @StateObject var viewModel: WeatherViewModel

  var body: some View {
    VStack {
      HStack {
        Text("\(String(format: "%.0f", viewModel.temp))°")
          .font(.system(size: 80))
          .bold()
          .foregroundColor(.white)

        Image(systemName: viewModel.icon.systemImageName)
          .renderingMode(.original)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 160, height: 160)
      }
      HStack {

        Image(systemName: "wind")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 32, height: 32)

        VStack {
          WindIconView(wind: viewModel.wind)

          Text("\(String(format: "%.1f", (viewModel.wind.windSpeed))) m/s")
            .font(.title3)
            .foregroundColor(.secondary)
        }
      }
      HStack {
        Text("\(viewModel.description)")
          .font(.title3)
          .fontWeight(.regular)
          .foregroundColor(.secondary)
        if viewModel.rain > 0.0 {
          Text("\(String(viewModel.rain)) mm/m² in one hour")
            .font(.title3)
            .foregroundColor(.secondary)
        }
      }
    }
  }
}
