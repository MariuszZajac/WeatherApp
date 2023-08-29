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
        NavigationView {
            ZStack (alignment: .leading){
                VStack{
                    if let firstWeatherData = viewModel.weatherData.value.first {
                        weatherInfo(firstWeatherData: firstWeatherData) // przeniesienie logiki do subview
                    }
                    Spacer()
                    VStack{
                        weatherIcon() // przeniesienie logiki do subview
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchWeatherData(latitude: 51.509865, longitude: -0.118092)
            // możesz też dodać obsługę błędów tutaj
        }
    }
    
    private func weatherInfo(firstWeatherData: WeatherData) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Paris")
                .bold()
                .font(.title)
            Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                .fontWeight(.light)
            Text("\(firstWeatherData.main.temp)°")
                .font(.largeTitle)
                .bold()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func weatherIcon() -> some View {
        HStack{
            VStack(spacing: 20) {
                if let iconCode = viewModel.weatherData.value.first?.weather.first?.icon,
                   let weatherIcon = WeatherIcon(rawValue: iconCode) {
                    Image(systemName: weatherIcon.systemImageName)
                        .font(.system(size: 40))
                } else {
                    // Domyślna ikona, gdy nie ma danych
                    Image(systemName: "questionmark.circle")
                }
        
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


