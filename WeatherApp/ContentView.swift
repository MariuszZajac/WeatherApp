//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 28/08/2023.
//

import SwiftUI

struct ContentView: View {
    let viewModel: WeatherViewModel
    
    init() {
        let apiService = WeatherAPIService()
        let dataCache = WeatherDataCache(fileName: "weatherCache.json")
        self.viewModel = WeatherViewModel(weatherAPIService: apiService, weatherDataCache: dataCache)
    }

    var body: some View {
        VStack {
            WeatherRowView(viewModel: viewModel)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
