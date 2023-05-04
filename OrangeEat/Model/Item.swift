//
//  Item.swift
//  OrangeEat
//
//  Created by Lining Sun on 5/2/23.
//

import SwiftUI

struct Item: Identifiable {
    var id: String
    var item_name: String
    var item_cost: Double
    var item_details: String
    var item_image: String
    var item_ratings: String
    // To identify whether it is added to the cart
    var isAdded: Bool = false
}
