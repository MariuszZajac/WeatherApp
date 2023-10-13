//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 13/10/2023.
//


import SwiftUI

struct ForecastView: View {
    @StateObject var vm: WeatherViewModel
    var body: some View {
        VStack {
            //switch hourly to daily
            SegmentedControl(selection: $vm.selectedForecastType)
//            Picker(selection: vm.selectedForecastType) {
//                <#code#>
//            } label: {
//                <#code#>
//            }
          //  widok picker .pickerStyle(SegmentedControlStyle)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    switch vm.selectedForecastType {
                    case .hour:
                        ForEach(vm.hourlyForecast, id: \.id) { hourlyItem in
                            HourlyDetailView(wiewModel: HourlyDetailViewModel(forecastHourly: hourlyItem))
                        }
                    case .week:
                        ForEach(vm.dayForecast.dropFirst(1), id: \.id) { dailyItem in
                            OneDayShortView(viewModel: OneDayShortViewModel(forecast: dailyItem))
                        }
                    
                    }
                }
                .padding(10)
            }
            
        }
        .padding()
    
    }
}


