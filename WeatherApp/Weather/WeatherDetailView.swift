//
//  WeatherDetailView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 31/08/2023.
//

import SwiftUI

struct WeatherDetailView: View {
    var weatherData: WeatherData
    var hour: String
    var icon: WeatherIcon
    var temp: String
    var wind: WeatherData.Wind
    var visibility: Int
    var pressure: Int
    var humidity: Int
    
    var body: some View {
        VStack {
            Text(hour)
                .font(.title)
            
            Image(systemName: icon.systemImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            Text(temp)
                .font(.largeTitle)
            
            HStack {
                Text("Wiatr:")
                WindIconView(wind: wind)
            }
            
            HStack {
                Text("Widoczność:")
                Text("\(visibility)m")
            }
            
            HStack {
                Text("Ciśnienie:")
                Text("\(pressure) hPa")
            }
            
            HStack {
                Text("Wilgotność:")
                Text("\(humidity)%")
            }
        }
        .padding()
    }
}
//struct WeatherDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherDetailView(
//            weatherData: WeatherData(
//                id: 1,
//                dt: 1630369593,
//                main: WeatherData.Main(
//                    temp: 22.0,
//                    feels_like: 22.5,
//                    temp_min: 21.0,
//                    temp_max: 23.0,
//                    pressure: 1013,
//                    sea_level: 1013,
//                    grnd_level: 1013,
//                    humidity: 60,
//                    temp_kf: 1.0
//                ),
//                weather: [WeatherData.Weather(id: 800, main: "Clear", description: "clear sky", icon: "01d")],
//                clouds: WeatherData.Clouds(all: 1),
//                wind: WeatherData.Wind(speed: 10, deg: 45, gust: 12),
//                visibility: 10000,
//                pop: 0.0,
//                sys: WeatherData.Sys(pod: "d"),
//                dt_txt: "2023-08-31 12:00:00"
//            ),
//            hour: "12:00",
//            icon: .clearDay,
//            temp: "22°C",
//            wind: WeatherData.Wind(speed: 10, deg: 45, gust: 12),
//            visibility: 1000,
//            pressure: 1013,
//            humidity: 60
//        )
//    }
//}
