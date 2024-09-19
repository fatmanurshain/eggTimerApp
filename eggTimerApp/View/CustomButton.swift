//
//  CustomButton.swift
//  eggTimerApp
//
//  Created by Fatmanur Şahin on 19.09.2024.
//

import Foundation
import SwiftUICore
import SwiftUI

struct CustomButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
        }
    }
}
