import SwiftUI
import Combine

struct WeatherRowView: View {
    @ObservedObject var viewModel: WeatherViewModel
    @State private var isErrorShown: Bool = false
    
    var body: some View {
        NavigationView {
            List(viewModel.weatherData.value, id: \.dt) { weatherData in
                VStack(alignment: .leading) {
                    Text("Czas: \(weatherData.dt_txt)")
                    Text("Temperatura: \(weatherData.main.temp)°C")
                    Text("Odczuwalna temperatura: \(weatherData.main.feels_like)°C")
                    Text("Ciśnienie: \(weatherData.main.pressure) hPa")
                    Text("Wilgotność: \(weatherData.main.humidity)%")
                    Text("Wiatr: \(weatherData.wind.speed) m/s")
                }
            }
            .navigationBarTitle("Pogoda", displayMode: .inline)
           
            .alert(isPresented: $isErrorShown) {
                Alert(title: Text("Błąd"),
                      message: Text(viewModel.error?.localizedDescription ?? "Nieznany błąd"),
                      dismissButton: .default(Text("OK")))
            }
        }
        .onAppear {
            // Możesz tutaj wywołać funkcję fetchWeatherData, jeśli nie chcesz, aby była ona wywoływana w inicie viewModelu
            // viewModel.fetchWeatherData(latitude: 51.509865, longitude: -0.118092)
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
