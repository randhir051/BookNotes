//
//  CharactersView.swift
//  BookNotes
//
//  Created by Randhir Singh on 03/03/20.
//  Copyright © 2020 Randhir Singh. All rights reserved.
//

import SwiftUI

struct CharactersView: View {
    //    var characters: [Character]
    var book_item: Book
    
    
    @State var showAlert: Bool = false
    @State var showAddItemScreen: Bool = false
    @State var searchText: String = ""
    @State var showCancelButton: Bool = false
    @GestureState private var dragState = DragState.inactive
    
    let trailingPad: CGFloat = 32
    let leadingPad: CGFloat = 32
    
    var body: some View {
        
        ScrollView {
            
            ZStack(alignment: .bottom) {
                Image(book_item.imageName).resizable().scaledToFill().edgesIgnoringSafeArea(.top).frame( height: 200, alignment: .center).clipped()
                //            Spacer()
                ZStack(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 32).frame(height: 96, alignment: .center).colorInvert().padding(.leading, leadingPad*2).padding(.trailing, trailingPad*2).offset(x: 0, y: 32)
                    Text(book_item.bookName).font(.system(size: 32, weight: .regular))
                }
            }
            
            
            // MARK: - HEADER
            HeaderView(showAddItemScreen: $showAddItemScreen, searchText: $searchText, showCancelButton: $showCancelButton)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default).padding(.all, leadingPad)//.padding(.trailing, trailingPad)
            
            
            ForEach(book_item.characters.filter{$0.characterName.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                character in
                
                NavigationLink(destination: CharacterDetails(character: character)) {
                    
                    HStack(){
                    VStack(alignment: .leading) {
                        
                        Text(character.characterName).foregroundColor(.black).font(.system(size: 18, weight: .bold))
                        Text(character.description).foregroundColor(.gray).font(.system(size: 14, weight: .regular))
                            .font(.subheadline)
                        Divider()
                        
                    }
                    }.padding(.leading, self.leadingPad/2)
                }//.padding(.all, 8)
                
            }
        }.edgesIgnoringSafeArea(.top)
        
    }
    
    private func addRow() {
        //self.locations.append("New Location")
        print("add row")
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView(book_item: dummyBooks[3])
    }
}
