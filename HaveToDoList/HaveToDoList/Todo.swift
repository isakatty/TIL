//
//  Todo.swift
//  HaveToDoList
//
//  Created by Ham Seonwoo on 2023/07/05.
//

import Foundation

struct Todo : Identifiable {
    var id : UUID = UUID()
    var somethingToDo: String
    var isDone: Bool
    
    var isDoneImg: String {
        isDone ? "check" : "ischecked"
    }
    
}

var todoLists: [Todo] = [
    Todo(somethingToDo: "7시에 기초스터디 들어야함", isDone: false),
]

class TodoListStore: ObservableObject {
    @Published var todoLists: [Todo]
    
    init() {
        self.todoLists = [
            Todo(somethingToDo: "6시에 퇴근 체크해야함", isDone: true),
            Todo(somethingToDo: "오전 7시 기상", isDone: true),
            Todo(somethingToDo: "구조체로 데이터 모델링", isDone: false),
            Todo(somethingToDo: "LH 청약 신청", isDone: true),
            Todo(somethingToDo: "3차 합주곡 선정", isDone: false),
        ]
    }
    func addList(haveTodo: String, done: Bool){
        if haveTodo.count > 0 {
            let things: Todo = Todo(somethingToDo: haveTodo, isDone: done)
            
            todoLists.append(things)
        }
    }
    
    func removeList(_ todothing: Todo){
        todoLists.removeAll(where: { $0.id == todothing.id })
    }
    
    // 버튼이 눌렸을 때, 함수를 호출하여 불리언 값을 바꿔줄 것.
    // 그러기 위해서는 인덱스 번호를 확인해야함.. 어케해용?
    // 리스트를 위해 부여했던 id 값을 비교하여 사용할건데 -> for문을 돌려 하나하나 확인해보는거야
    func isChecking(todo: Todo){
        for tempList in todoLists{
            if todo.id == tempList.id {
                let index = todoLists.firstIndex(where: {$0.id == todo.id})!
                todoLists[index].isDone.toggle()
                break
            }
        }
    }
    
}
