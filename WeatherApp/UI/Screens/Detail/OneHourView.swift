//
//  OneHourView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 19/10/2023.
//

import SwiftUI

struct OneHourView: View {
    @Binding var selectedHourlyItem: HourlyWeather?
// this is a temp view just to check display data. 
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("LightBlue"))

            VStack {
                            if let hourlyItem = selectedHourlyItem {
                                Text("This is temporary view")
                                    .font(.title2)
                                    .foregroundStyle(.red)
                                
                                if let formattedTime = formatTime(hourlyItem.dt) {
                                                        Text("Time :\(formattedTime)")
                                                    }
                                
                                Text("Temp: \(hourlyItem.temp)°")
                                if let feelsLike = hourlyItem.feelsLike {
                                    Text("Feels Like: \(feelsLike)°")
                                }
                                Text("Pressure: \(hourlyItem.pressure) hPa")
                                Text("Humidity: \(hourlyItem.humidity)%")
                                Text("Dew Point: \(hourlyItem.dewPoint)°")
                                Text("UV Index: \(hourlyItem.uvi)")
                                Text("Clouds: \(hourlyItem.clouds)")
                                if let visibility = hourlyItem.visibility {
                                    Text("Visibility: \(visibility) m")
                                }
                                Text("Wind Speed: \(hourlyItem.windSpeed) m/s")
                                Text("Wind Degree: \(hourlyItem.windDeg)°")
                                Text("Wind Gust: \(hourlyItem.windGust) m/s")
                                Text("POP: \(hourlyItem.pop)")
                                
                                if !hourlyItem.weather.isEmpty {
                                    Text("Weather Conditions:")
                                    ForEach(hourlyItem.weather, id: \.id) { weatherInfo in
                                        Text(weatherInfo.description)
                                    }
                                }
                            }
                        }
            .padding()
        }
    }
}

