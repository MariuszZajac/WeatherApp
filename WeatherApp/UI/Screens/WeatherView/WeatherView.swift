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
    @StateObject var cityViewModel: CityViewModel

    var body: some View {
        
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("LightBlue"))
        
            switch viewModel.state {
            case .loading:
                ProgressView("Loading actual forecast")
                
            case .error(let error):
    
                ErrorView(title: error) {
                   // add appropriate func
                }
            case .loaded:
                ScrollView(.vertical) {
                    CityTextView(cityViewModel: cityViewModel)
                 
                    MainWeatherStatusView(viewModel: viewModel)
                    
                    ForecastView(viewModel: viewModel)
                    
                }
                .padding(.top,8)
            }
            
        }.refreshable {
            viewModel.refreshData()

        }
        .task {
           _ = try? await Task.sleep(nanoseconds: 700000000)
            await viewModel.fetchData(latitude: cityViewModel.latitude, longitude: cityViewModel.longnitude)
          //diagnostic
            print(cityViewModel.latitude )
            print(cityViewModel.longnitude)
            
        }
        
    }
}

