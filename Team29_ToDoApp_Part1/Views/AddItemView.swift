//
//  AddItemView.swift
//  Team29_ToDoApp
//
//  Created by Alvin Carl Mercado on 2021-11-27.
//

import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var model: ItemViewModel
    @Environment(\.presentationMode) var presentation

    var body: some View {
        NavigationView {
            List {
                Section(header: Text ("Title")) {
                    TextField("", text: $model.title)
                }
                Section(header: Text("Detail")) {
                    TextField("", text: $model.detail)
                }
                Section(header: Text("Date")) {
                    DatePicker("Enter date", selection: $model.date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                Section(header: Text("")) {
                    Toggle("Is completed", isOn: $model.isCompleted)
                    Text(model.string)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(model.updateObject == nil ? "Add Item" : "Edit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        model.addData(presentation: presentation)
                    }, label: {
                        Text("Done")
                           
                    })
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                           
                    })
                }
            }
        }
        .onAppear(perform: model.setUpInitialData)
        .onDisappear(perform: model.deInitData)
    }
}

