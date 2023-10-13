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
                Text(viewModel.shortDayOfWeek)
            }
            .font(.subheadline .bold())
            .foregroundColor(.secondary)
            Image(systemName: viewModel.weatherIcon.systemImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            VStack {
                Text(String(format: "%.0f°", viewModel.tempMax))
                Text(String(format: "%.0f°", viewModel.tempMin))
            }
            .font(.title2)
            .foregroundColor(.secondary)
        }
    }
}
