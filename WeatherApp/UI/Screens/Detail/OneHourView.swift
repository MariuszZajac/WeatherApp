//
//  OneHourView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 19/10/2023.
//

import SwiftUI

struct OneHourView: View {
    let hourlyItem: HourlyWeather
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: Color("LightBlue"))
            
            VStack {
              
                Text("DevPoint \(hourlyItem.dewPoint) °")
                Text("Humidity \(hourlyItem.humidity) %")
                Text("UV index \(hourlyItem.uvi)")
                Text("Temp \(hourlyItem.temp)°")
                Text("Pressure \(hourlyItem.pressure) hPa")
                Text("Visability \(hourlyItem.visibility!) m ")
            }
            .padding()
        }
    }
}


