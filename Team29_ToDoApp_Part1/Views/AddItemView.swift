// ToDo App Part 2
// Name 01               : Alvin Carl Mercado
// Student ID            : 301215342
// Name 02               : Ishtiaque Ahmed
// Student ID            : 301223010
// Date last modified    : Nov. 28, 2021
// Short revision history: App UI was initially created with one screen (3:00 PM 11/24/21) Created functionalities like add, edit and delete (7:00 PM 11/26/21) Completed basic functionalities (7:00 PM 11/28/21) .
// Short description of the program: This is a standard ToDo List app that is going to store to do list item inserted by the user.

import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var model: ItemViewModel
    @Environment(\.presentationMode) var presentation

    var body: some View {
        //Creating list of items
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
                    // To add/insert todo items
                    Button(action: {
                        model.addData(presentation: presentation)
                    }, label: {
                        Text("Done")
                           
                    })
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    //Cancel to navigate back to home view
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

