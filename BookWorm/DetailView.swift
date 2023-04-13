//
//  DetailView.swift
//  BookWorm
//
//  Created by Denys Nazymok on 13.04.2023.
//
import CoreData
import SwiftUI

struct DetailView: View {
    let book: Book
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            .navigationTitle(book.title ?? "Unknown Book")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Delete book?", isPresented: $showAlert) {
                Button("Delete", role: .destructive, action: deleteBook)
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Are you sure?")
            }
            .toolbar {
                Button {
                    showAlert.toggle()
                } label: {
                    Label("Delete this book", systemImage: "trash")
                }

            }

            
            VStack {
                Text(book.author ?? "Unknown Author")
                    .font(.title)
                    .foregroundColor(.secondary)
                Text(book.review ?? "No review")
                    .padding()
                RatingView(rating: .constant(Int(book.rating)))
                    .font(.largeTitle)
            }
        }
    }
    func deleteBook() {
        moc.delete(book)
        try? moc.save()
        dismiss()
    }
}
