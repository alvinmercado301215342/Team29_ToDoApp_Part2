// ToDo App Part 2
// Name 01               : Alvin Carl Mercado
// Student ID            : 301215342
// Name 02               : Ishtiaque Ahmed
// Student ID            : 301223010
// Date last modified    : Nov. 28, 2021
// Short revision history: App UI was initially created with one screen (7:00 PM 11/28/21) Created functionalities like add, edit and delete.
// Short description of the program: This is a standard ToDo List app that is going to store to do list item inserted by the user.

import SwiftUI

struct HomeView: View {
    @StateObject var model = ItemViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
            
                VStack(spacing: 15) {
                    ForEach(model.items) { item in
                        VStack(alignment: .leading, spacing: 10, content: {
                            Text (item.title)
                            Text (item.detail)
                                .font(.caption)
                                .foregroundColor(.gray)
                        })
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(10)
                            .background(Color.gray.opacity(0.20))
                            .cornerRadius(10)
                            .contentShape(RoundedRectangle(cornerRadius: 10))
                            .contextMenu(menuItems: {
                                Button(action: {
                                    model.deleteData(object: item)
                                }, label: {
                                    Text("Delete")
                                })
                                Button(action: {
                                    model.updateObject = item
                                    model.isOpen.toggle()
                                }, label: {
                                    Text("Edit")
                                })
                            })
                    }
                }
                
                .padding()
            }
            .navigationTitle("ToDo App")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        model.isOpen.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .font(.title2)
                    })
                }
            }
            .sheet(isPresented: $model.isOpen, content: {
                AddItemView()
                    .environmentObject(model)
            })
        }
    }
}

