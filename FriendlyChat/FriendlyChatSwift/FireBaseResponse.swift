//
//  MessageResponse.swift
//  FriendlyChatSwift
//
//  Created by Borbas, Adam on 2018. 02. 11..
//  Copyright © 2018. Google Inc. All rights reserved.
//

import Foundation

class FireBaseResponse<FireBaseValue: Decodable>: Decodable {
    let key: String
    let value: FireBaseValue
    
    init(key: String, value: FireBaseValue) {
        self.key = key
        self.value = value
    }
    
//    required init(from decoder: Decoder) throws {
        //        let values = try decoder.container(keyedBy: CodingKeys.self)
        //        latitude = try values.decode(Double.self, forKey: .latitude)
        //        longitude = try values.decode(Double.self, forKey: .longitude)
        //
        //        let additionalInfo = try values.nestedContainer(keyedBy: AdditionalInfoKeys.self, forKey: .additionalInfo)
        //        elevation = try additionalInfo.decode(Double.self, forKey: .elevation)
//    }
}
