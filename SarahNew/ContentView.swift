//
//  ContentView.swift
//  SarahNew
//
//  Created by Sara Alwadie on 17/04/1446 AH.
//
import SwiftUI

struct ContentView: View {
    @StateObject var recipesViewModel = RecipesViewModel() // كائن مشترك للوصفات
    @State private var showRecipesView = false // للتحكم في عرض RecipesView

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                Image(systemName: "fork.knife.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                    .foregroundColor(Color("orAAnge"))

                if recipesViewModel.recipes.isEmpty {
                    // عرض رسالة عندما لا توجد وصفات
                    Text("There's no recipe yet")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)

                    Text("Please add your recipes")
                        .font(.body)
                        .foregroundColor(.black)
                        .padding(.top, 10)
                }

                Spacer()

                // رابط إلى Page2 لإضافة وصفة جديدة
                NavigationLink(destination: Page2().environmentObject(recipesViewModel), isActive: $showRecipesView) {
                    EmptyView()
                }

                Button(action: {
                    showRecipesView = true
                }) {
                    Text("Add Recipe")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("orAAnge"))
                        .cornerRadius(8)
                }
            }
            .navigationTitle("Food Recipes")
            .onChange(of: recipesViewModel.recipes) { _ in
                // التحقق من عدد الوصفات، إذا زاد، عرض RecipesView
                if !recipesViewModel.recipes.isEmpty {
                    showRecipesView = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

