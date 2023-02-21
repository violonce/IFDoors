//
//  DoorsModel.swift
//  IFDoors
//
//  Created by Илья on 20.02.2023.
//

import Foundation

struct IFDoorsModel : Decodable {
    var doors : [IFDoorModel] = []
    
    init(doors: [IFDoorModel]) {
        self.doors = doors
    }
    
    enum CodingKeys: String, CodingKey {
      case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.doors = try! container.decode([IFDoorModel].self, forKey: .items)
   }
}
