//
//  CityTextView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 03/10/2023.
//

import SwiftUI

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
        Text("\(Date().formatted(.dateTime.month().day().hour().minute()))")
            .fontWeight(.bold)
            .foregroundColor(.white)
        
    }
}

