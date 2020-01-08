//
//  ContentView.swift
//  Bookworm
//
//  Created by Davron on 1/6/20.
//  Copyright © 2020 Davron. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingSheet = false

    var body: some View {
        NavigationView {
            Text("\(books.count)")
                .navigationBarTitle("Bookworm")
                .navigationBarItems(trailing:
                Button(action: {
                    self.showingSheet.toggle()
                })
                {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $showingSheet) { AddBookView().environment(\.managedObjectContext, self.moc)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
