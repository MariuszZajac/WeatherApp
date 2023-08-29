//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import SwiftUI

struct WeatherView: View {
    // Dependency Injection
    @StateObject var weatherViewModel = WeatherViewModel(weatherAPIService: WeatherAPIService())
    
    var body: some View {
        List(weatherViewModel.weatherData.value) { weatherData in
            VStack {
                HStack {
                    if let firstWeather = weatherData.weather.first,
                       let weatherIcon = WeatherIcon(rawValue: firstWeather.icon) {
                        Text(firstWeather.description)
                        Image(systemName: weatherIcon.systemImageName)
                    } else {
                        Text("N/A")
                        Image(systemName: "cloud")
                    }
                }
                
                VStack {
                    Text("\(String(format: "%.1f", weatherData.main.temp))°C")
                        .bold()
                        .font(.title)
                    
                    Text("\(String(format: "%.1f", weatherData.main.temp_max))°C / \(String(format: "%.1f", weatherData.main.temp_min))°C")
                    
                    Text("\(weatherData.main.pressure) hPa")
                }
            }
            .foregroundColor(.white)
            .padding()
            .background(Color.blue.opacity(0.4))
            .cornerRadius(10)
            .frame(width: 250, height: 250)
        }
        .onAppear {
            weatherViewModel.fetchWeatherData(latitude: 48.856788, longitude: 2.351077) // Paryż
        }
        .alert(item: $weatherViewModel.error) { error in
            Alert(title: Text("Błąd"), message: Text(error.localizedDescription), dismissButton: .default(Text("OK")))
        }
    }
}
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}


