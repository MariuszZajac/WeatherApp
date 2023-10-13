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
                
                MainWeatherStatusView(icon: vm.icon , temperature: vm.temp, description: vm.description, wind: vm.wind )
                
                ForecastView(vm: vm)
            }
            .padding(.top,5)
        }.task {
            await vm.fetchData()
            
        }
        
    }
}

