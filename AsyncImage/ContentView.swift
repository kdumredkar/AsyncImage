//
//  ContentView.swift
//  AsyncImage
//
//  Created by Khiraj Umredkar on 19/12/23.
//

import SwiftUI
extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}


struct ContentView: View {
    private let imgUrl: String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
//    MARK: 1. Basic
//    AsyncImage(url: URL(string: imgUrl))
        
//    MARK: 2. Scale
//      AsyncImage(url: URL(string: imgUrl), scale: 3.0)
        
//    MARK: 3. Scale
//        AsyncImage(url: URL(string: imgUrl)) { image in
//            image
//                .imageModifier()
//        } placeholder: {
//            Image(systemName: "photo.artframe.circle.fill")
//                .iconModifier()
//        }
//        .padding(40)
        
        
//    MARK: 4. Phase
        /*
        AsyncImage(url: URL(string: imgUrl)){ phase in
//            SUCCESS
//            Failure
//            Empty
            if let imaage = phase.image {
                imaage.imageModifier()
            } else if phase.error != nil {
                Image(systemName:  "photo.artframe.circle.fill").iconModifier()
            } else {
                Image(systemName:  "ant.circle.fill").iconModifier()
            }
        }.padding(40)
        */
        
//    MARK: 5. Animation
        
        AsyncImage(url: URL(string: imgUrl), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))){ phase in
            switch phase {
            case .success(let image):
                image.imageModifier()
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            case .empty:
                Image(systemName: "photo.artframe.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
        }
        .padding(40)
    }
}

#Preview {
    ContentView()
}
