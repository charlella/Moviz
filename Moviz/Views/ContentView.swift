//
//  ContentView.swift
//  Moviz
//
//  Created by charlene hoareau on 11/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            rectangleImage()
               /* .offset(y: -130)
                .padding(.bottom, -130)*/
            
            VStack(alignment: .leading) {
                /*Image(systemName: "globe")
                 .imageScale(.large)
                 .foregroundColor(.accentColor)*/
                Text("Under the Dome")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    Text("Drama, Science-Fiction, Thriller")
                        .font(.subheadline)
                    Spacer()
                    Text("Rating : 6.5")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                HStack {
                    Text("Thursday (22:00)")
                    Spacer()
                    Text("CBS")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()
                Text("About Under the Dome")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Under the Dome is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The town's inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.")
                    .font(.body)
            }
            .padding()
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
