//
//  Untitled.swift
//  SarahNew
//
//  Created by Sara Alwadie on 26/04/1446 AH.
//

import SwiftUI
import UIKit


//Recipe يمثل الوصفة

struct Recipe: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let description: String
    let image: UIImage?
    let ingredients: [String]
}

 //ViewModel لإدارة قائمة الوصفات ومشاركتها بين الصفحات
    class RecipesViewModel: ObservableObject {
        @Published var recipes: [Recipe] = []
        
    }
