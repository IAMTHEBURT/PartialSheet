//
//  BlurredSheetExample.swift
//  PartialSheetExample
//
//  Created by Rasmus Styrk on 14/08/2020.
//  Copyright © 2020 Swift. All rights reserved.
//

import SwiftUI
import PartialSheet

struct BlurredExample: View {
    @State var isSheetPresented = false
    let iPhoneStyle = PSIphoneStyle(
        //background: .blur(.ultraThin),
        background: .solid(.secondary),
        handleBarStyle: .solid(.secondary),
        cover: .enabled(Color.black.opacity(0.4)),
        cornerRadius: 10
    )

    var body: some View {
        VStack {
            Spacer()
            PSButton(
                isPresenting: $isSheetPresented,
                label: {
                    Text("Display the BlurredExample Sheet")
                })
                .padding()
            Spacer()
            HStack {
                Rectangle().foregroundColor(Color.blue).frame(width: 75, height: 75)
                Rectangle().foregroundColor(Color.green).frame(width: 75, height: 75)
                Rectangle().foregroundColor(Color.red).frame(width: 75, height: 75)
                Rectangle().foregroundColor(Color.yellow).frame(width: 75, height: 75)
            }
        }
        .navigationBarTitle("Blurred Example")
        .partialSheet(isPresented: $isSheetPresented,
                      type: .scrollView(height: 300, showsIndicators: false),
                      iPhoneStyle: iPhoneStyle,
                      content: BlurredSheetView.init)
    }
}

struct BlurredExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BlurredExample()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .attachPartialSheetToRoot()

    }
}

struct BlurredSheetView: View {
    @State private var selectedStrength = 0

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Settings Panel").font(.headline).foregroundColor(Color.primary)
            Group {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum porttitor ligula quis faucibus. Maecenas auctor tincidunt maximus. Donec lectus dui, fermentum sed orci gravida, porttitor porta dui. Fusce ut diam et diam venenatis molestie vel vel augue. Mauris at mauris porta, auctor lorem et, efficitur lacus.")
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vestibulum porttitor ligula quis faucibus. Maecenas auctor tincidunt maximus. Donec lectus dui, fermentum sed orci gravida, porttitor porta dui. Fusce ut diam et diam venenatis molestie vel vel augue. Mauris at mauris porta, auctor lorem et, efficitur lacus.")
            }
            .font(.subheadline).foregroundColor(Color.primary)
        }
        .padding()
    }
}
