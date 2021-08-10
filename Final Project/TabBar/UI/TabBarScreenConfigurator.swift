//
//  TabBarScreenConfigurator.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 8.08.21.
//

import SwiftUI
import UIKit

class TabBarScreenConfigurator: IConfigurator {

    static let shared = TabBarScreenConfigurator()

    func createScreen(_ data: Any?) -> some View {
        var view = TabBarScreenView()
        view.model = TabBarViewModel()
//        let vc = UIHostingController<ContainerView<TabBarScreenView>>(rootView: ContainerView(content: view))
//        view.setupParent(parent: vc)
        return view
    }
}
