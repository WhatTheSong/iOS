//
//  ImagePicker.swift
//  WhatTheSong
//
//  Created by 이봄이 on 2023/02/04.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var mode
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    @Binding var imageName: String?
    
}

extension ImagePicker {
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
            let parent: ImagePicker
            
            init(_ parent: ImagePicker) {
                self.parent = parent
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                guard let image = info[.originalImage] as? UIImage else { return }
                parent.image = image
                parent.mode.wrappedValue.dismiss()
                // 이미지 url을 먼저 가져옴
                // url의 lastPathComponent 하면 이미지 이름인듯?
                guard let imageUrl = info[.imageURL] as? URL else { return }
                guard let imageName = imageUrl.lastPathComponent as? String else { return }
                parent.imageName = imageName
            }
        }
}
