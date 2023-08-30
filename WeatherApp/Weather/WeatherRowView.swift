import SwiftUI
import Combine

struct WeatherRowView: View {
    @ObservedObject var viewModel: WeatherViewModel
    var body: some View {
        NavigationView {
            List(viewModel.weatherDataUI, id: \.dt) { weatherData in
                
                let groupedData = viewModel.weatherDataUI.groupByDay()
                
                VStack(alignment: .leading) {
                    Text("Czas: \(weatherData.dt_txt)")
                    Text("Temperatura: \(weatherData.main.temp.roundDouble())°C")
                    Text("Odczuwalna temperatura: \(weatherData.main.feels_like.roundDouble())°C")

                    Text("Ciśnienie: \(weatherData.main.pressure) hPa")
                    Text("Wilgotność: \(weatherData.main.humidity)%")
                    Text("Wiatr: \(weatherData.wind.speed.roundDouble()) m/s")
                }
            }
            .navigationBarTitle("Pogoda", displayMode: .inline)
            
        }
//        .onAppear{
//            print("Debug:\(viewModel.weatherDataUI)")
//        }
    }
}
struct WeatherRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRowView(viewModel: WeatherViewModel(
            weatherAPIService: WeatherAPIService(),
            weatherDataCache:  WeatherDataCache(fileName:"FileName")))
    }
}

