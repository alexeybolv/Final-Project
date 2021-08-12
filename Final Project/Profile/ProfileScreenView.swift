//
//  ProfileScreenView.swift
//  Final Project
//
//  Created by Alexey Bolvonovich on 5.07.21.
//

import SwiftUI

import Combine

struct ProfileScreenView: View {

    @State var tasks: [Task] = []
    @State var selectedTasks: [Task] = []
    @ObservedObject var scheduler: JobScheduler = JobScheduler(tasks: [])

    var body: some View {
        VStack {
            Text("Choose task:")
                .font(.system(size: 20.0))
                .fontWeight(.medium)
            List(tasks, id: \.id) { task in
                HStack {
                    Text(task.name)
                    if selectedTasks.contains(where: { $0.id == task.id }) {
                        Image(systemName: "checkmark.square")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 40.0)
                .onTapGesture {
                    if selectedTasks.contains(where: { $0.id == task.id }) {
                        self.selectedTasks.removeAll(where: { $0.id == task.id })
                    } else {
                        self.selectedTasks.append(task)
                    }
                }
            }
            if !scheduler.results.isEmpty {
                VStack {
                    Text("Results:")
                        .font(.system(size: 20.0))
                        .fontWeight(.medium)
                    List(Array(scheduler.results.keys), id: \.self) { key in
                        Text("\(key) : \(scheduler.results[key] ?? 0)")
                    }
                }
            }
            Spacer()
            Button("Execute") {
                scheduler.addTasks(tasks: selectedTasks)
                scheduler.start()
            }
            Spacer(minLength: 50.0)
        }
        .onAppear() {
            if tasks.isEmpty {
                prepareData()
            }
        }
    }

    func prepareData() {
        tasks.append(Task(id: 0, name: "Sum", function: {
            let _ = 2 + 3
        }))
        tasks.append(Task(id: 1, name: "Map", function: {
            let array: [Int] = [10, 20, 155, 25, 300, 350, 590]
            _ = array.map({ $0 * 333 })
        }))
        tasks.append(Task(id: 2, name: "Filter", function: {
            let array: [Int] = [10, 20, 155, 25, 300, 350, 590]
            _ = array.filter { $0.isMultiple(of: 2) }
        }))
        tasks.append(Task(id: 3, name: "Reduce", function: {
            let array: [Int] = [1989, 1992, 2003, 1970, 2014, 2001, 2015, 1990, 2000, 1999]
            _ = array.filter({ $0 >= 2000 }).map({ 2021 - $0 }).reduce(0, +)
        }))
        tasks.append(Task(id: 4, name: "Map(copy)", function: {
            let array: [Int] = [10, 20, 155, 25, 300, 350, 590]
            _ = array.map({ $0 * 333 * 2 })
        }))
    }
}

struct Task {

    enum TaskPriority {
        case low
        case medium
        case high
    }

    let id: Int
    let name: String
    let priority: TaskPriority = .low
    let function: (() -> ())?

    func execute() {
        self.function?()
    }
}

class JobScheduler: ObservableObject {
    var tasks: [Task] = []
    @Published var results: [String: Double] = [:]

    private let serialQueue = DispatchQueue(label: "Serial queue")

    init(tasks: [Task]) {
        self.tasks = tasks
    }

    func addTasks(tasks: [Task]) {
        self.tasks.append(contentsOf: tasks)
    }

    func start() {
        serialQueue.sync {
            for task in tasks {
                measure(name: task.name, {
                    task.execute()
                })
            }
            self.tasks.removeAll()
        }
    }

    func measure<A>(name: String = "", _ block: () -> A) -> A {
        let startTime = CACurrentMediaTime()
        let result = block()
        let timeElapsed = CACurrentMediaTime() - startTime
        results[name] = timeElapsed
        return result
    }
}

@discardableResult
func measure<A>(name: String = "", _ block: () -> A) -> A {
    let startTime = CACurrentMediaTime()
    let result = block()
    let timeElapsed = CACurrentMediaTime() - startTime
    return result
}

struct ProfileScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreenView()
    }
}
