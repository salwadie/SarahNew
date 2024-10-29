//
//  page2.swift
//  SarahNew
//
//  Created by Sara Alwadie on 20/04/1446 AH.
//
import SwiftUI
import UIKit

struct Page2: View {
    @State private var recipeTitle: String = ""
    @State private var recipeDescription: String = ""
    @State private var selectedImage: UIImage? = nil
    @State private var showImagePicker: Bool = false
    @State private var ingredients: [String] = []
    @State private var showAddIngredient = false
    @State private var ingredientName = ""
    @State private var measurement = "Spoon"
    @State private var serving = 1

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Upload Photo Section
            ZStack {
                if let image = selectedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        .clipped()
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 181)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        .overlay(
                            VStack {
                                Image(systemName: "photo.on.rectangle.angled")
                                    .font(.system(size: 50))
                                    .foregroundColor(.orange)
                                Text("Upload Photo")
                                    .foregroundColor(.orange)
                            }
                        )
                        .onTapGesture {
                            showImagePicker = true
                        }
                }
            }
            .padding(.horizontal)
            
            // Title TextField
            Text("Title")
                .font(.headline)
                .padding(.horizontal)
            
            TextField("Title", text: $recipeTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            // Description TextField
            Text("Description")
                .font(.headline)
                .padding(.horizontal)
            
            TextField("Description", text: $recipeDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            // Ingredients Section
            HStack {
                Text("Add Ingredient")
                    .font(.headline)
                
                Spacer()
                
                Button(action: {
                    showAddIngredient = true
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.orange)
                        .font(.headline)
                        .fontWeight(.bold)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationTitle("New Recipe")
        .navigationBarItems(
            leading: Button("Back") {
                // يمكنك هنا إضافة الأكشن للعودة إلى الشاشة السابقة إذا كنت تستخدم `NavigationLink`
            }
            .foregroundColor(.orange),
            trailing: Button("Save") {
                print("Recipe saved")
                // يمكنك هنا تنفيذ عملية الحفظ
            }
            .foregroundColor(.orange)
        )
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $selectedImage)
        }
        .sheet(isPresented: $showAddIngredient) {
            AddIngredientView(
                ingredientName: $ingredientName,
                measurement: $measurement,
                serving: $serving,
                onAdd: {
                    if !ingredientName.isEmpty {
                        ingredients.append("\(serving) \(measurement) of \(ingredientName)")
                        ingredientName = ""
                        serving = 1
                        measurement = "Spoon"
                        showAddIngredient = false
                    }
                },
                onCancel: {
                    showAddIngredient = false
                }
            )
        }
    }
}

struct AddIngredientView: View {
    @Binding var ingredientName: String
    @Binding var measurement: String
    @Binding var serving: Int
    let measurements = ["Spoon", "Cup"]
    var onAdd: () -> Void
    var onCancel: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Ingredient Name")
                .font(.headline)
            
            TextField("Ingredient Name", text: $ingredientName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Text("Measurement")
                .font(.headline)
            
            HStack {
                ForEach(measurements, id: \.self) { measure in
                    Button(action: {
                        measurement = measure
                    }) {
                        Text(measure)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(measurement == measure ? Color.orange : Color.gray.opacity(0.2))
                            .foregroundColor(measurement == measure ? .white : .black)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)
            
            Text("Serving")
                .font(.headline)
            
            HStack {
                Button(action: {
                    if serving > 1 {
                        serving -= 1
                    }
                }) {
                    Image(systemName: "minus")
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }

                Text("\(serving)")
                    .font(.title2)
                    .frame(width: 50)
                
                Button(action: {
                    serving += 1
                }) {
                    Image(systemName: "plus")
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                
                Text(measurement)
                    .padding(.leading)
            }
            .padding(.horizontal)
            
            HStack(spacing: 20) {
                Button(action: {
                    onCancel()
                }) {
                    Text("Cancel")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    onAdd()
                }) {
                    Text("Add")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct Page2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Page2()
        }
    }
}

