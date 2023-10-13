//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//
import Foundation
import SwiftUI
import Combine

struct WeatherView: View {
    @StateObject var viewModel: WeatherViewModel
    
    var body: some View {
        
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("LightBlue"))
            VStack {
                CityTextView(cityName: "Paris, France")
                
                MainWeatherStatusView(icon: viewModel.icon , temperature: viewModel.temp, description: viewModel.description, wind: viewModel.wind )
                
                ForecastView(viewModel: viewModel)
            }
            .padding(.top,5)
        }.task {
            await viewModel.fetchData()
            
        }
        
    }
}

