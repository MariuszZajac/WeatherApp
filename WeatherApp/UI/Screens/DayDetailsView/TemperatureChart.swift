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
    private let vm: DayDetailViewModel

    var date: String
    var temp: String


    init(vm: DayDetailViewModel, date: String, temp: Double) {
        self.vm = vm

        self.date = vm.dt
        self.temp = vm.temp
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
        
