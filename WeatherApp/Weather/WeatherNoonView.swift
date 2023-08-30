//
//  WeatherNoonView.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 30/08/2023.
//

import SwiftUI

struct WeatherNoonView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        
        VStack{
            
        }
    }
}




struct WeatherNoonView_Previews: PreviewProvider {
    static var previews: some View {
        let apiService = WeatherAPIService()
        let dataCache = WeatherDataCache(fileName: "weatherCache.json")
        let viewModel = WeatherViewModel(weatherAPIService: apiService, weatherDataCache: dataCache)
        
        return WeatherNoonView(viewModel: viewModel)
    }
}
