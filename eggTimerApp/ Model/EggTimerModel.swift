//
//  EggTimerModel.swift
//  eggTimerApp
//
//  Created by Fatmanur Şahin on 18.09.2024.
//

import Foundation

struct EggTimerModel {
    let totalDuration: Int // Pişme süresi
    let eggType: EggType   // Yumurtanın tipi 
}

enum EggType {
    case soft
    case medium
    case hard
    
    var totalTime: Int {
        switch self {
        case .soft: return 10
        case .medium: return 15
        case .hard: return 20
        }
    }
}

