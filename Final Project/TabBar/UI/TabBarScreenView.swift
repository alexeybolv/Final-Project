//
//  TabBarScreenView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 8.08.21.
//

import SwiftUI

struct TabBarScreenView: View {

    var output: ITabBarScreenInteractor?
    @ObservedObject var model: TabBarViewModel = TabBarViewModel()

    var body: some View {
        TabView(selection: $model.selection) {
            (ModuleConfig.shared.config(screen: WeatherListScreenView.self) as? WeatherListConfigurator)?.createScreen(nil)
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                        Text("Погода")
                    }
                }
                .tag(0)
            ProfileScreenView()
                .tabItem {
                    VStack {
                        Image(systemName: "pills")
                        Text("Профиль")
                    }
                }
                .tag(1)
        }
    }
}

struct TabBarScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarScreenView()
    }
}

extension TabBarScreenView: ITabBarScreenView {
    var viewModel: IModel? {
        return model
    }
}
