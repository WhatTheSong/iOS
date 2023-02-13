//
//  WriteRecommendSongView.swift
//  WhatTheSong
//
//  Created by 이봄이 on 2023/02/05.
//

import SwiftUI

struct WriteRecommendSongView: View {
    
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var selectedImageName: String?
    @State var image: Image?
    @State var imgName: String?
    
    @State private var title = ""
    @State private var titlePlaceholderText = "제목"
    @State private var contents = ""
    @State private var contentsPlaceholderText = "내용"
//    var category: String = "카테고리 선택하기"
    
    @State private var showingCategoryView = false

    @State var selectedCategoryNameFinal: String?
    @State var categoryNameFinal: String?
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
        imgName = selectedImageName
    }
    
    func setCategoryName() {
        self.categoryNameFinal = selectedCategoryNameFinal
        print("마지막 \(categoryNameFinal)")
    }
    
    var body: some View {
        VStack(spacing: 20) {
            if let image = image { image
                                .resizable()
                                .frame(width: 200, height: 200)
                
            } else {
                Image(systemName: "plus.viewfinder")
                    .resizable()
                    .foregroundColor(.gray)
                    .frame(width: 200, height: 200)
            }
            ZStack {
                if self.title.isEmpty {
                    TextEditor(text: $titlePlaceholderText)
                        .padding(.all, 1.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40)
                        .foregroundColor(.gray)
                        .disabled(true)
                }
                TextEditor(text: $title)
                    .padding(.all, 1.0)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.ourOrange, lineWidth: 1))
                    .opacity(self.title.isEmpty ? 0.7 : 1)
            }.padding(.init(top: 30, leading: 30, bottom: 0, trailing: 30))
            
            ZStack {
                if self.contents.isEmpty {
                    TextEditor(text: $contentsPlaceholderText)
                        .padding(.all, 1.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                        .foregroundColor(.gray)
                        .disabled(true)
                }
                TextEditor(text: $contents)
                    .padding(.all, 1.0)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.ourOrange, lineWidth: 1))
                    .opacity(self.contents.isEmpty ? 0.7 : 1)
            }.padding(.init(top: 0, leading: 30, bottom: 30, trailing: 30))
            
            
            HStack {
                Button(action: {showImagePicker.toggle()}) {
                    Image("upload")
                }
                .sheet(isPresented: $showImagePicker, onDismiss: {
                    loadImage()
                }) {
                    ImagePicker(image: $selectedUIImage, imageName: $selectedImageName)
                }
                .padding(.leading, 30)
                Spacer()
                
                if let imgName = imgName {
                    Text(imgName)
                        .padding(.trailing, 30)
                        .lineLimit(1)
                } else {
                    Text("파일 첨부하기")
                        .padding(.trailing, 30)
                }
                
                
            }
            
            HStack {
                Button(action: {
                    showingCategoryView.toggle()
                }) {
                    Image("category")
                }.padding(.leading, 30)
                    .sheet(isPresented: $showingCategoryView, onDismiss: {
                        setCategoryName()
                        
                    }) {
                        Text("카테고리 선택하기")
                            .font(.system(size: 25, weight: .bold))
                            .padding(.top, 20)
                        CategoryView(stateOfCategory: .large, categoryName: $selectedCategoryNameFinal)
                            .presentationDetents([.medium ,.large])
                        
                    }
                Spacer()
                
                if let categoryName = categoryNameFinal {
                    Text(categoryName)
                        .padding(.trailing, 30)
                        .lineLimit(1)
                } else {
                    Text("카테고리 선택하기")
                        .padding(.trailing, 30)
                }
            }
        }
    }
}

struct WriteRecommendSongView_Previews: PreviewProvider {
    static var previews: some View {
        WriteRecommendSongView()
    }
}
