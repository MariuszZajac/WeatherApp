//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 13/10/2023.
//


import SwiftUI

struct ForecastView: View {
    @StateObject var viewModel: WeatherViewModel
    var body: some View {
        VStack {
            //switch hourly to daily
            SegmentedControl(selection: $viewModel.selectedForecastType)
//            Picker(selection: vm.selectedForecastType) {
//                <#code#>
//            } label: {
//                <#code#>
//            }
          //  widok picker .pickerStyle(SegmentedControlStyle)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    switch viewModel.selectedForecastType {
                    case .hour:
                        ForEach(viewModel.hourlyForecast, id: \.id) { hourlyItem in
                            HourlyDetailView(wiewModel: HourlyDetailViewModel(forecastHourly: hourlyItem))
                        }
                    case .week:
                        ForEach(viewModel.dayForecast.dropFirst(1), id: \.id) { dailyItem in
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


