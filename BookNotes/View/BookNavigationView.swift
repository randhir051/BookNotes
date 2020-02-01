//
//  BookNavigationView.swift
//  BookNotes
//
//  Created by Randhir Singh on 01/02/20.
//  Copyright © 2020 Randhir Singh. All rights reserved.
//

import SwiftUI

struct BookNavigationView: View {
    var book_item: Book?
    var body: some View {
        TabView{
            BookDetails(book: book_item!).tabItem({
                Image("Notes").frame(width: 50, height: 50.0)
                })
            Text("Characters of the book").tabItem({
                Image("character")
                })
            Text("Favourite Quotes").tabItem({
                Image("Quote-2")
            })
        }.background(Color.black)
    }
}

struct BookNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        BookNavigationView(book_item: Book(imageName: "photo", bookName: "The Book Thief", authorName: "Markus Zusak", summary: "A story set during WW2 in Germany of a girl learning about frienship"))
    }
}
