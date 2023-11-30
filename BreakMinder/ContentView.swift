//
//  ContentView.swift
//  BreakMinder
//
//  Created by Bora Mert on 23.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var hour = 0
    @State private var minute = 0
    @State private var second = 1

    @State private var targetHour = 0
    @State private var targetMinute = 0
    @State private var targetSecond = 1

    @State private var timer: Timer?
    @State private var timerStarted = false
    @State private var showAlert = false

    var body: some View {
        VStack {
            Text("Break Reminder").font(.largeTitle).padding()
            Spacer()            
                if (!timerStarted) {
                    TimePicker(hour: $hour, minute: $minute, second: $second)
                        .transition(.scale)
                } else {
                    CountdownView(hour: $hour, minute: $minute, second: $second,
                                  targetHour: $targetHour, targetMinute: $targetMinute, targetSecond: $targetSecond)
                        .transition(.scale)
                }
            Spacer()
            
            HStack {
                Button(action: startTimer) {
                    ZStack {
                        Circle()
                            .frame(width: 80)
                            .foregroundColor(timerStarted ? .gray : .green)
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .padding(.leading, 6)
                    }
                }
                .padding(.trailing,20)
                .disabled(timerStarted)
                
                Button(action: stopTimer) {
                    ZStack {
                        Circle()
                            .frame(width: 80)
                            .foregroundColor(timerStarted ? .red : .gray)
                        Image(systemName: "stop.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    }
                }
                .padding(.leading,20)
                .disabled(!timerStarted)
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Timer Ended"), message: Text("Your break time is over."), dismissButton: .default(Text("OK")))
        }
    }

    func startTimer() {
        targetHour = hour
        targetMinute = minute
        targetSecond = second

        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            print("target: \(targetHour):\(targetMinute):\(targetSecond)")
            print("remaining: \(hour):\(minute):\(second)")
            if second > 0 {
                second -= 1
            } else {
                if minute > 0 {
                    minute -= 1
                    second = 59
                } else {
                    if hour > 0 {
                        hour -= 1
                        minute = 59
                        second = 59
                    } else {
                        // Timer reached zero, show alert
                        stopTimer()
                        showAlert = true
                    }
                }
            }
        }

        withAnimation {
            timerStarted = true
        }
    }

    func stopTimer() {
        if(timerStarted){
            timer?.invalidate()
            timer = nil

            withAnimation {
                timerStarted = false
                hour = targetHour
                minute = targetMinute
                second = targetSecond
            }
        }
    }
}

#Preview {
    ContentView()
}
