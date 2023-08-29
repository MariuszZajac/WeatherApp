//
//  WeatherRowView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 29/08/2023.
//

import SwiftUI

struct WeatherRowView: View {
        var logo: String
        var name: String
        var value: String
        
        var body: some View {
            HStack(spacing: 20) {
                Image(systemName: logo)
                    .font(.title2)
                    .frame(width: 5 , height: 5)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(50)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(value)")
                        .bold()
                        .font(.headline)
                        
                }
                
            }
           // .frame(width: 40, height: 50)
        }
    }

   
struct WeatherRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRowView(logo: "termometer", name: "temp", value: "8°")
    }
}
