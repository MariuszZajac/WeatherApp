//
//  WeatherNoonView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 30/08/2023.
//

import SwiftUI

struct WeatherWeekView: View {
    @ObservedObject var viewModel: WeatherWeekViewModel
    
    var body: some View {
        VStack(spacing: 5) {
//            Text(viewModel.dayString)
//                .font(.subheadline)
//                .foregroundColor(.white)
//            Text(viewModel.dayOfWeek ?? "")
//                .font(.subheadline .bold())
//                .foregroundColor(.white)
//            Image(systemName: viewModel.weatherIcon.systemImageName)
//                .renderingMode(.original)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 40, height: 40)
//            Text(String(format: "%.0f°", viewModel.temperature))
//                .font(.system(size: 30))
//                .bold()
//                .foregroundColor(.primary)
        }
        .frame(height: 250)
        
    }
    
    
}
