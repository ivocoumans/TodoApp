//
//  ContentView.swift
//  TodoApp
//
//  Created by Ivo Coumans on 05/04/2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskDataStore()
    @State var newTask: String = ""
    
    var addTaskBar: some View {
        HStack {
            TextField("Add task: ", text: self.$newTask)
            Button(action: self.addNewTask, label: {
                Text("Add new")
            })
            .disabled(newTask.isEmpty)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                addTaskBar.padding()
                List {
                    ForEach(self.taskStore.tasks) { task in Text(task.taskItem)}
                        .onDelete(perform: self.deleteTask)
                }
                .navigationBarTitle("Tasks")
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    
    func addNewTask() {
        if self.newTask == "" {
            return
        }
            
        taskStore.tasks.append(Task(
            id: String(taskStore.tasks.count + 1),
            taskItem: newTask
        ))
        self.newTask = ""
    }
    
    func deleteTask(at offsets: IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
