//
//  View+Glow.swift
//  watchers Watch App
//
//  Created by Cameron Slaughter on 3/26/25.
//

import SwiftUI

//color of the timer bars
extension View {
    func glow(color: Color = .red, radius: CGFloat = 10) -> some View {
        self
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
            .shadow(color: color, radius: radius / 3)
    }
}
