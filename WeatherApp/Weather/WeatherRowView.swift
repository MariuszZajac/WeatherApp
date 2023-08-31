import SwiftUI
import Combine

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: logo)
                .font(.title2)
                .frame(width: 5 , height: 5)
                .padding()
                .background(Color.gray)
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(name)
                    .font(.caption)
                Text(value)
                    .bold()
                    .font(.headline)
                    
            }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "temp", value: "8°")
    }
}
