//
//  CountdownView.swift
//  BreakMinder
//
//  Created by Bora Mert on 30.11.2023.
//

import SwiftUI

struct CountdownView: View {
    @Binding var hour: Int
    @Binding var minute: Int
    @Binding var second: Int
    
    @Binding var targetHour : Int
    @Binding var targetMinute : Int
    @Binding var targetSecond : Int

    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: calculateProgress())
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.purple) // Set the color of the progress bar
                .rotationEffect(Angle(degrees: -90)) // Start from the top
                .frame(width: 350)

            HStack {
                // Display remaining time in the same format as hours, minutes, and seconds
                Text("\(getTimeString(t: remainingHours))")
                    .font(.title)
                Text(":")
                    .padding(10)
                    .font(.title)

                Text("\(getTimeString(t: remainingMinutes))")
                    .font(.title)
                Text(":")
                    .padding(10)
                    .font(.title)

                Text("\(getTimeString(t: remainingSeconds))")
                    .font(.title)
            }
        }
    }

    private func calculateProgress() -> CGFloat {
            let totalSeconds = targetHour * 3600 + targetMinute * 60 + targetSecond
            let remainingSeconds = max(hour * 3600 + minute * 60 + second, 0)
            return CGFloat(remainingSeconds) / CGFloat(totalSeconds)
        }

        func getTimeString(t: Int) -> String {
            return t < 10 ? "0\(t)" : String(t)
        }

        private var remainingHours: Int {
            return hour
        }

        private var remainingMinutes: Int {
            return minute
        }

        private var remainingSeconds: Int {
            return second
        }
}

#Preview {
    CountdownView(hour: .constant(1), minute: .constant(0), second: .constant(1),
                  targetHour: .constant(10), targetMinute: .constant(0), targetSecond: .constant(1))
}
