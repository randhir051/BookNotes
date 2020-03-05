//
//  Relationship.swift
//  BookNotes
//
//  Created by Randhir Singh on 04/03/20.
//  Copyright © 2020 Randhir Singh. All rights reserved.
//

import Foundation


struct Relationship: Identifiable {
    var id = UUID()
    var relatedTo : Character?
    var relation = ""    
}
