//
//  DateConv.swift
//  App364
//
//  Created by Вячеслав on 2/26/24.
//

import SwiftUI

extension Date {
    
    func convertDate(format: String) -> String {
        
        let date = self
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
}
