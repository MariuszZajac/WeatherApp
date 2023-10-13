//
//  MainWeatherStatusview.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 13/10/2023.
//

import SwiftUI

struct MainWeatherStatusView: View {
    var icon: WeatherIcon
    var temperature: Double
    var description: String
    var wind: Wind
    var body: some View {
        VStack(spacing: 8 ) {
            Image(systemName: icon.systemImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140, height: 140)
            
            HStack {
                Text("\(String(format: "%.0f", temperature))°")
                    .font(.system(size: 70))
                    .bold()
                    .foregroundColor(.white)
                HStack(spacing: 8) {
                    Image(systemName: "wind")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                    
                    VStack {
                        WindIconView(wind: wind)
                        
                        Text("\(String(format: "%.1f", (wind.windSpeed))) m/s")
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    .padding(8)
                }
            } .padding(0)
            Text(description)
                .font(.largeTitle)
                .fontWeight(.regular)
                .foregroundColor(.secondary)
            
            
            
            
        }
        .padding(.bottom, 20)
    }
}
