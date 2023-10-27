//
//  WeatherDataCasheTest.swift
//  WeatherAppTests
//
//  Created by Mariusz Zając on 27/10/2023.
//

import Foundation
import XCTest

@testable import WeatherApp

class WeatherDataCasheTest: XCTestCase {
  let fileManager = FileManager()
  func testSaveData() {
    //Arrange

    let sut = WeatherDataCache(fileManager: fileManager)

    //act
    sut.saveWeatherData(.make(), fileName: "dataSafeTest.json")
    //assert
    let path = getFileUrlForName(name: "dataSafeTest.json")

    XCTAssertTrue(fileManager.fileExists(atPath: path!.path))
  }

  private func getFileUrlForName(name: String) -> URL? {
    if let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
      return documents.appendingPathComponent(name)
    } else {
      return nil
    }
  }
}
