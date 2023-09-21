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
    @StateObject var viewModel: WeatherViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundView(topColor: .blue, bottomColor: Color("LightBlue"))
                VStack {
                    CityTextView(cityName: "Paris, France")

                    MainWeatherStatusview(icon: WeatherIcon(rawValue: viewModel.icon) ?? .clearDay,
                                          temperature: viewModel.temp)

                    ForEach(viewModel.weatherDataUI, id: \.date) { item in
                        LazyHStack {
                            MainDayView(viewModel: MainDayViewModel(weatherItem: item))
                        }
                    }

                    .frame(height: 250)
                    Spacer()
                }
            }.task {
                await viewModel.fetchData()
            }
        }
    }
}

struct BackgroundView: View {

    var topColor: Color
    var bottomColor: Color

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

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
struct MainWeatherStatusview: View {
    var icon: WeatherIcon
    var temperature: Double

    var body: some View {
        VStack(spacing: 8 ) {
            Image(systemName: icon.systemImageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)

            Text("\(String(format: "%.0f", temperature))°")
                .font(.system(size: 70))
                .bold()
                .foregroundColor(.white)

        }
        .padding(.bottom, 40)
    }
}
