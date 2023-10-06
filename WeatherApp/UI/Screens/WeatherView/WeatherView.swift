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
   // let dailyWeather: [DailyWeather]
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView(topColor: .blue, bottomColor: Color("LightBlue"))
                VStack {
                    CityTextView(cityName: "Paris, France")
                    
                    MainWeatherStatusview(icon: vm.icon , temperature: vm.temp )
                    HStack {
                       
                        ForEach(vm.forecast.first?.daily.prefix(6) ?? []) { dailyItem in
                            WeatherWeekView(viewModel: WeatherWeekViewModel(weekWeather: dailyItem))
                        }

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
