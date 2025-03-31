//
//  TimerView.swift
//  watchers Watch App
//
//  Created by Cameron Slaughter on 3/26/25.
//

import SwiftUI

struct TimerView: View {
    
    var timeRemaining: CGFloat
    private var colorTheme = Color.orange
    
    @State private var counter: CGFloat
    @Environment(\.presentationMode)  var presentationMode
    
    let timer = Timer.publish(every: 1, on: .main, in: .common) .autoconnect()
    
    private var formatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        return formatter
    }()
    
    private var formattedTime: String {
        return formatter.string(from: TimeInterval(counter))!
    }
    
    
    init(timerModel: TimerModel) {
        if timerModel.unit == .hr {
            self.timeRemaining = CGFloat(timerModel.timer * 60 * 60)
            
        } else {
            self.timeRemaining = CGFloat(timerModel.timer * 60)
        }
        _counter = State(initialValue: self.timeRemaining)
    }
    //the diffrent colors for the timers
    private var colorForRing: Color {
        let range = counter / timeRemaining
        if range >= 0.5 {
            return Color.green
        } else if  range > 0.25 && range <= 0.49 {
            return Color.orange
        }
        return Color.red
    }
    
    private var progressView: some View {
        Group {
            Circle()
                .stroke(colorTheme.opacity(0.2), style: StrokeStyle(lineWidth: 20, lineCap: .round))
            
            Circle()
                .trim(from: 0.0, to: CGFloat(( 1 - ((timeRemaining - counter) / timeRemaining))))
                .stroke(colorForRing, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .glow(color: colorTheme, radius: 2)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut)
        }
        .frame(width: WKInterfaceDevice.current() .screenBounds.width * 0.75, height: WKInterfaceDevice.current() .screenBounds.height * 0.75)
    }
    
    private var completedTimerView: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.black.opacity(0.7))
            .frame(width: WKInterfaceDevice.current().screenBounds.width, height: WKInterfaceDevice.current().screenBounds.height)
            .overlay(VStack {
                Text("Timer \nDone")
                    .font(.title)
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label : {
                    Text("Close")
                        .bold()
                }).background(RoundedRectangle(cornerRadius: 20).fill(colorTheme))
            })
    }
    
    var body: some View {
        ZStack {
            progressView
            
            Text(formattedTime)
                .font(.title2)
            
            if counter <= 0 {
                completedTimerView
            }
        }.onReceive(timer, perform : { _ in
            if counter > 0 {
                counter -= 1
            }
        })
        .padding()
    }
}

#Preview {
    TimerView(timerModel: TimerModel(timer: 15, unit: .min))
}
//event kit for calender
