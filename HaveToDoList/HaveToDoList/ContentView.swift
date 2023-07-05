//
//  ContentView.swift
//  HaveToDoList
//
//  Created by Ham Seonwoo on 2023/07/05.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var toDoStores: TodoListStore = TodoListStore()
    
    @State var somethingToDo: String = ""
    @State var isDone: Bool = false
    
    var body: some View {
        
        NavigationStack {
            List(toDoStores.todoLists) { todo in
                HStack{
                    Button {
                        toDoStores.isChecking(todo: todo)
                    } label: {
                        Image(todo.isDoneImg)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25,height: 25)
                    }
                    Text("\(todo.somethingToDo)")
                }.swipeActions{
                    Button {
                        toDoStores.removeList(todo)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }.tint(.red)
                }
                
                
                
            }
            .navigationTitle("To do List")
            VStack{
                TextField("할 일을 추가하세요", text: $somethingToDo)
                Toggle(isOn: $isDone) {
                    Text("해야하죠 ? ")
                }
                
                Button {
                    toDoStores.addList(haveTodo: somethingToDo, done: isDone)
                    resetFields()
                } label: {
                    Text("추가하기")
                }
                
            }
        }
        .padding()
    }
    func resetFields() {
        somethingToDo = ""
        isDone = false
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
