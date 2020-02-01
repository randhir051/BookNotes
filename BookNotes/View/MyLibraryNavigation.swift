//
//  ContentView.swift
//  BookNotes
//
//  Created by Randhir Singh on 31/01/20.
//  Copyright © 2020 Randhir Singh. All rights reserved.
//

import SwiftUI

struct Book: Identifiable {
    var id = UUID()
    var imageName = ""
    var bookName = ""
    var authorName = ""
    var summary = ""
    
}


struct MyLibraryNavigation: View {
    
    init() {
    }
    
    
    var books: [Book] = [
        Book(bookName: "The Catcher in the Rye", authorName: "JD Salinger", summary: "The novel details two days in the life of 16-year-old Holden Caulfield after he has been expelled from prep school. Confused and disillusioned, Holden searches for truth and rails against the “phoniness” of the adult world."),
        Book(bookName: "The Book Thief", authorName: "Markus Zusak", summary: "Liesel lives with her foster parents Hans and Rosa Hubermann in Nazi Germany. She finds solace from the horrors around her by stealing books from the mayor's house to learn new words."),
        Book(bookName: "The Wheel of Times", authorName: "Robert Jordan", summary: "Wheel of Time is a story that takes place both in our past and our future. In his fantasy world, the Dark One, the embodiment of pure evil, is breaking free from his prison."),
        Book(bookName: "Harry Potter", authorName: "JK Rowling", summary: "Story of a boy who is a hocrux."),
        Book(imageName: "photo", bookName: "I'll give you the Sun", authorName: "Jady Nelson", summary: "Story of a twin."),
        Book(bookName: "The Perks of Being a Wallflower", authorName: "Stephen Chbosky", summary: "Story of an introvert.")
    ]
    
    var body: some View {
        
        NavigationView {
            
//            ZStack{
            
                List(books) { book in
                    
                    NavigationLink(destination: BookNavigationView(book_item: book)) {
//                        VStack(alignment: .leading, spacing: -15){
                        VStack(alignment: .leading, spacing: -15){
                            
                            
                            Image(book.bookName)
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .shadow(radius: 5)
                            .frame(width: 100.0, height: 150.0)
                            .padding(.leading, 20)
                            
                            
                            VStack(alignment: .leading){
                                Text(book.bookName)
                                Text(book.authorName)
                                    .font(.subheadline)
                                    .foregroundColor(Color.black.opacity(0.5))
                                Spacer()
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40, alignment: Alignment.topLeading)
                            .padding(.all, 20)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1).blendMode(BlendMode.destinationOver))
                            
                            
                        }
                    }.padding(.all, 10)
                    
                }.navigationBarTitle("My Library", displayMode: .inline)
                

                Color.red.opacity(0.5).edgesIgnoringSafeArea(.all).blendMode(.destinationOver)
//            }
        }
        //.background(Image("Texture"))
        //.navigationBarTitle(Text("MyLibrary"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyLibraryNavigation()
    }
}
