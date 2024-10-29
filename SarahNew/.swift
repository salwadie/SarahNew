//
//  RecipesView 2.swift
//  SarahNew
//
//  Created by Sara Alwadie on 21/04/1446 AH.
//


import SwiftUI

struct RecipesView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
              
                // Title
                Text("Food Recipes")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20.0)
                    .padding(.top, 20.0)
                
                // Search Bar
                HStack {
                    TextField("Search", text: $searchText)
                        .padding(10)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .overlay(
                            HStack {
                                Spacer()
                                Image(systemName: "mic.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 10)
                            }
                        )
                        .padding(.horizontal, 20.0)
                    
                    Button(action: {
                        // Action for adding a new recipe
                        print("Add button tapped")
                    }) {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.orange)
                    }
                    .padding(.trailing, 20.0)
                }
                
                // Recipe Card with Image
                ZStack(alignment: .bottomLeading) {
                    Image("hallomi") // استبدل "hallomi" باسم الصورة الفعلي في الأصول
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width - 20, height: 250)
                        .cornerRadius(10)
                        .clipped()
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.black.opacity(0.7), Color.clear]),
                                startPoint: .bottom,
                                endPoint: .center
                            )
                            .cornerRadius(10)
                        )
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Halomi Salad")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("semi-hard cheese typically made from the milk of goats, sheep, or cows. It's known for its tangy taste and firm, chewy texture.")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .lineLimit(2)
                        
                        Button(action: {
                            // Action for "See All"
                            print("See All tapped")
                        }) {
                            Text("See All")
                                .font(.subheadline)
                                .foregroundColor(.orange)
                                .padding(.top, 5)
                        }
                    }
                    .padding(16)
                }
                .padding(.horizontal, 20.0)
                .padding(.top, 10.0)
                
                Spacer()
            }
            .navigationBarHidden(true) // Hide the default navigation bar
        }
    }
}

struct RecipesView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesView()
    }
}
