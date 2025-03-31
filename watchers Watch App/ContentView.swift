//
//  ContentView.swift
//  watchers Watch App
//
//  Created by Cameron Slaughter on 3/20/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Let's Creat")
                    .bold()
                    .padding(.top, -21.0)
                Text("Main Menu")
                    .padding(.bottom, 10)
                
                NavigationLink("Start Timer", destination: TimeSelectionView())
                    .padding()
                    .frame(width: 155, height: 55)
                    .background(Color.darkPink)
                    .foregroundColor(.white)
                    .cornerRadius(23)
                    .bold()
                    .padding(.bottom, 5)
            }
            NavigationLink("Set Schedule", destination: SetSchedule())
                .padding()
                .frame(width: 155, height: 55)
                .background(Color.darkPink)
                .foregroundColor(.white)
                .cornerRadius(23)
                .bold()
                .padding(.bottom, -30)
        }
    }
}

#Preview {
    ContentView()
}
