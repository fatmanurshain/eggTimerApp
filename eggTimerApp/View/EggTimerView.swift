//
//  EggTimerView.swift
//  eggTimerApp
//
//  Created by Fatmanur Şahin on 18.09.2024.
//

import Foundation
import SwiftUI

struct EggTimerView: View {
    @ObservedObject var viewModel = EggTimerViewModel()
    @State private var showingAlert: Bool = false
    
    var body: some View {
        VStack {
            Text("Yumurta Pişirme Süresi: \(viewModel.timerText)")
                .font(.largeTitle)
                .padding()
            TabView(selection: $viewModel.eggType) {
                VStack {
                    Text("Rafadan")
                        .font(.largeTitle)
                    Image("egg_soft")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    CustomButton(title: AppString.start_button_title){
                        viewModel.startTimer(for: .soft)
                    }
                    .padding()
                    
                    HStack {
                        if viewModel.isRunning {
                            if viewModel.isPaused {
                                CustomButton(title: AppString.go_button_title, action: {
                                    if viewModel.isPaused {
                                        viewModel.resumeTimer()
                                    } else {
                                        viewModel.startTimer(for: .soft)
                                    }
                                })
                                .padding()
                            } else {
                                CustomButton(title: AppString.pause_button_title){
                                    if viewModel.isRunning {
                                        if viewModel.isPaused {
                                            viewModel.resumeTimer()
                                        } else {
                                            viewModel.pauseTimer()
                                        }
                                    }
                                }
                                .padding()
                            }
                        }
                    }
                }
                .tag(EggType.soft)
                
                VStack {
                    Text(AppString.medium_button_title)
                        .font(.largeTitle)
                    Image("egg_medium")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    CustomButton(title: AppString.start_button_title, action: {
                        viewModel.startTimer(for:.medium)
                    })
                    .padding()
                    
                    HStack {
                        if viewModel.isRunning {
                            if viewModel.isPaused {
                                CustomButton(title: AppString.go_button_title, action: {
                                    if viewModel.isPaused {
                                        viewModel.resumeTimer()
                                    } else {
                                        viewModel.startTimer(for: .soft)
                                    }
                                })
                                .padding()
                            } else {
                                CustomButton(title: AppString.pause_button_title){
                                    if viewModel.isRunning {
                                        if viewModel.isPaused {
                                            viewModel.resumeTimer()
                                        } else {
                                            viewModel.pauseTimer()
                                        }
                                    }
                                }
                                .padding()
                            }
                        }
                    }

                }
                .tag(EggType.medium)
                
                VStack {
                    Text(AppString.hard_button_title)
                        .font(.largeTitle)
                    Image("egg_hard")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .frame(width: 200, height: 200)
                    CustomButton(title: AppString.start_button_title){
                        viewModel.startTimer(for:.hard)
                    }
                    .padding()
                    
                    HStack {
                        if viewModel.isRunning {
                            if viewModel.isPaused {
                                CustomButton(title: AppString.go_button_title, action: {
                                    if viewModel.isPaused {
                                        viewModel.resumeTimer()
                                    } else {
                                        viewModel.startTimer(for: .soft)
                                    }
                                })
                                .padding()
                            } else {
                                CustomButton(title: AppString.pause_button_title){
                                    if viewModel.isRunning {
                                        if viewModel.isPaused {
                                            viewModel.resumeTimer()
                                        } else {
                                            viewModel.pauseTimer()
                                        }
                                    }
                                }
                                .padding()
                            }
                        }
                    }

                }
                .tag(EggType.hard)
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 500)
        }
    }
    }

func getEggImage(for eggType: EggType) -> String {
    switch eggType {
    case .soft:
        return "egg_soft"
    case .medium:
        return "egg_medium"
    case .hard:
        return "egg_hard"
    }
}

struct EggTimerView_Previews: PreviewProvider {
    static var previews: some View {
        EggTimerView()
    }
}
