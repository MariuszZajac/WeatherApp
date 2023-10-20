//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 13/10/2023.
//


import SwiftUI

struct ForecastView: View {
    @StateObject var viewModel: WeatherViewModel
    @State private var isOneHourViewPresented = false
    @State private var selectedHourlyItem: HourlyWeather?

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
                            Button(action: {
                                selectedHourlyItem = hourlyItem
                                isOneHourViewPresented = true
                            }) {
                                HourlyDetailView(viewModel: HourlyDetailViewModel(forecastHourly: hourlyItem))
                            }
                        }
                        .sheet(isPresented: $isOneHourViewPresented) {
                            if let selectedHourlyItem = selectedHourlyItem {
                                VStack {
                                    OneHourView(hourlyItem: selectedHourlyItem)
                                }
                            }
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


