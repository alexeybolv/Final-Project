//
//  LoaderView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 6.08.21.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ZStack {
            Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.45)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Loading...")
                    .multilineTextAlignment(.center)
                ActivityIndicator(isAnimating: .constant(true), style: .large)
            }
            .padding(20)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.white, lineWidth: 2)
            )
                .background(Color.white)
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}

