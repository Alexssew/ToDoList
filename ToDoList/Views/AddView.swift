//
//  AddView.swift
//  ToDoList
//
//  Created by Alex on 04/03/2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel:ListViewModel
    @State var textFieldText:String = ""
    @State var showAlert:Bool = false
    @State var alertTitle:String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type here...", text: $textFieldText)
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                Button {
                    saveButtonPressed()
                } label: {
                    Label("Save".uppercased(), systemImage: "pencil")
                        //.bold()
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(15)
                }//.buttonStyle(.bordered)

            }.padding()
            
        }
        .navigationTitle("Add an item ✍")
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertTitle))
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            //show error
            alertTitle = "Item must be more than 3 characters 😮‍💨😫"
            showAlert.toggle()
            return false
        }else {
            return true
        }
        
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }.environmentObject(ListViewModel())
        
    }
}
