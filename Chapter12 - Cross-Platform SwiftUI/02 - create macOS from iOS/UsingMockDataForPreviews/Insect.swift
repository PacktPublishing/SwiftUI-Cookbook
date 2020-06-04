//
//  Insect.swift
//  UsingMockDataForPreviews
//
//  Created by Edgar Nzokwe on 4/12/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import Foundation


struct Insect : Decodable, Identifiable, Hashable{
    var id: Int
    var imageName:String
    var name:String
    var habitat:String
    var description:String
}

let testInsect = Insect(id: 1, imageName: "grasshopper", name: "grass", habitat: "bod", description: "sije")
