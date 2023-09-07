//
//  MyCustomViews.swift
//  WeatherApp
//
//  Created by Mariusz Zając on 06/09/2023.
//

import SwiftUI

struct MyCustomViews<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            content
            Spacer()
        }
    }
}
struct MyCustomViews_Previews: PreviewProvider {
    static var previews: some View {
        MyCustomViews {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}
