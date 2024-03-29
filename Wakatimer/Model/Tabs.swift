//
//  Tabs.swift
//  Wakatimer
//
//  Created by Parikshith Palegar on 29/03/24.
//

import SwiftUI

enum Tab: String {
    case dashboard = "Dashboard"
    case settings = "Settings"
    
    @ViewBuilder
    
    var tabContent: some View {
        switch self {
            case .dashboard:
                Image(systemName: "chart.bar.xaxis")
                Text(self.rawValue)
            case .settings:
                Image(systemName: "gearshape")
                Text(self.rawValue)
        }
    }
    
}
