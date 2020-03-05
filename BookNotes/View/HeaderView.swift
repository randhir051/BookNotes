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
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    let haptics = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            
            
            Image("add-book")
                .resizable()
                //                .frame(width: .infinity, height: .infinity, alignment: .center)
                .scaledToFit()
                .frame(width: 375, height: 80)
            
            Button(action: {
                // ACTION
                //playSound(sound: "sound-click", type: "mp3")
                self.haptics.notificationOccurred(.success)
                self.showInfoView.toggle()
            }) {
                Text("Add Book")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(Color.primary)
            .sheet(isPresented: $showInfoView) {
                AddBookView()
            }
            
        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    @State static var showGuide: Bool = false
    @State static var showInfo: Bool = false
    
    static var previews: some View {
        HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
