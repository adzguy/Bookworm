//
//  ContentView.swift
//  Bookworm
//
//  Created by Davron on 1/6/20.
//  Copyright © 2020 Davron. All rights reserved.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    var onColor = [Color.red, Color.blue]
    var offColor = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            self.isOn.toggle()
        }
        .padding()
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: isOn ? onColor : offColor), startPoint: .top, endPoint: .bottom))
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
        
    }
}
struct ContentView: View {
    
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "Push Button", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
