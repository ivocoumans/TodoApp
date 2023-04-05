//
//  DataStore.swift
//  TodoApp
//
//  Created by Ivo Coumans on 05/04/2023.
//

import Foundation
import SwiftUI
import Combine

struct Task: Identifiable {
    var id = String()
    var taskItem = String()
}

class TaskDataStore: ObservableObject {
    @Published var tasks = [Task]()
}
