//
//  DayDetailView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 31/08/2023.
//

import SwiftUI

struct HourlyDetailView: View {
    
    var wiewModel: HourlyDetailViewModel
    var body: some View {
        
        VStack {
            Text(wiewModel.hour ?? "")
                .fontDesign(.monospaced)
                .font(.subheadline)
            HStack {
                WindIconView(wind: wiewModel.wind)
                Text("\(String(format: "%.1f", (wiewModel.wind.windSpeed))) m/s")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(width: 60, height: 60)
            
            
            Image(systemName: wiewModel.weatherIcon.systemImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            
            
            VStack{
                Text("\( wiewModel.temp)°")
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


