    //
    //  Dashboard.swift
    //  Wakatimer
    //
    //  Created by Parikshith Palegar on 29/03/24.
    //

import SwiftUI
import SwiftData

struct Dashboard: View {
    @Environment(\.modelContext) var modelContext
    @AppStorage("API_KEY") var apiKey = ""
    @Query var apiData: [WakatimeApiData]
    @State var currentDayData: WakatimeApiData? = nil
    
    func getCurrentDayData(data: [WakatimeApiData]) -> WakatimeApiData {
        for obj in data {
            if obj.day.onlyDate! == Date().onlyDate! {
//                print("Got old data")
//                print("Data length \(apiData.count)")
                return obj
            }
        }
        let newData = WakatimeApiData()
        modelContext.insert(newData)
//        print("New data created")
//        print("Data length \(apiData.count)")
        return newData
    }

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
                Text("Today")
                    .bold()
                Text("2h 50m")
                    .font(.system(size: 50))
                
                List {
                    ForEach(apiData) { item in
                        Text(item.day.customFormatedDate)
                            .foregroundStyle(.black)
                    }
                }
            }
            .foregroundStyle(.white)
            .fontDesign(.rounded)
        }
        .onAppear {
            currentDayData = getCurrentDayData(data: apiData)
            Task {
//                currentDayData?.heartbeats = try await 
            }
        }
    }
    
}

#Preview {
    ContentView()
}
