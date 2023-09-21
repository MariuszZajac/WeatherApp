//
//  TemperatureGraph.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 14/09/2023.
//

import SwiftUI
import Charts

struct TemperatureChart: View {
   // var weatherData: [WeatherData] = []
    // dane wysłąć
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
    private let weatherViewModel: WeatherViewModel

    var date: String//  WeatherData.dtTxt
    var temp: Double// WeatherData.Main.temp


    init(weatherViewModel: WeatherViewModel, date: String, temp: Double) {
        self.weatherViewModel = weatherViewModel

        self.date = "0" // weatherViewModel.weatherDataUI.first?.dtTxt ?? "\(Date.now)"
        self.temp = 0// weatherViewModel.weatherDataUI.first?.main.temp ?? 0
    }
}

// struct TemperatureGraph_Previews: PreviewProvider {
//    static var previews: some View {
//        let tempDataDict = ["12:23,05,2021": 22.5, "15:23,05,2021": 18.0, "18:23,05,2021": 28.0]
//        let tempDataArray = tempDataDict.map { key, value in
//            TemperatureData (weatherViewModel: WeatherViewModel(), date: "12:23,05,2021", temp: 22.5)
//        }
//        return TemperatureChart(temperatureChart: tempDataArray)
//    }
// }
//        
