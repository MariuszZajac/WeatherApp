//
//  OneHourView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 19/10/2023.
//

import SwiftUI

struct OneHourView: View {
    @Binding var selectedHourlyItem: HourlyWeather?

    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("LightBlue"))

            VStack {
                if let hourlyItem = selectedHourlyItem {
                    Text("DevPoint \(hourlyItem.dewPoint) °")
                    Text("Humidity \(hourlyItem.humidity) %")
                    Text("UV index \(hourlyItem.uvi)")
                    Text("Temp \(hourlyItem.temp)°")
                    Text("Pressure \(hourlyItem.pressure) hPa")
                    if let visibility = hourlyItem.visibility {
                        Text("Visibility \(visibility) m")
                    }
                }
                else {
                    Text("brak danych")
                }
            }
            .padding()
        }
    }
}

