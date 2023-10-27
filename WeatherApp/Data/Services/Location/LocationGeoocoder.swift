//
//  LocationGeoocoder.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 24/10/2023.
//

import CoreLocation

protocol LocationGeoocoderProtocol {
  func reverseGeocodeUserLocation() async throws -> City
}

class LocationGeoocoder: LocationGeoocoderProtocol {
  private var location: CLLocationCoordinate2D?
  private let locationManager: LocationManager
  private let geocoder = CLGeocoder()
  init(locationManager: LocationManager = LocationManager()) {
    self.locationManager = locationManager
  }

  func reverseGeocodeUserLocation() async throws -> City {
    let userLocation = try await locationManager.startObservingLocationChanges()

    let location = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
    let placemarks = try await geocoder.reverseGeocodeLocation(location)

    guard let placemark = placemarks.first, let city = placemark.locality,
      let country = placemark.country
    else { throw LocationError.locationServicesNotEnabled }
    let cityData = City(
      city: city, country: country, latitude: userLocation.latitude,
      longitude: userLocation.longitude)
    return cityData

  }
}
