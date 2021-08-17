//
//  ModuleConfig.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 6.08.21.
//

import Foundation
import UIKit
import SwiftUI

public protocol IConfigurator: AnyObject {
//    associatedtype V: View
//    func createScreen(_ data: Any?) -> View
}

class ModuleConfig {
    private init() {}
    static let shared = ModuleConfig()

    func config<Content: View>(screen: Content.Type) -> IConfigurator {
        if screen == TabBarScreenView.self {
            return TabBarScreenConfigurator.shared
        }
        if screen == WeatherScreenView.self {
            return WeatherConfigurator.shared
        }
        if screen == SprayersListScreenView.self {
            return SprayersListConfigurator.shared
        }
        if screen == CalculatorScreenView.self {
            return CalculatorScreenConfigurator.shared
        }
        return TabBarScreenConfigurator.shared
    }
}
