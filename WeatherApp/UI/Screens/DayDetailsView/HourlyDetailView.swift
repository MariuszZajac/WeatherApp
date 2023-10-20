//
//  DayDetailView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 31/08/2023.
//

import SwiftUI

struct HourlyDetailView: View {
    
    var viewModel: HourlyDetailViewModel
    
    var body: some View {
        
        VStack {
            Text(viewModel.hour ?? "")
                .fontDesign(.monospaced)
                .font(.subheadline)
            HStack {
                WindIconView(wind: viewModel.wind)
                Text("\(String(format: "%.1f", (viewModel.wind.windSpeed)))m/s")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .frame(width: 50, height: 50)
            
            
            Image(systemName: viewModel.weatherIcon.systemImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 48, height: 48)
            if viewModel.pop > 0 {
                Text(String(format: "%.0f%%", viewModel.pop))
                    .font(.system(size: 10))
            }
            
            VStack{
                Text("\( viewModel.temp)°")
                    .foregroundColor(.secondary)

                
                
            }
            .font(.title3)
        }
//        .overlay {
//            RoundedRectangle(cornerRadius: 10)
//                .strokeBorder(.white.opacity(0.2))
//                .blendMode(.overlay)
//            }
        
    }
}


