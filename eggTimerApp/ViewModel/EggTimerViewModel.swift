//
//  EggTimerViewModel.swift
//  eggTimerApp
//
//  Created by Fatmanur Şahin on 18.09.2024.
//

import Foundation

// EggTimerViewModel.swift
import SwiftUI

class EggTimerViewModel: ObservableObject {
    @Published var progress: Double = 0.0
    @Published var timerText: String = "00:00"
    @Published var eggType: EggType = .soft
    @Published var isPaused: Bool = false
    @Published var isRunning: Bool = false
    

    private var totalDuration: Int = 0
    private var currentTime: Int = 0
    private var timer: Timer?

    func startTimer(for eggType: EggType) {
        
        self.isPaused = false
        self.isRunning = true
        self.eggType = eggType
        
        totalDuration = eggType == .soft ? 300 : eggType == .medium ? 420 : 600 // Rafadan: 5 dk, Orta: 7 dk, Pişmiş: 10 dk
        totalDuration = eggType.totalTime
        currentTime = totalDuration
        progress = 0.0
        timerText = timeString(time: TimeInterval(totalDuration))
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.totalDuration > 0 {
                self.totalDuration -= 1
                self.progress = Double(1 - Double(self.totalDuration) / Double(self.eggType.totalTime))
                self.timerText = self.timeString(time: TimeInterval(self.totalDuration))
            } else {
                self.timer?.invalidate()
            }
        }
        runTimer()
    }
    private func runTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.currentTime > 0 && !self.isPaused {
                self.currentTime -= 1
                self.progress = Double(self.totalDuration - self.currentTime) / Double(self.totalDuration)
                self.timerText = self.timeString(time: TimeInterval(self.currentTime))
            } else {
                self.timer?.invalidate()
                self.isRunning = false
            }
        }
    }

    func pauseTimer() {
        isPaused = true
        timer?.invalidate() // Zamanlayıcıyı durdur
    }

    func resumeTimer() {
        isPaused = false
        runTimer() // Kaldığı yerden devam et
    }

    private func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
}
