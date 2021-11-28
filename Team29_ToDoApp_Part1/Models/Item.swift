//
//  Item.swift
//  Team29_ToDoApp
//
//  Created by Alvin Carl Mercado on 2021-11-27.
//

import SwiftUI
import RealmSwift


class Item: Object, Identifiable {
    @objc dynamic var id: Date = Date()
    @objc dynamic var title = ""
    @objc dynamic var detail = ""
   // @objc dynamic var isCompleted: Bool = false
    
   // @objc dynamic var date : Date 
}
