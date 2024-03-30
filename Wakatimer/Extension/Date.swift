//
//  Datte.swift
//  Wakatimer
//
//  Created by Parikshith Palegar on 30/03/24.
//

import Foundation

extension Date {
    var apiRequestFormat:String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let today = dateFormatter.string(from: Date())
        
        return today
    }
}
