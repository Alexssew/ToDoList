//
//  ListView.swift
//  ToDoList
//
//  Created by Alex on 04/03/2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else {
                List {
                    ForEach(listViewModel.items) {item in
                        ListRowView(item: item)
                            .onTapGesture(count: 2, perform: {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                            }
                            })
                    }.onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    
                }
            }
            
        }
        
        .navigationTitle("Todo List 📝")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                }
            }
        }
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }.environmentObject(ListViewModel())
        
    }
}


