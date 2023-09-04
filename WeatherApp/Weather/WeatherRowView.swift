//
//  WeatherRoWView2.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 31/08/2023.
//

import SwiftUI

struct WeatherRowView: View {
    var data: String
    var day: String
    var icon: WeatherIcon
    var temp: String
    
    init(data:String, icon: WeatherIcon, temp: String) {
        self.data = data
        self.icon = icon
        self.temp = temp
        self.day = "N/A"
        self.day = getDayOfWeek(from: data) ?? "N/A"
    }
    var body: some View {
        VStack(spacing: 5) {
            Text("\(data)")
            Text("\(day)")
                .font(.caption)
            VStack{
                Image(systemName: icon.systemImageName)
                    .font(.title2)
                    .frame(width: 5 , height: 5)
                    .padding()
            }.foregroundColor(Color.blue)
            Text("\(temp)°")
                .bold()
                .font(.headline)
        }
        .frame(width: 55, height: 100)
        .foregroundColor(Color.black)
        
    }
    func getDayOfWeek(from data: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd"
        guard let date = dateFormatter.date(from: data) else {
            return nil
        }
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: date).uppercased()
    }
}

struct WeatherRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRowView(data: "2023-08-31", icon: .clearDay, temp: "23")
    }
}


