//
//  ViewModel.swift
//  SDWebImage-Diffable-Testing
//
//  Created by Eilon Krauthamer on 06/10/2022.
//

import Foundation

class ViewModel {
    let data: [Item.ID: Item] = Item.dataSource.reduce(into: [:]) { partialResult, item in
        partialResult[item.id] = item
    }
    
    var selectedItemIdentifiers = Set<Item.ID>()
}
