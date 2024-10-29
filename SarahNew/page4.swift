//
//  page4.swift
//  SarahNew
//
//  Created by Sara Alwadie on 25/04/1446 AH.
//
import SwiftUI

struct Page4: View {
    @State private var showAlert = false // حالة منطقية للتحكم في ظهور النافذة

    var body: some View {
        VStack(spacing: 0) {
            // الجزء العلوي بخلفية ملونة
            ZStack {
                Spacer()
                Color("graay1") // الخلفية الرمادية للجزء العلوي
                    .ignoresSafeArea(edges: .top)
          
                VStack(alignment: .leading, spacing: 8) {
                    Spacer()
                    Spacer()
                    Spacer()
                    HStack {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.orange)
                            
                            Button("back") {
                                // Action for back button
                            }
                            .foregroundColor(.orange)
                        }
                        
                        Spacer()
                        
                        Button("Edit") {
                            // Action for edit button
                        }
                        .foregroundColor(.orange)
                    }
                    .padding(.horizontal)
                    
                    Text("Halomi Salad")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading)
                }
                .padding(.vertical, 20) // التباعد العلوي والسفلي
            }
            Spacer()
            
            Image("hallomi") // تأكد من إضافة صورة باسم "hallomi" إلى الأصول
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: 180) // تثبيت الارتفاع لتناسب الصورة مع التصميم
                .clipped()
            
            Spacer()
            Spacer()
            
            Text("Semi-hard cheese typically made from the milk of goats, sheep, or cows. It's known for its tangy taste and firm, chewy texture.")
                .font(.caption)
                .padding(.horizontal)
                .multilineTextAlignment(.leading)
            
            Divider()
                .padding(.vertical, 8)
            
            VStack(alignment: .leading, spacing: 12) {
                Spacer()
                
                Text("Ingredients")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                
                HStack {
                    Text("1")
                        .font(.headline)
                        .padding(.horizontal, 8)
                        .cornerRadius(4)
                        .foregroundColor(Color("orAAnge"))
                    
                    Text("Plasamic")
                        .font(.headline)
                    
                    Spacer()
                    
                    Text("🥄 Spoon")
                        .font(.subheadline)
                        .padding()
                        .frame(width: 110.0, height: 29.0)
                        .background(Color("orAAnge"))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                }
                .foregroundColor(.red)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("graay2"))
                .cornerRadius(8)
                .padding(.horizontal)
            }
            .padding(.bottom, 250)
            
            // زر الحذف
            Button(action: {
                showAlert = true // إظهار نافذة التأكيد عند الضغط على زر الحذف
            }) {
                Text("Delete Recipe")
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("graay2"))
                    .cornerRadius(8)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Delete a recipe"),
                    message: Text("Are you sure you want to delete the recipe?"),
                    primaryButton: .destructive(Text("Yes")) {
                        // وضع الكود الخاص بعملية الحذف هنا
                        print("Recipe deleted")
                    },
                    secondaryButton: .cancel()
                )
            }
            
            Spacer()
            Spacer()
            .padding()
        }
        .background(Color("backgroundColor"))
        .ignoresSafeArea()
    }
}

struct Page4_Previews: PreviewProvider {
    static var previews: some View {
        Page4()
    }
}



