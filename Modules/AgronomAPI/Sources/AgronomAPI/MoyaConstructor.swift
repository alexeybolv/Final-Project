//
//  MoyaConstructor.swift
//  
//
//  Created by Alexey Bolvonovich on 11.08.21.
//

import Foundation

import Moya

public enum MoyaAgronomManager {
    case getSprayers
}

extension MoyaAgronomManager: TargetType {

    public var baseURL: URL {
        return URL(string: "https://api.agronom.org") ?? URL(fileURLWithPath: "")
    }

    public var path: String {
        switch self {
        case .getSprayers:
            return "/data/sprayers"
        }
    }

    public var headers: [String : String]? {
        return nil
    }

    public var method: Moya.Method {
        switch self {
        case .getSprayers:
            return .get
        }
    }

    public var parameters: [String: Any]? {
        switch self {
        case .getSprayers:
            return nil
        }
    }

    public var task: Task {
        switch self {
        case .getSprayers:
            return .requestParameters(parameters: parameters ?? [:], encoding: URLEncoding.default)
        }
    }

    public var sampleData: Data {
        switch self {
        case .getSprayers:
            return MockService().data(mockKey: .sprayersList)
        }
    }
}

