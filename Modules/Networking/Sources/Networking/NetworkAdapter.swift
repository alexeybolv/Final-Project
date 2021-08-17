//
//  NetworkAdapter.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 24.07.21.
//

import Foundation

import Moya
import AgronomAPI
import WeatherAPI

public struct NetworkAdapter {

    public static var provider: MoyaProvider<MoyaWeatherManager> {
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil {
            #if DEBUG
            let plugins: [PluginType] = [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter),logOptions: .verbose))]
            #else
            let plugins: [PluginType] = []
            #endif
            return MoyaProvider<MoyaWeatherManager>(plugins:plugins)
        } else {
            return MoyaProvider<MoyaWeatherManager>(stubClosure: MoyaProvider.immediatelyStub)
        }
    }

    public static func request(target: MoyaWeatherManager, success successCallback: @escaping (Response) -> Void, error errorCallback: @escaping (Swift.Error) -> Void, failure failureCallback: @escaping (String) -> Void) {

        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    successCallback(response)
                } else {
                    let error = NSError(domain:"com.vsemenchenko.networkLayer", code:0, userInfo:[NSLocalizedDescriptionKey: "Parsing Error"])
                    errorCallback(error)
                }
            case .failure(let error):
                failureCallback(error.localizedDescription)
            }
        }
    }

    // MARK: - Mock

    public static var mockProvider: MoyaProvider<MoyaAgronomManager> {
        return MoyaProvider<MoyaAgronomManager>(stubClosure: MoyaProvider.immediatelyStub, plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter),logOptions: .verbose))])
    }

    public static func mockRequest(target: MoyaAgronomManager, success successCallback: @escaping (Response) -> Void, error errorCallback: @escaping (Swift.Error) -> Void, failure failureCallback: @escaping (String) -> Void) {

        mockProvider.request(target) { (result) in
            switch result {
            case .success(let response):
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    successCallback(response)
                } else {
                    let error = NSError(domain:"com.vsemenchenko.networkLayer", code:0, userInfo:[NSLocalizedDescriptionKey: "Parsing Error"])
                    errorCallback(error)
                }
            case .failure(let error):
                failureCallback(error.localizedDescription)
            }
        }
    }
}

private func JSONResponseDataFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}
