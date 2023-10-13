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
        VStack(spacing: 0 ) {
            HStack {
                Text("\(String(format: "%.0f", viewModel.temp))°")
                    .font(.system(size: 70))
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
                    .frame(width: 32 , height: 32)
                
                VStack {
                    WindIconView(wind: viewModel.wind)
                    
                    Text("\(String(format: "%.1f", (viewModel.wind.windSpeed))) m/s")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
            }
            Text(viewModel.description)
                .font(.title)
                .fontWeight(.regular)
                .foregroundColor(.secondary)
        }
    }
}
