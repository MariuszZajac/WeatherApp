//
//  CityTextView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 03/10/2023.
//

import SwiftUI

struct CityTextView: View {
    var city: City
   
    var body: some View {
        VStack {
            
            Text("\(city.city), \(city.country)")
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundColor(.white)
                .fixedSize(horizontal: false, vertical: true)
                
        }
         HStack{
            Text("\(Date().formatted(.dateTime.month().day()))")
                .fontWeight(.bold)
                .foregroundColor(.white)
            ClockView()
        }
        
    
    }
}

