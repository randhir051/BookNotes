//
//  Character.swift
//  BookNotes
//
//  Created by Randhir Singh on 04/03/20.
//  Copyright © 2020 Randhir Singh. All rights reserved.
//

import Foundation


struct Character: Identifiable {
    var id = UUID()
    var imageName = ""
    var characterName = ""
    var description = ""
    var dialogues = [String]()
    var relationships = [Relationship]()
    
}

