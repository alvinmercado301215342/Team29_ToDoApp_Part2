// ToDo App Part 2
// Name 01               : Alvin Carl Mercado
// Student ID            : 301215342
// Name 02               : Ishtiaque Ahmed
// Student ID            : 301223010
// Date last modified    : Nov. 28, 2021
// Short revision history: App UI was initially created with one screen (3:00 PM 11/24/21) Created functionalities like add, edit and delete (7:00 PM 11/26/21) Completed basic functionalities (7:00 PM 11/28/21) .
// Short description of the program: This is a standard ToDo List app that is going to store to do list item inserted by the user.

import SwiftUI
import RealmSwift


class Item: Object, Identifiable {
    @objc dynamic var id: Date = Date()
    @objc dynamic var title = ""
    @objc dynamic var detail = ""
   // @objc dynamic var isCompleted: Bool = false
    
    //@objc dynamic var date = Date ()
}
