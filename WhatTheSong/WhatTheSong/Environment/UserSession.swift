//
//  UserSession.swift
//  WhatTheSong
//
//  Created by 강민규 on 2023/02/08.
//

import Foundation
import SwiftUI

class UserSession: ObservableObject {
    @Published private var session: Bool = false
    
    func signIn() {
        session = true
    }
    
    func signOut() {
        session = false
    }
    
    func isAccess() -> Bool {
       return session
    }
}
