//
//  Character.swift
//  BookNotes
//
//  Created by Randhir Singh on 04/03/20.
//  Copyright © 2020 Randhir Singh. All rights reserved.
//

import Foundation


struct Character: Identifiable, Hashable {
        
    static func == (lhs: Character, rhs: Character) -> Bool {
           return lhs.characterName == rhs.characterName
       }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(characterName)
    }
    
    var id = UUID()
//    var id : Int
    var imageName: String = ""
    var characterName : String = ""
    var description : String = ""
    var dialogues : [String] = []
    var relationships : [Relationship] = []
    
}

