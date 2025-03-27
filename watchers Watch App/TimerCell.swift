//
//  TimerCell.swift
//  watchers Watch App
//
//  Created by Cameron Slaughter on 3/26/25.
//

import SwiftUI

struct TimerCell: View {
    var leftTimer: TimerModel
    var rightTimer: TimerModel
    
    var body: some View {
        NavigationStack{
            HStack {
                NavigationLink(
                    destination: TimerView(timerModel: leftTimer),
                    label: {
                        dialView(title: leftTimer.timeTitle, subtitle:
                                    leftTimer.unitTitle)
                    }
                ).buttonStyle(PlainButtonStyle())
                
                NavigationLink(
                    destination: TimerView(timerModel: rightTimer),
                    label: {
                        dialView(title: rightTimer.timeTitle, subtitle:
                                    rightTimer.unitTitle)
                    }
                ).buttonStyle(PlainButtonStyle())
            }.foregroundColor(Color.white.opacity(0.3))
                .frame(height: WKInterfaceDevice.current().screenBounds.height * 0.48)
        }
    }
    private func dialView(title: String, subtitle: String) -> some View {
        ZStack {
            Timers()
            VStack {
                Text(title)
                    .font(.system(size: 24))
                    .bold()
                    .foregroundColor(.orange)
                
                Text(subtitle)
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
        }   .padding()
            .background(Color.white.opacity(0.2))
            .clipShape(Circle())
    }
}

#Preview {
    TimerCell(leftTimer: TimerModel.allTimerValues()[0], rightTimer: TimerModel.allTimerValues()[1])
}
