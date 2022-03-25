//
//  ListRowView.swift
//  ToDoList
//
//  Created by Alex on 04/03/2022.
//

import SwiftUI

struct ListRowView: View {
    
    let item:ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
    }
}


struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "item 1", isCompleted: false)
    static var previews: some View {
        ListRowView(item: item1)
    }
}
