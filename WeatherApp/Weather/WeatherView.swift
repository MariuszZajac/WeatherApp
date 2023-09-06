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
    @ObservedObject var viewModel: WeatherViewModel
    // @ObservedObject var city: CityViewModel
    var body: some View {
        NavigationView {
            MyCustomViews {
                Text("Paris")
                    .bold()
                    .font(.largeTitle)
                Text("\(Date().formatted(.dateTime.month().day().hour().minute()))")
                    .fontWeight(.bold)
                WeatherNoonView(viewModel: viewModel)
                    .frame(height: 250)
            }
            .padding()
        }
    }
}
struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        let apiService = WeatherAPIService()
        let dataCache = WeatherDataCache(fileName: "weatherCache.json")
        let viewModel = WeatherViewModel(weatherAPIService: apiService, weatherDataCache: dataCache)
        return WeatherView(viewModel: viewModel)
    }
}
