//
//  Timer.swift
//  watchers Watch App
//
//  Created by Cameron Slaughter on 3/26/25.
//

import SwiftUI

struct Timers: View {
    
    func tick(at tick: Int) -> some View {
        VStack {
            Rectangle()
                .fill(Color.primary)
                .opacity(tick % 5 == 0 ? 1: 0.4)
                .frame(width: tick % 5 == 0 ? 1 : 0.5, height: tick % 5 == 0 ? 7 : 5)
            
            Spacer()
        }.rotationEffect(Angle.degrees((Double(tick)/60) * 360))
    }
    
    var body: some View {
        ZStack {
            ForEach(0..<60) { tick in
                self.tick(at: tick)
            }
            GeometryReader { geo in
                ZStack {
                    EmptyView()
                    
                } .frame(width: geo.size.width - 40, height: geo.size.height - 30, alignment: .center)
            }
        }
    }
}

#Preview {
    Timers()
}
