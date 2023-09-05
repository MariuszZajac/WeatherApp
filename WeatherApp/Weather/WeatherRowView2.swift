//
//  WeatherRoWView2.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 31/08/2023.
//

import SwiftUI

struct WeatherRowView2: View {
    var day: String
    var icon: String
    var temp: String
    init(icon: String, fullDate: String, temp: String) {
        self.icon = icon
        self.temp = temp
        self.day = "N/A"
        self.day = getDayOfWeek(from: fullDate) ?? "N/A"
    }

    var body: some View {
        VStack(spacing: 5) {
            Text("\(Date().formatted(.dateTime.month().day()))")
                .fontWeight(.bold)
            Text("\(day)")
                .font(.caption)
            Image(systemName: icon)
                .font(.title2)
                .frame(width: 5, height: 5)
                .padding()
            Text("\(temp)°")
                .bold()
                .font(.headline)
        }
        .frame(width: 40, height: 100)
        .foregroundColor(Color.black)
    }
    func getDayOfWeek(from fullDate: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: fullDate) else {
            return nil
        }
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: date).uppercased()
    }

}

struct WeatherRoWView2_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRowView2(icon: "cloud.sun.fill", fullDate: "2021-01-10", temp: "23")
    }
}
