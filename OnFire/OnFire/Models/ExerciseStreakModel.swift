//
//  ExerciseStreakModel.swift
//  OnFire
//
//  Created by Amy King on 28/01/24.
//

import Foundation

struct ExerciseStreak: Codable {
    var streakCount: Int
    var lastExerciseDate: Date

    init(streakCount: Int, lastExerciseDate: Date) {
        self.streakCount = streakCount
        self.lastExerciseDate = lastExerciseDate
    }
}

class ExerciseStreakDataManager: ObservableObject {
    static let shared = ExerciseStreakDataManager()
    private let userDefaults = UserDefaults.standard
    private let exerciseStreakKey = "ExerciseStreak"
    
    var currentExerciseStreak: ExerciseStreak {
        get {
            // Attempt to retrieve dat from UserDefaults
            if let data = userDefaults.data(forKey: exerciseStreakKey),
               let decodedStreak = try? JSONDecoder().decode(ExerciseStreak.self, from:data) {
                return decodedStreak
            } else {
                return ExerciseStreak(streakCount: 0, lastExerciseDate: Date())
            }
        }
        set {
            if let encodedData = try? JSONEncoder().encode(newValue) {
                userDefaults.set(encodedData, forKey: exerciseStreakKey)
            }
        }
    }
}
