//
//  BookNavigationView.swift
//  BookNotes
//
//  Created by Randhir Singh on 01/02/20.
//  Copyright © 2020 Randhir Singh. All rights reserved.
//

import SwiftUI

struct BookNavigationView: View {
    var book_item: Book
    var body: some View {
        TabView{
            CharactersView(characters: book_item.characters).tabItem({
                Image(systemName: "person.2.fill")
                Text("Characters")
                })
            BookDetails(book: book_item).tabItem({
                Image(systemName: "info.circle.fill")
                Text("Book Info")
            })
        }.background(Color.black)
    }
}

struct BookNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        BookNavigationView(book_item: Book(imageName: "photo", bookName: "The Book Thief", authorName: "Markus Zusak", summary: "A story set during WW2 in Germany of a girl learning about frienship"))
    }
}
