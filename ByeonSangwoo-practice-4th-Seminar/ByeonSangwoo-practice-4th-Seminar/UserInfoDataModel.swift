//
//  UserInfoDataModel.swift
//  ByeonSangwoo-practice-4th-Seminar
//
//  Created by 변상우 on 11/11/23.
//

import Foundation

// MARK: - UserInfoDataModel
struct UserInfoDataModel: Codable {
    let username, nickname: String
    
    enum CodingKeys: CodingKey {
        case username
        case nickname
    }
}
