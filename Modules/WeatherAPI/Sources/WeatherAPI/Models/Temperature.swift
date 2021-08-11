//
//  Temperature.swift
//  
//
//  Created by Alexey Bolvonovich on 10.08.21.
//

import Foundation

public class Temperature: Decodable {

    public let day: Double
    public let night: Double
    public let min: Double
    public let max: Double
}
