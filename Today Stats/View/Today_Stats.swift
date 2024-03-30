    //
    //  Today_Stats.swift
    //  Today Stats
    //
    //  Created by Parikshith Palegar on 29/03/24.
    //

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    var data = DataService()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), todayStats: data.getStatus())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), todayStats: data.getStatus())
        completion(entry)
    }
    
    // TODO: Edit time line
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
            // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, todayStats: data.getStatus())
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let todayStats: String
}

struct Today_StatsEntryView : View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            ZStack {
                Circle()
                    .stroke(.white.opacity(0.1), lineWidth: 15)
                let fillRatio = Double(10) / 50.0
                Circle()
                    .trim(from: 0, to: fillRatio)
                    .stroke(.blue, style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                    .rotationEffect(.degrees(-90))
            }
            .padding()
            VStack {
                Text("Today")
                    .bold()
                Text(entry.todayStats)
                    .font(.system(size: 20))
            }
            .foregroundStyle(.white)
            .fontDesign(.rounded)
        }
        
    }
}

struct Today_Stats: Widget {
    let kind: String = "Today_Stats"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                Today_StatsEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                Today_StatsEntryView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Today stats")
        .description("Show total time spent coding today.")
        .supportedFamilies([.systemSmall])
        .contentMarginsDisabled()
    }
}

#Preview(as: .systemSmall) {
    Today_Stats()
} timeline: {
    SimpleEntry(date: .now, todayStats: DataService().getStatus())
//    SimpleEntry(date: .now, emoji: "🤩")
}
