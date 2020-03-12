//
//  ContentView.swift
//  BookNotes
//
//  Created by Randhir Singh on 31/01/20.
//  Copyright © 2020 Randhir Singh. All rights reserved.
//

import SwiftUI



struct BooksNavigation: View {
    
    @State var showAlert: Bool = false
    @State var showAddItemScreen: Bool = false
    @State var searchText: String = ""
    @State var showCancelButton: Bool = false
    
    @GestureState private var dragState = DragState.inactive
    
    
    let trailingPad: CGFloat = 32
    let leadingPad: CGFloat = 32
    
    init() {
    }
    
    var books: [Book] = dummyBooks
    
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack {
                    // MARK: - HEADER
                    
                    ZStack(alignment: .bottom) {
                        Image("BookNavBG").resizable().scaledToFit().edgesIgnoringSafeArea(.top).frame(height: 200, alignment: .leading).clipped()
                        
                        ZStack(alignment: .bottom) {
                            RoundedRectangle(cornerRadius: 32).frame(height: 96, alignment: .center).colorInvert().padding(.leading, leadingPad*2).padding(.trailing, trailingPad*2).offset(x: 0, y: 32)
                            Text("Books").font(.system(size: 32, weight: .regular))
                        }
                    }
                    
                    // MARK: - SEARCH BAR
                    HeaderView(showAddItemScreen: $showAddItemScreen, searchText: $searchText, showCancelButton: $showCancelButton)
                        .opacity(dragState.isDragging ? 0.0 : 1.0)
                        .animation(.default).padding(.all, leadingPad)
                    
                    // MARK: - LIST VIEW
                    ForEach(books.filter{$0.bookName.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                        book in
                        
                        NavigationLink(destination: CharactersView(book_item: book)) {
                            VStack(alignment: .leading){
                                
                                VStack(alignment: .leading){
                                    Image(book.imageName) .resizable().scaledToFill().clipShape(RoundedRectangle(cornerRadius: 32)).frame(height: 160, alignment: .top).clipped()
                                    VStack(alignment: .leading){ Text(book.bookName).foregroundColor(.black).font(.system(size: 18, weight: .bold))
                                    }.padding(.all, 16)
                                }
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 240, alignment: Alignment.topLeading)
                                .overlay(RoundedRectangle(cornerRadius:32).stroke(Color.gray, lineWidth: 1).blendMode(BlendMode.colorBurn)).padding(.bottom, 16).shadow(radius: 5)
                            }.shadow(radius: 2).padding(.leading, self.leadingPad).padding(.trailing, self.trailingPad)
                            
                        }
                    }.buttonStyle(PlainButtonStyle())
                }
                // MARK: - LIST END
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading).edgesIgnoringSafeArea(.top)
        }.edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BooksNavigation()
    }
}
