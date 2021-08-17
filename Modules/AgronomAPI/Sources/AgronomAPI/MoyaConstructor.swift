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
    case getNozzles
}

extension MoyaAgronomManager: TargetType {

    public var baseURL: URL {
        return URL(string: "https://api.agronom.org") ?? URL(fileURLWithPath: "")
    }

    public var path: String {
        switch self {
        case .getSprayers:
            return "/data/sprayers"
        case .getNozzles:
            return "/data/nozzles"
        }
    }

    public var headers: [String : String]? {
        return nil
    }

    public var method: Moya.Method {
        switch self {
        case .getSprayers, .getNozzles:
            return .get
        }
    }

    public var parameters: [String: Any]? {
        switch self {
        case .getSprayers, .getNozzles:
            return nil
        }
    }

    public var task: Task {
        switch self {
        case .getSprayers, .getNozzles:
            return .requestParameters(parameters: parameters ?? [:], encoding: URLEncoding.default)
        }
    }

    public var sampleData: Data {
        switch self {
        case .getSprayers:
            return MockService().data(mockKey: .sprayersList)
        case .getNozzles:
            return MockService().data(mockKey: .nozzlesList)
        }
    }
}

