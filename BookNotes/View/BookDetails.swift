//
//  BookDetails.swift
//  BookNotes
//
//  Created by Randhir Singh on 01/02/20.
//  Copyright © 2020 Randhir Singh. All rights reserved.
//

import SwiftUI

struct BookDetails: View {
    var book : Book
    
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            HStack(){
                Image(book.bookName)
                    .resizable()
                    .frame(width: 100.0, height: 150.0)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
                
                VStack(alignment: .leading, spacing: 5){
                    Text(book.bookName)
                        .font(.title)
                    Divider()
                    Text(book.authorName)
                        .font(.subheadline)
//                    Spacer()
                }.padding()
                
            }
            Divider()
            
            Text(book.summary)
                .font(.caption)
                .multilineTextAlignment(.center)
                .lineLimit(50)
        }.padding()
            .padding(.top, 40)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
//            .background(Image("Background").resizable().edgesIgnoringSafeArea(.all))
            .navigationBarTitle(Text(book.bookName), displayMode: .inline)
        
    }
}

struct BookDetails_Previews: PreviewProvider {
    static var previews: some View {
        BookDetails(book: Book(imageName: "photo", bookName: "The Book Thief", authorName: "Markus Zusak", summary: "A story set during WW2 in Germany of a girl learning about frienship", characters: dummyCharacters))
    }
}
