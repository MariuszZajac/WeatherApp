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
            ScrollView(.vertical) {
                CityTextView(cityName: "Paris, France")
                
                MainWeatherStatusView(viewModel: viewModel)
                
                ForecastView(viewModel: viewModel)
                
            }
            .padding(.top,8)
        }.task {
            await viewModel.fetchData()
            
        }
        
    }
}

