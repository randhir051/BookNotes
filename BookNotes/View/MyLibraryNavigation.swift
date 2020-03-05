//
//  ContentView.swift
//  BookNotes
//
//  Created by Randhir Singh on 31/01/20.
//  Copyright © 2020 Randhir Singh. All rights reserved.
//

import SwiftUI



struct MyLibraryNavigation: View {
    
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @GestureState private var dragState = DragState.inactive
    
    init() {
    }
    
    var books: [Book] = dummyBooks
    
    // MARK: - DRAG STATES
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                // MARK: - HEADER
                HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                    .opacity(dragState.isDragging ? 0.0 : 1.0)
                    .animation(.default)
                
                Spacer()
                
                // MARK: - LIST VIEW
                List(books) { book in
                    NavigationLink(destination: BookNavigationView(book_item: book)) {
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
                // MARK: - LIST END
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyLibraryNavigation()
    }
}
