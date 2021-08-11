//
//  MockService.swift
//  
//
//  Created by Alexey Bolvonovich on 12.08.21.
//

import Foundation

struct MockService {

    enum MockKeys: String {
        case sprayersList = "SprayersList"
    }

    func data(mockKey: MockKeys) -> Data {
        guard let url = Bundle.module.url(forResource: mockKey.rawValue, withExtension: "json"), let data = try? Data(contentsOf: url) else { return Data() }
        return data
    }
}

