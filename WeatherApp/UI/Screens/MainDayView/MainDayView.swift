//
//  MainDayView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 07/09/2023.
//

import SwiftUI

struct MainDayView: View {
    
    @State var viewModel: MainDayViewModel
    
    var body: some View {
        VStack(spacing: 5) {
            Text(viewModel.dt) 
                .font(.subheadline)
                .foregroundColor(.white)
            Text(viewModel.dt)
                .font(.subheadline .bold())
                .foregroundColor(.white)
            Image(systemName: viewModel.weatherIcon.systemImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text(String(format: "%.0f°", viewModel.wind.windSpeed))
                .font(.system(size: 30))
                .bold()
                .foregroundColor(.primary)
        }
        .frame(height: 250)
        
    }
    
}
