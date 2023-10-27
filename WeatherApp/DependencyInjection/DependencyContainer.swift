//
//  DependencyContainer.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 18/10/2023.
//

import Foundation

protocol DependencyContainerProtocol {
  var locationManager: LocationManager { get }
  var apiService: WeatherAPIServiceProtocol { get }
  var dataCache: WeatherDataCache { get }
}
class DependencyContainer: DependencyContainerProtocol {
  lazy var locationManager = LocationManager()
  lazy var apiService: WeatherAPIServiceProtocol = WeatherAPIService()
  lazy var dataCache = WeatherDataCache()

}
// "weatherCache.json"
