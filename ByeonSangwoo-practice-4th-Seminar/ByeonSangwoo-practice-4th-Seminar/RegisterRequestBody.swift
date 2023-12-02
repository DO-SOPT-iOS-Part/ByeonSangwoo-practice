//
//  RegisterRequestBody.swift
//  ByeonSangwoo-practice-4th-Seminar
//
//  Created by 변상우 on 11/11/23.
//

import Foundation

struct RegisterRequestBody: Codable {
    let username: String
    let password: String
    let nickname: String
}
