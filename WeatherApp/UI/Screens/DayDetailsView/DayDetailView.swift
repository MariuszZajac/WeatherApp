//
//  DayDetailView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 31/08/2023.
//

import SwiftUI

struct DayDetailView: View {
    
    var forecast: [WeatherData]
    
//    var dt: TimeInterval
//    var temp: Double
//    var feelsLike: Double?
//    var pressure: Int
//    var humidity: Int
//    var dewPoint: Double
//    var uvi: Double
//    var clouds: Int
//    var visibility: Int
//    var windSpeed: Double
//    var windDeg: Int
//    var windGust: Double
//    var weather: [WeatherInfo]
//    var pop: Double
//    
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("LightBlue"))
            VStack {
                VStack {
                    Text("\(String(format: "%.0f",forecast.first?.daily.first?.temp.max ?? 0))")
                    Text("\(String(format: "%.0f",forecast.first?.daily.first?.temp.min ?? 0))")
                }
                .font(.title)
                
                
                Image(systemName: forecast.first?.daily.first?.weather.first?.icon.systemImageName ?? "questionmark")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                
                
                Text("\(String(format: "%.1f", (forecast.first?.daily.first?.windSpeed ?? 0))) m/s")
                    .font(.title2)
                    .foregroundColor(.green)
                    .padding()
                
                
                
            }
            TemperatureChart(temperatureChart: [TemperatureData]())
        }
    }
}


//struct DayDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DayDetailView(viewModel: DayDetailViewModel(detailWeather: [HourlyWeather]()))
//    }
//}
