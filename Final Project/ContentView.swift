//
//  ContentView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 4.07.21.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var router: Router
    
    var body: some View {
        TabView(selection: $router.selection) {
            WeatherListScreenView()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Router())
    }
}
