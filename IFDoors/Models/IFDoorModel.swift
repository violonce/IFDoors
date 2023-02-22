//
//  DoorModel.swift
//  IFDoors
//
//  Created by Илья on 20.02.2023.
//

import Foundation

struct IFDoorModel : Decodable {
    var id: Int?
    var title: String?
    var description: String?
    var locked: Bool?
    var loading: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case locked
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        let locked = try container.decode(Bool.self, forKey: .locked)
        self.locked = locked//try container.decode(Bool.self, forKey: .locked)
    }
}
