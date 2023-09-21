//
//  MainDayView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 07/09/2023.
//

import SwiftUI
struct MainDayView: View {
    var data: String
    var day: String
    var icon: WeatherIcon
    var temp: String

    init(data: String, icon: WeatherIcon, temp: String) {
        self.data = data
        self.icon = icon
        self.temp = temp
        self.day = "N/A"
        self.day = getDayOfWeek(from: data) ?? "N/A"
    }

    var body: some View {
        VStack(spacing: 5) {
            Text("\(data)")
            Text(day)
                .font(.subheadline)
                .foregroundColor(.white)
            Image(systemName: icon.systemImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text( "\(temp)°")
                .font(.system(size: 30))
                .bold()
                .foregroundColor(.primary)
        }

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
        MainDayView(data: "2023-08-31", icon: .clearDay, temp: "23")
    }
}
