import SwiftUI
import Combine

struct WeatherRowView: View {
    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.weatherDataUI, id: \.dt) { weatherData in
                
                VStack(alignment: .leading) {
                    Text("Czas: \(weatherData.dt_txt)")
                    Text("Temperatura: \(String(format: "%.1f", weatherData.main.temp))°C")
                    Text("Odczuwalna temperatura: \(String(format: "%.1f", weatherData.main.feels_like))°C")

                    Text("Ciśnienie: \(weatherData.main.pressure) hPa")
                    Text("Wilgotność: \(weatherData.main.humidity)%")
                    Text("Wiatr: \(String(format: "%.1f", weatherData.wind.speed)) m/s")
                }
            }
            .navigationBarTitle("Pogoda", displayMode: .inline)

        }
    }
}
struct WeatherRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRowView(viewModel: WeatherViewModel(
            weatherAPIService: WeatherAPIService(),
            weatherDataCache:  WeatherDataCache(fileName:"FileName")))
    }
}

