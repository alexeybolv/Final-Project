//
//  Nozzle.swift
//  
//
//  Created by Alexey Bolvonovich on 17.08.21.
//

import Foundation

public class Nozzle: Codable {

    public let id: Int
    public let sprayerId: Int
    public let name: String
    public let minSpeed: Double
    public let maxSpeed: Double
    public let consumption: Double
}
