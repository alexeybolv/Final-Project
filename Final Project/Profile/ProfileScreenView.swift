//
//  ProfileScreenView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 5.07.21.
//

import SwiftUI

struct ProfileScreenView: View {

    @State var infoText: String = ""
    @State var suffixesArray: [String] = []
    @State var suffixesDict: [String: Int] = [:]

    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter text", text: $infoText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Calculate Suffixes") {
                calculateSuffixes()
            }
            .frame(width: 160.0, height: 40.0)
            .border(Color.gray, width: 1)
            List(suffixesArray, id: \.self) { suffix in
                Text(suffix)
            }
            if !suffixesDict.isEmpty {
                List(Array(suffixesDict.keys), id: \.self) { key in
                    Text("\(key) : \(suffixesDict[key] ?? 0)")
                }
            }
        }.padding()
    }

    func calculateSuffixes() {
        let text = infoText
        if text.isEmpty { return }
        suffixesArray.removeAll()
        let words: [String] = text.components(separatedBy: " ")
        for word in words {
            if word.count == 1 {
                suffixesArray.append(word)
                continue
            }
            for index in 1...word.count {
                suffixesArray.append(word.suffix(index).lowercased())
            }
        }

        let bigSuffixes = suffixesArray.filter({ $0.count > 2 })
        suffixesDict = bigSuffixes.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    }
}

struct ProfileScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreenView()
    }
}
