//
//  HeaderView.swift
//  BookNotes
//
//  Created by Randhir Singh on 04/03/20.
//  Copyright © 2020 Randhir Singh. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    @Binding var showAddItemScreen: Bool
    @Binding var searchText: String
    @Binding var showCancelButton: Bool
    
    let haptics = UINotificationFeedbackGenerator()
    
    
    var body: some View {
        HStack {
                            
            TextField(" Search", text: $searchText).font(.system(size: 22, weight: .regular)).padding(.all, 6).background(RoundedRectangle(cornerRadius: 16).colorInvert().shadow(radius: 2), alignment: .center)
            
            Button(action: {
                // ACTION
                self.haptics.notificationOccurred(.success)
                self.showAddItemScreen.toggle()
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 32, weight: .regular)).shadow(radius: 2)
            }
            .accentColor(Color.white)
            .sheet(isPresented: $showAddItemScreen) {
                AddBookView()
            }
        }
//        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    @State static var showAddItemScreen: Bool = false
    @State static var showCancelButton: Bool = false
    @State static var searchText: String = ""
    
    
    static var previews: some View {
        HeaderView(showAddItemScreen: $showAddItemScreen, searchText: $searchText, showCancelButton: $showCancelButton)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
