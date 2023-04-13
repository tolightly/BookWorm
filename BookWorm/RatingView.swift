//
//  RatingView.swift
//  BookWorm
//
//  Created by Denys Nazymok on 12.04.2023.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    
    var maxRating = 5
    var offColor = Color.gray
    var onColor = Color.yellow
    var onImage = Image(systemName: "star.fill")
    var offImage: Image?
    
    var body: some View {
        HStack {
        if label.isEmpty == false {
            Text(label)
        }
            ForEach(1..<maxRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(4))
    }
}
