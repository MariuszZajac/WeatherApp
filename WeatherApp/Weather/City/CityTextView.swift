//
//  CityTextView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 03/10/2023.
//

import SwiftUI

struct CityTextView: View {
    
    @ObservedObject var cityViewModel: CityViewModel
  
    
    var body: some View {
        VStack {
            
            Text("\(cityViewModel.cityName), \(cityViewModel.countryName)")
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
        }
        HStack{
            Text("\(Date().formatted(.dateTime.month().day()))")
                .fontWeight(.bold)
                .foregroundColor(.white)
            ClockView()
        }
        
        .task {
            cityViewModel.fetchCityAndCountry()
            
        }
    }
}

