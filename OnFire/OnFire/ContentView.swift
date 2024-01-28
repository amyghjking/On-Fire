//
//  ContentView.swift
//  OnFire
//
//  Created by Amy King on 28/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let incendioRed = Color(red: 174.0/255.0, green: 24.0/255.0, blue: 10.0/255.0)
        
        GeometryReader { geometry in
            ZStack {
                // Background image
                Image("GreyFireStand")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(0.7)
                    .offset(y: geometry.size.height * 0.1)
                VStack {
                    
                    Spacer()
                    
                    // Number streak
                    Text("0")
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(y: -geometry.size.height * 0.04)
                    
                    Spacer()
                    
                    // Add to streak
                    Button("Incendio") {
                        // Do some stuff when button is pressed
                    }
                    .foregroundColor(incendioRed)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
