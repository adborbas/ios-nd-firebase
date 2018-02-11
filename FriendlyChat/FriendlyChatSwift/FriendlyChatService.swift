//
//  FriendlyChatService.swift
//  FriendlyChatSwift
//
//  Created by Borbas, Adam on 2018. 02. 10..
//  Copyright © 2018. Google Inc. All rights reserved.
//

import Foundation

protocol FirendlyChatServiceDelegate: class {
    func messagesReceived(_ messages: [Message])
}

protocol FirendlyChatService {
    func sendMessage(_ message: Message)
    var delegate: FirendlyChatServiceDelegate? { get set }
}
