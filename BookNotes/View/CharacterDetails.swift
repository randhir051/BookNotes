//
//  CharacterDetails.swift
//  BookNotes
//
//  Created by Randhir Singh on 04/03/20.
//  Copyright © 2020 Randhir Singh. All rights reserved.
//

import SwiftUI

struct CharacterDetails: View {
    var character : Character
    
    var body: some View {
        Text("Hello " + character.characterName)
    }
}

struct CharacterDetails_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetails(character: dummyCharacters[0])
    }
}
