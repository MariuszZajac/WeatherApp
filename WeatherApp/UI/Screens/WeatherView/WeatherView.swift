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
    @ObservedObject var cityViewModel: CityViewModel

    var body: some View {
        
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("LightBlue"))
        
            switch viewModel.state {
            case .loading:
                ProgressView("Loading actual forecast")
            case .error(let error):
                ErrorView(title: error.localizedDescription) {
                   /// ??????????
                }
            case .loaded:
                ScrollView(.vertical) {
                    CityTextView(cityViewModel: cityViewModel)
                    
                    MainWeatherStatusView(viewModel: viewModel)
                    
                    ForecastView(viewModel: viewModel)
                    
                }
                .padding(.top,8)
            }
            
        }.task {
            await viewModel.fetchData()
            
        }
        
    }
}

