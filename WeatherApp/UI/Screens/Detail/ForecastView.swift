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
            Picker("Forecast Type", selection: $viewModel.selectedForecastType)  {
                Text("24 hour Forecast").tag(WeatherViewModel.ForecastType.hour)
                Text("Weekly Forecast").tag(WeatherViewModel.ForecastType.week)
            }
            .pickerStyle(SegmentedPickerStyle())
            .font(.headline.weight(.semibold))
            .foregroundColor(.secondary)
            .padding(8)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    switch viewModel.selectedForecastType {
                    case .hour:
                        ForEach(viewModel.hourlyForecast.prefix(24), id: \.id) { hourlyItem in
                            HourlyDetailView(wiewModel: HourlyDetailViewModel(forecastHourly: hourlyItem))
                        }
                    case .week:
                        ForEach(viewModel.dayForecast.dropFirst(1), id: \.id) { dailyItem in
                            OneDayShortView(viewModel: OneDayShortViewModel(forecast: dailyItem))
                        }
                        
                    }
                }
                .padding(8)
                
            }
            if viewModel.selectedForecastType == .hour  {
                TemperatureChart(hourlyWeatherData: viewModel.hourlyForecast)
            }
            
        }
        .padding()
        
    }
}


