//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 13/10/2023.
//


import SwiftUI

struct ForecastView: View {
    @State private var selection = 0
    @StateObject var vm: WeatherViewModel
    var body: some View {
        VStack {
            //switch hourly to daily
            SegmentedControl(selection: $selection)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    if selection == 0 {
                        ForEach(vm.hourlyForecast, id: \.id) { hourlyItem in
                            HourlyDetailView(wiewModel: HourlyDetailViewModel(forecastHourly: [hourlyItem]))
                        }
                         
                    } else {
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


