//
//  MoyaConstructor.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 24.07.21.
//

import Foundation

import Moya

public enum MoyaManager {
    case getWeather(latitude: Double, longitue: Double)
}

extension MoyaManager: TargetType {

    public var baseURL: URL {
        return URL(string: "https://api.openweathermap.org") ?? URL(fileURLWithPath: "")
    }

    public var path: String {
        switch self {
        case .getWeather:
            return "/data/2.5/onecall"
        }
    }

    public var headers: [String : String]? {
        return nil
    }

    public var method: Moya.Method {
        switch self {
        case .getWeather:
            return .get
        }
    }

    public var parameters: [String: Any]? {
        switch self {
        case .getWeather:
            return [:]
        }
    }

    public var task: Task {
        switch self {
        case .getWeather:
            return .requestParameters(parameters: parameters ?? [:], encoding: URLEncoding.default)
        }
    }

    public var sampleData: Data {
        switch self {
        case .getWeather:
            return Data()
        }
    }
}
