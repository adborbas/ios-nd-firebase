//
//  Message.swift
//  FriendlyChatSwift
//
//  Created by Borbas, Adam on 2018. 02. 10..
//  Copyright © 2018. Google Inc. All rights reserved.
//

import Foundation

struct Message: Codable {
    let user: String
    let text: String
    
    private enum CodingKeys: String, CodingKey {
        case user = "name"
        case text
    }
}
