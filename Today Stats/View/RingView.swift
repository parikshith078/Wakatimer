    //
    //  RingView.swift
    //  Wakatimer
    //
    //  Created by Parikshith Palegar on 29/03/24.
    //

import SwiftUI

struct RingView: View {
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            ZStack {
                Circle()
                    .stroke(.white.opacity(0.1), lineWidth: 20)
                let fillRatio = Double(10) / 50.0
                Circle()
                    .trim(from: 0, to: fillRatio)
                    .stroke(.blue, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.degrees(-90))
            }
            .padding(30)
            VStack {
                Text("Coding time")
                    .bold()
                Text("2h 50m")
                    .font(.system(size: 50))
            }
            .foregroundStyle(.white)
            .fontDesign(.rounded)
        }
        
    }
}

#Preview {
    RingView()
}
