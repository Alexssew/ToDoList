//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Alex on 04/03/2022.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate:Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")

    
    var body: some View {
        ScrollView{
            VStack(spacing: 20.0){
                Text("There are no Items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Need a productive and well organised day? Add a couple of items to your To do list!")
                    .padding(.bottom, 10)
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something.. 🥳")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.accentColor : secondaryAccentColor)
                        .cornerRadius(15)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.accentColor.opacity(0.6) : secondaryAccentColor.opacity(0.7),
                    radius: animate ? 30 : 15,
                    x: 0, y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(x: 0, y: animate ? -6 : 0)
                
            }.frame(maxWidth: 450)
            .multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation(){
        guard !animate else{return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView()
        }
        
    }
    
}
