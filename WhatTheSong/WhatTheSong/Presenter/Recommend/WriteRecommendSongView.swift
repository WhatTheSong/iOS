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
    @State var image: Image?
    @State private var title = ""
    @State private var titlePlaceholderText = "제목"
    @State private var contents = ""
    @State private var contentsPlaceholderText = "내용"
    var fileName: String = "파일 업로드"
    var category: String = "카테고리 선택하기"
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
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
            
//            Button(action: {showImagePicker.toggle()}) {
//                Image(systemName: "photo")
//            }
//            .sheet(isPresented: $showImagePicker, onDismiss: {
//                loadImage()
//            }) {
//                ImagePicker(image: $selectedUIImage)
//            }
            
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
            }.padding(.horizontal, 30)
            
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
            }.padding(.horizontal, 30)
            
            
            HStack {
                Button(action: {showImagePicker.toggle()}) {
                    Image("upload")
                }
                .sheet(isPresented: $showImagePicker, onDismiss: {
                    loadImage()
                }) {
                    ImagePicker(image: $selectedUIImage)
                }
                .padding(.leading, 30)
                Spacer()
                
                Text(fileName)
                    .padding(.trailing, 30)
            }
            
            HStack {
                Button(action: { }) {
                    Image("category")
                }.padding(.leading, 30)
                Spacer()
                
                Text(category)
                    .padding(.trailing, 30)
            }
        }
    }
}

struct WriteRecommendSongView_Previews: PreviewProvider {
    static var previews: some View {
        WriteRecommendSongView()
    }
}
