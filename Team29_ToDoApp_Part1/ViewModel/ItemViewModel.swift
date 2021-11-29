//
//  ItemViewModel.swift
//  Team29_ToDoApp
//
//  Created by Alvin Carl Mercado on 2021-11-27.
//

import SwiftUI
import RealmSwift


class ItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var detail = ""
    
    @Published var date : Date = Date()
    
     //var dates: String {
        //formatter.dateFormat = "MMMM, d, yyyy"
        //return formatter.string(from: date)
    //}
    
    private lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        return formatter
    }()
    
    @Published var isCompleted : Bool = false
    var string : String {
        isCompleted ? "Completed" : "Not Completed"
    }
    @Published var isOpen = false
    
    @Published var items: [Item] = []
    @Published var updateObject: Item?
    
    init(){
        fetchData()
    }
    
    func fetchData() {
        guard let realm = try? Realm() else { return }
        let results = realm.objects(Item.self)
        
        self.items = results.compactMap( {(item) -> Item? in
            return item
        })
    }
    
    func addData(presentation: Binding<PresentationMode>) {
        if title == "" || detail == ""  { return }
        
        let item = Item()
        item.title = title
        item.detail = detail
        
        guard let realm = try? Realm() else { return }
        
        try? realm.write {
            guard let availableObject = updateObject else {
                realm.add(item)
                
                return
            }
            
            availableObject.title = title
            availableObject.detail = detail
            //availableObject.dates = dates

        }
        
        fetchData()
        
        presentation.wrappedValue.dismiss()
    }
    
    func deleteData(object: Item) {
        guard let realm = try? Realm() else { return }
        
        try? realm.write {
            realm.delete(object)
            
            fetchData()
        }
    }
    
    func setUpInitialData() {
        guard let updateData = updateObject else { return }
        
        title = updateData.title
        detail = updateData.detail
    }
    
    func deInitData() {
        updateObject = nil
        title = ""
        detail = ""
    }
}

