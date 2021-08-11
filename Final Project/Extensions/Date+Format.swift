//
//  Date+Format.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 11.08.21.
//

import Foundation

extension Date {
    func formatToString(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let locale = Calendar.current.locale
        formatter.locale = locale

        return formatter.string(from: self)
    }
}
