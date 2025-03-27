//
//  TimeSelectionView.swift
//  watchers Watch App
//
//  Created by Cameron Slaughter on 3/26/25.
//

import SwiftUI

struct TimeSelectionView: View {
    
    private let timer = TimerModel.allTimerValues()

    
    var body: some View {
        NavigationStack {
            ScrollView {
                TimerCell(leftTimer: timer[0], rightTimer: timer[1])
                TimerCell(leftTimer: timer[2], rightTimer: timer[3])
            }.navigationTitle("Timer")
        }
    }
}

#Preview {
    TimeSelectionView()
}
