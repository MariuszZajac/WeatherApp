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
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Paris")
                        .bold()
                        .font(.largeTitle)
                    
                    Text("\(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.bold)
                 
                    VStack{
                        VStack(alignment: .leading, spacing: 10) {
                            WeatherNoonView(viewModel: viewModel)
                            
                        }
                    }   .padding(10)
//
                }
               
            }
            
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


