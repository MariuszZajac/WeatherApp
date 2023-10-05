//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//
import Foundation
import SwiftUI
import Combine

struct WeatherView: View {
    @State var vm: WeatherViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView(topColor: .blue, bottomColor: Color("LightBlue"))
                VStack {
                    CityTextView(cityName: "Paris, France")
                    
                    MainWeatherStatusview(icon: vm.icon ?? .snowNight, temperature: vm.temp )
                    HStack {
//                        ForEach(WeatherData.DailyWeather, id: \.dt) { item  in
//                        WeatherWeekView(viewModel: WeatherWeekViewModel(weekWeatherItem: item))}
//                        // week forecast
//                    ForEach(viewModel.weatherDataUI, id: \.date) { item in
//                        
//                            MainDayView(viewModel: MainDayViewModel(weatherItem: item))
//                        }
//
//                        // hour forecast
//                        ForEach(viewModel.weatherDataUI, id: \.date) { item in
//                            
//                            WeatherWeekView(viewModel: WeatherWeekViewModel(weatherItems: [item]))
//                            }
                        
                     //  .frame(height: 250)

                    }
                    
                }
            }.task {
                await vm.fetchData()
            
            }
        }
    }
}

struct MainWeatherStatusview: View {
    var icon: WeatherIcon
    var temperature: Double
    
    var body: some View {
        VStack(spacing: 8 ) {
            Image(systemName: icon.systemImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(String(format: "%.0f", temperature))°")
                .font(.system(size: 70))
                .bold()
                .foregroundColor(.white)
            
        }
        .padding(.bottom, 40)
    }
}
