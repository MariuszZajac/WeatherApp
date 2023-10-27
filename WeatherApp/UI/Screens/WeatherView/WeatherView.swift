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
        
            switch viewModel.state {
            case .loading:
                ProgressView("Loading actual forecast")
                
            case .error(let error):
    
                ErrorView(title: error) {
               // TODO: // add appropriate func
                }
            case .loaded:
                ScrollView(.vertical) {
                    if let city = viewModel.city {
                        CityTextView(city: city)
                    }
                    MainWeatherStatusView(viewModel: viewModel)
                    
                    ForecastView(viewModel: viewModel)
                }
                .padding(.top,8)
            }
            
        }.refreshable {
            viewModel.refreshData()
        }
        .task {
            await viewModel.fetchData()
        }
        
    }
}

