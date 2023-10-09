//
//  TemperatureGraph.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 14/09/2023.
//

import SwiftUI
import Charts

struct TemperatureChart: View {
   
    let temperatureChart: [TemperatureData]

    var body: some View {
        VStack {
            Chart {
                ForEach(temperatureChart, id: \.date) { item in

                    LineMark(x: .value("Hour", item.date),
                             y: .value("Temperatura", item.temp))
                }
                .foregroundStyle(.blue)
            }
        }
    }

}

class TemperatureData {
    var forecast: [WeatherData]

    var date: Date {
        let timestamp = forecast.first?.hourly.first?.dt
            let date = Date(timeIntervalSince1970: timestamp ?? 0)
            return date
    }

        
    var temp: String
        
        init(forecast: [WeatherData], temp: String) {
            self.forecast = forecast
            self.temp = temp
        }
    }


// struct TemperatureGraph_Previews: PreviewProvider {
//    static var previews: some View {
//        let tempDataDict = ["12:23,05,2021": 22.5, "15:23,05,2021": 18.0, "18:23,05,2021": 28.0]
//        let tempDataArray = tempDataDict.map { key, value in
//            TemperatureData (vm: WeatherViewModel(repository: WeatherRepositoryProtocol), date: "12:23,05,2021", temp: 22.5)
//        }
//        return TemperatureChart(temperatureChart: tempDataArray)
//    }
// }
        
