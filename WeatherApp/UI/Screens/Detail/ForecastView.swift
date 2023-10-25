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
    @State private var isOneDayVievPresented = false
    @State private var selectedDayItem: DailyWeather?
    
    init(viewModel: WeatherViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self._selectedHourlyItem = State(initialValue: viewModel.hourlyForecast.first)
    }
    
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
                            
                            VStack {
                                OneHourView(selectedHourlyItem: $selectedHourlyItem)
                            }
                        }
                        
                    case .week:
                        ForEach(viewModel.dayForecast.dropFirst(1), id: \.id) { dailyItem in
                            
                            Button(action: {
                                selectedDayItem = dailyItem
                                isOneDayVievPresented = true
                                
                            }) {
                                OneDayShortView(viewModel: OneDayShortViewModel(forecast: dailyItem))
                            }
                        }
                        .sheet(isPresented: $isOneDayVievPresented) {
                            
                            VStack {
                                OneDayView(selectedDayItem: $selectedDayItem)
                            }
                            
                        }
                    }
                }
                .padding(8)
                
            }
            if viewModel.selectedForecastType == .hour  {
                TemperatureChart(hourlyWeatherData: viewModel.hourlyForecast)
               // TODO:
                if let currentWeather = viewModel.currentForecast {
                    RainChart(currentWeatherData: currentWeather )
                }
            }
            
        }
        .padding()
        
    }
    
}


