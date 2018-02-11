//
//  FireBaseFriendlyChat.swift
//  FriendlyChatSwift
//
//  Created by Borbas, Adam on 2018. 02. 11..
//  Copyright © 2018. Google Inc. All rights reserved.
//

import Foundation
import Firebase

class FireBaseFirendlyChat: FirendlyChatService {
    private let database: DatabaseReference
    private var childReceivedObserver: DatabaseHandle!
    
    weak var delegate: FirendlyChatServiceDelegate?
    
    init() {
        self.database = Database.database().reference()
        self.registerObservers()
    }
    
    deinit {
        self.removeObservers()
    }
    
    private func registerObservers() {
        self.childReceivedObserver = self.database.observe(.childAdded) { response in
            guard let rawData = response.value as? [String: Any] else { return }
            
            var messages = [Message]()
            for (_, entry) in rawData.enumerated() {
                if let data = try? JSONSerialization.data(withJSONObject: entry.value, options: []),
                    let message = try? JSONDecoder().decode(Message.self, from: data) {
                    messages.append(message)
                }
            }
            
            guard !messages.isEmpty else { return }
            self.delegate?.messagesReceived(messages)
        }
    }
    
    private func removeObservers() {
        self.database.removeObserver(withHandle: self.childReceivedObserver)
    }
    
    func sendMessage(_ message: Message) {
        guard let message = try? JSONEncoder().encode(message) else { return }
        self.database.child("messages").childByAutoId().setValue(message)
    }
}
