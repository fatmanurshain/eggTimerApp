//
//  TimerService.swift
//  eggTimerApp
//
//  Created by Fatmanur Şahin on 18.09.2024.
//

import Foundation

class TimerService {
    var timer: Timer?

    func startTimer(with duration: TimeInterval, completion: @escaping (TimeInterval) -> Void) {
        timer?.invalidate()
        var timeLeft = duration
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeLeft > 0 {
                timeLeft -= 1
                completion(timeLeft)
            } else {
                self.timer?.invalidate()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
    }
}
