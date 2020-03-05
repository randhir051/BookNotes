//
//  CharactersView.swift
//  BookNotes
//
//  Created by Randhir Singh on 03/03/20.
//  Copyright © 2020 Randhir Singh. All rights reserved.
//

import SwiftUI

struct CharactersView: View {
    var characters: [Character]
    
    var body: some View {
        
//        NavigationView {
            
            List(characters) { character in
                
                NavigationLink(destination: CharacterDetails(character: character)) {
                    //                        VStack(alignment: .leading, spacing: -15){
                    VStack(alignment: .trailing, spacing: -25){
                        
                        
                        Image(character.imageName)
                            .resizable()
                            .clipShape(Circle())
                            .shadow(radius: 5)
                            .frame(width: 100.0, height: 100)
                            .padding(.leading, 20)
                        
                        
                        VStack(alignment: .leading){
                            Text(character.characterName)
                            Text(character.description)
                                .font(.subheadline)
                                .foregroundColor(Color.black.opacity(0.5))
                            Spacer()
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40, alignment: Alignment.topLeading)
                        .padding(.all, 20)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1).blendMode(BlendMode.destinationOver))
                        
                        
                    }
                }.padding(.all, 10)
                
        }.navigationBarItems(trailing: Button(action: {
            self.addRow()
        }) {
            Image(systemName: "plus")
        })
            
//            .navigationBarTitle("My Library", displayMode: .inline)
//            Color.red.opacity(0.5).edgesIgnoringSafeArea(.all).blendMode(.destinationOver)
//        }
    }
    
    private func addRow() {
           //self.locations.append("New Location")
        print("add row")
       }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView(characters: dummyCharacters)
    }
}
