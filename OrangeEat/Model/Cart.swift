//
//  Cart.swift
//  OrangeEat
//
//  Created by Lining Sun on 5/2/23.
//

import SwiftUI

struct Cart: Identifiable {
    var id = UUID().uuidString
    var item: Item
    var quantity: Int
}
