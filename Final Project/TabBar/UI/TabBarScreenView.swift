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

    @State private var currentTab = 0

    var body: some View {
        TabView(selection: $currentTab) {
            (ModuleConfig.shared.config(screen: WeatherScreenView.self) as? WeatherConfigurator)?.createScreen(nil)
                .tabItem {
                    VStack {
                        Image(systemName: "cloud")
                        Text("Погода")
                    }
                }
                .tag(0)
                .onAppear() {
                    self.currentTab = 0
                }
            ProfileScreenView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Профиль")
                    }
                }
                .tag(1)
                .onAppear() {
                    self.currentTab = 1
                }
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
