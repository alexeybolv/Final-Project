//
//  ContainerView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 6.08.21.
//

import Foundation
import SwiftUI
import Combine

protocol IModel: AnyObject {
    func update(data: Any?)
    var listener: IContainer? { get set }
}

protocol IModelView {
    var viewModel: IModel? { get }
    func showError(error: String)
    func showLoading()
    func hideLoading()
}

protocol  IContainer {
    func showError(error: String)
    func showLoading()
    func hideLoading()
}

struct ContainerView<Content>: IContainer, View where Content: View & IModelView {
    @ObservedObject var containerModel = ContainerModel()
    private var content: Content

    public init(content: Content) {
        self.content = content
        self.content.viewModel?.listener = self
    }

    var body : some View {
        ZStack {
            content
            if (self.containerModel.isLoading) {
                LoaderView()
            }
        }.alert(isPresented: $containerModel.hasError){
            Alert(title: Text(""), message: Text(containerModel.errorText), dismissButton: .default(Text("OK")){
                self.containerModel.errorShown()
            })
        }
    }

    func showError(error: String) {
        self.containerModel.setupError(error: error)
    }

    func showLoading() {
        self.containerModel.showLoading()
    }

    func hideLoading() {
        self.containerModel.hideLoading()
    }
}

extension IModelView {

    func showError(error: String) {
        self.viewModel?.listener?.showError(error: error)
    }

    func showLoading() {
        self.viewModel?.listener?.showLoading()
    }

    func hideLoading() {
        self.viewModel?.listener?.hideLoading()
    }
}
