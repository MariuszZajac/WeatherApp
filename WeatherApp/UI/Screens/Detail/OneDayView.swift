//
//  OneDayView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 24/10/2023.
//

import SwiftUI


struct OneDayView: View {
    @Binding var selectedDayItem: DailyWeather?
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("LightBlue"))
            VStack {
                if let dayItem = selectedDayItem {
                    Text("This is temporary view for a day ")
                        .font(.title2)
                        .foregroundStyle(.red)
                    
                    if let formattedTime = formatTime(dayItem.dt) {
                                            Text("Forecast for  \(formattedTime)")
                                        }
                    Text("Pressure: \(dayItem.pressure) hPa")
                    Text("Humidity: \(dayItem.humidity)%")
                    Text("Dew Point: \(dayItem.dewPoint)°")
                    Text("UV Index: \(dayItem.uvi)")
                    Text("Clouds: \(dayItem.clouds)")
                    if let visibility = dayItem.visibility {
                        Text("Visibility: \(visibility) m")
                    }
                    Text("Wind Speed: \(dayItem.windSpeed) m/s")
                    Text("Wind Degree: \(dayItem.windDeg)°")
                    Text("Wind Gust: \(dayItem.windGust) m/s")
                    Text("POP: \(dayItem.pop)")
                }
               
            }
        }
    }
}

func formatTime(_ timestamp: TimeInterval) -> String? {
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }

