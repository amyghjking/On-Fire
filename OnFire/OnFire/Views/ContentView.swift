//
//  ContentView.swift
//  OnFire
//
//  Created by Amy King on 28/01/24.
//

import SwiftUI

struct ContentView: View {
    let incendioRed = Color(red: 174.0/255.0, green: 24.0/255.0, blue: 10.0/255.0)
    @ObservedObject var exerciseDataManager = ExerciseStreakDataManager.shared
    
    var body: some View {
        
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
                    Text("\(exerciseDataManager.currentExerciseStreak.streakCount)")
                        .font(.title)
                        .fontWeight(.bold)
                        .offset(y: -geometry.size.height * 0.04)
                        .onAppear {
                            // Make sure to manually trigger a refresh when the view appears
                            exerciseDataManager.objectWillChange.send()
                        }
                    
                    Spacer()
                    
                    // Add to streak
                    Button("Incendio") {
                        var newStreak = exerciseDataManager.currentExerciseStreak
                        newStreak.streakCount += 1
                        newStreak.lastExerciseDate = Date() // Update the date to the current date
                        exerciseDataManager.currentExerciseStreak = newStreak
                        
                        // Manually trigger a refresh after updating the streak count
                        exerciseDataManager.objectWillChange.send()
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
