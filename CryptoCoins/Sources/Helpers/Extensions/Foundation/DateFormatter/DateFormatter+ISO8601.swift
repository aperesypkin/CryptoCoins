//
//  DateFormatter+ISO8601.swift
//  Debug
//
//  Created by Alexander Peresypkin on 30/12/2018.
//  Copyright © 2018 Alexander Peresypkin. All rights reserved.
//

import Foundation

extension DateFormatter {
    static var iso8601Full: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        //formatter.timeZone = TimeZone(secondsFromGMT: 0)
        //formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }
}
