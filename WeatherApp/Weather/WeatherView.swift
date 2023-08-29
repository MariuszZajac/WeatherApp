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
    @ObservedObject var viewModel: WeatherViewModel
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            // Pasek stanu
            HStack {
                Text("Pogoda dla miasta X")
                    .font(.title)
                    .padding()
                Spacer()
                
            }
            .onAppear {
                viewModel.fetchWeatherData(latitude: 51.509865, longitude: -0.118092)
            }
        }
    }
    
}
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        let apiService = WeatherAPIService()
        let dataCache = WeatherDataCache(fileName: "weatherCache.json")
        let viewModel = WeatherViewModel(weatherAPIService: apiService, weatherDataCache: dataCache)
        
        return WeatherView(viewModel: viewModel)
    }
}


