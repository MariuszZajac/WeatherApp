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
               if let city = cityViewModel.city {
                   Text("\(city.city), \(city.country)")
                   .font(.system(size: 32, weight: .medium, design: .default))
                   .foregroundColor(.white)
                   .padding()
       
       
      
               } else {
                   ProgressView()
                  
               }
               HStack{
                   Text("\(Date().formatted(.dateTime.month().day()))")
                               .fontWeight(.bold)
                               .foregroundColor(.white)
                   ClockView()
               }
           }
           .onAppear {
              
               cityViewModel.fetchCityAndCountry()
           }
       }
   }
          
