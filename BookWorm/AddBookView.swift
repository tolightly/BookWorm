//
//  AddBookView.swift
//  BookWorm
//
//  Created by Denys Nazymok on 12.04.2023.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State var title = ""
    @State var author = ""
    @State var review = ""
    @State var rating = 3
    @State var genre = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Add book title", text: $title)
                    TextField("Add book author", text: $author)
                    
                    Picker("Select genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.genre = genre
                        newBook.review = review
                        newBook.rating = Int16(rating)
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add new Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
