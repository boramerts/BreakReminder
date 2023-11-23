//
//  ContentView.swift
//  BreakMinder
//
//  Created by Bora Mert on 23.11.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Break Reminder").font(.largeTitle).padding()
            Spacer()
            TimePicker()
            Spacer()
            HStack {
                Button(action: startTimer) {
                    ZStack {
                        Circle()
                            .frame(width: 80)
                            .foregroundColor(.green)
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                            .padding(.leading, 6)
                    }
                }.padding(.trailing,20)
                Button(action: stopTimer) {
                    ZStack {
                        Circle()
                            .frame(width: 80)
                            .foregroundColor(.red)
                        Image(systemName: "stop.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.white)
                    }
                }.padding(.leading,20)
            }
        }
        .padding()
    }
    
    func startTimer() {
        print("Timer started")
    }
    func stopTimer() {
        print("Timer stopped")
    }
}

#Preview {
    ContentView()
}
