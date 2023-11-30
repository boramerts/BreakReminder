//
//  TimePicker.swift
//  BreakMinder
//
//  Created by Bora Mert on 23.11.2023.
//

import SwiftUI

struct TimePicker: View {
    @Binding var hour : Int
    @Binding var minute : Int
    @Binding var second : Int
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "chevron.up")
                    .resizable()
                    .frame(width: 30, height: 20)
                    .padding(.bottom,5)
                    .onTapGesture {
                        if hour < 23 {
                            hour = hour+1
                        }
                    }
                
                Text("\(getTimeString(t:hour))")
                    .font(.title)
                    .minimumScaleFactor(0.01)
                
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 30, height: 20)
                    .padding(.top,5)
                    .opacity(hour>0 ? 1.0:0.2)
                    .onTapGesture {
                        if hour>0 {
                            hour = hour-1
                        }
                    }
            }
            Text(":")
                .padding(10)
                .font(.title)
            VStack {
                Image(systemName: "chevron.up")
                    .resizable()
                    .frame(width: 30, height: 20)
                    .padding(.bottom,5)
                    .onTapGesture {
                        if minute < 59 {
                            minute = minute+1
                        }
                    }
                
                Text("\(getTimeString(t:minute))")
                    .font(.title)
                    .minimumScaleFactor(0.01)
                
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 30, height: 20)
                    .padding(.top,5)
                    .opacity(minute>0 ? 1.0:0.2)
                    .onTapGesture {
                        if minute>0 {
                            minute = minute-1
                        }
                    }
            }
            Text(":")
                .padding(10)
                .font(.title)
            VStack {
                Image(systemName: "chevron.up")
                    .resizable()
                    .frame(width: 30, height: 20)
                    .padding(.bottom,5)
                    .onTapGesture {
                        if second < 59 {
                            second = second+1
                        }
                    }
                
                Text("\(getTimeString(t:second))")
                    .font(.title)
                    .minimumScaleFactor(0.01)
                
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: 30, height: 20)
                    .padding(.top,5)
                    .opacity(second>1 ? 1.0:0.2)
                    .onTapGesture {
                        if second>0 {
                            second = second-1
                        }
                    }
            }
        }
    }
    
    func getTimeString(t:Int) -> String {
        if t<10 {
            return "0\(t)"
        } else {
            return String(t)
        }
    }
}

#Preview {
    TimePicker(hour: .constant(0), minute: .constant(0), second: .constant(1))
}
