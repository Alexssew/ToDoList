//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Alex on 04/03/2022.
//

import Foundation

/*
 CRUD FUNCTIONS  - create, read, update, delete. very importannt functions
 */

class ListViewModel: ObservableObject {
    
    @Published var items:[ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    
    let itemskey:String = "items_list"
    
    init(){
        getItems()
    }
    func getItems() {
        //        let newItems = [
        //            ItemModel(title: "this is the first item", isCompleted: false),
        //            ItemModel(title: "this is the second item", isCompleted: true),
        //            ItemModel(title: "the third item", isCompleted: false)
        //        ]
        //        items.append(contentsOf: newItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemskey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items = savedItems
    }
    
    func deleteItem (IndexSet: IndexSet){
        items.remove(atOffsets: IndexSet)
    }
    func moveItem (from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
        
    }
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemskey)
        }
    }
}
