//
//  ModuleConfig.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 6.08.21.
//

import Foundation
import UIKit
import SwiftUI

protocol IConfugator: AnyObject {
    func createScreen(_ data: Any?) -> UIViewController
}

class ModuleConfig{
    private init() {}
    static let shared = ModuleConfig()

    func config<Content:View>(screen: Content.Type)->IConfugator? {
        if screen == WeatherListScreenView.self {
            return WeatherListConfigurator.shared
        }
//        if screen == NewsItemView.self {
//            return NewsItemConfigurator.shared
//        }
//        if screen == SearchView.self {
//            return SearchConfigurator.shared
//        }
        return nil
    }
}
