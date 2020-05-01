//
//  Currency.swift
//  UsingTabViews
//
//  Created by Edgar Nzokwe on 5/1/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import Foundation

struct Currency: Identifiable {
    let id = UUID()
    var name:String
    var image:String
}

var currencies = [Currency(name: "Dollar", image: "dollarsign.circle.fill"),
                  Currency(name: "Sterling", image: "sterlingsign.circle.fill"),
                Currency(name: "Euro", image: "eurosign.circle.fill"),
                Currency(name: "Yen", image: "yensign.circle.fill"),
                Currency(name: "Naira", image: "nairasign.circle.fill")]
