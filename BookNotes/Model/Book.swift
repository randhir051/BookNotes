//
//  File.swift
//  BookNotes
//
//  Created by Randhir Singh on 01/02/20.
//  Copyright © 2020 Randhir Singh. All rights reserved.
//

import Foundation

struct Book: Identifiable, Hashable {
    
    
    static func == (lhs: Book, rhs: Book) -> Bool {
           return lhs.bookName == rhs.bookName
       }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(bookName)
    }
    
    
    var id = UUID()
    var imageName = ""
    var bookName = ""
    var authorName = ""
    var summary = ""
    var characters = [Character]()
}
//struct Book {
//    var bookName = ""
//    var authorName = ""
//
//}
//
//class Books {
//    var bookName = ""
//    var authorName = ""
//}
