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
    @StateObject var vm: WeatherViewModel
    
    var body: some View {
        
            ZStack {
                BackgroundView(topColor: .blue, bottomColor: Color("LightBlue"))
                VStack {
                    CityTextView(cityName: "Paris, France")
                    
                    MainWeatherStatusview(icon: vm.icon , temperature: vm.temp, description: vm.description, wind: vm.wind )
                   
                        ForecastView(vm: vm)
                        
                        
//                        ForEach(vm.dayForecast.prefix(5), id: \.id) { dailyItem in
//                            
//                            NavigationLink(destination: HourlyDetailView(wiewModel: vm.getHourlyForecast(for: dailyItem))) {
//                                
//                                OneDayShortView(viewModel: OneDayShortViewModel(forecast: dailyItem))
//                            }
//                        }
                    
                }
                .padding(.top,5)
            }.task {
                await vm.fetchData()
                
            }
        
    }
}

struct MainWeatherStatusview: View {
    var icon: WeatherIcon
    var temperature: Double
    var description: String
    var wind: Wind
    var body: some View {
        VStack(spacing: 5 ) {
            Image(systemName: icon.systemImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            HStack {
                Text("\(String(format: "%.0f", temperature))°")
                    .font(.system(size: 70))
                    .bold()
                    .foregroundColor(.white)
                HStack(spacing: 5) {
                    Image(systemName: "wind")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                    
                    VStack {
                        WindIconView(wind: wind)
                        
                        Text("\(String(format: "%.1f", (wind.windSpeed))) m/s")
                            .font(.title2)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    .padding(5)
                }
            } .padding(10)
            Text(description)
                .font(.largeTitle)
                .fontWeight(.regular)
                .foregroundColor(.secondary)
            
            
            
            
        }
        .padding(.bottom, 20)
    }
}
