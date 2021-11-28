//
//  HomeView.swift
//  Team29_ToDoApp
//
//  Created by Alvin Carl Mercado on 2021-11-27.
//

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

