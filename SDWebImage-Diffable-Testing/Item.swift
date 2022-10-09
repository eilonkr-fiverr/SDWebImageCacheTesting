//
//  Item.swift
//  SDWebImage-Diffable-Testing
//
//  Created by Eilon Krauthamer on 06/10/2022.
//

import Foundation

struct Item: Identifiable {
    let id: UUID
    let title: String
    let image: URL
    
    static let dataSource = [
        Item(id: UUID(), title: "test1", image: URL(string: "https://picsum.photos/id/1016/1000/1000")!),
        Item(id: UUID(), title: "test2", image: URL(string: "https://picsum.photos/id/1011/1000/1000")!),
        Item(id: UUID(), title: "test3", image: URL(string: "https://picsum.photos/id/1005/1000/1000")!),
        Item(id: UUID(), title: "test4", image: URL(string: "https://picsum.photos/id/1006/1000/1000")!),
        Item(id: UUID(), title: "test5", image: URL(string: "https://picsum.photos/id/1001/1000/1000")!),
        Item(id: UUID(), title: "test6", image: URL(string: "https://picsum.photos/id/100/1000/1000")!),
        Item(id: UUID(), title: "test7", image: URL(string: "https://picsum.photos/id/1000/1000/1000")!),
        Item(id: UUID(), title: "test8", image: URL(string: "https://picsum.photos/id/1002/1000/1000")!),
        Item(id: UUID(), title: "test9", image: URL(string: "https://picsum.photos/id/1003/1000/1000")!),
        Item(id: UUID(), title: "test10", image: URL(string: "https://picsum.photos/id/1050/1000/1000")!),
        Item(id: UUID(), title: "test11", image: URL(string: "https://picsum.photos/id/1032/1000/1000")!),
        Item(id: UUID(), title: "test12", image: URL(string: "https://picsum.photos/id/1/1000/1000")!),
        Item(id: UUID(), title: "test13", image: URL(string: "https://picsum.photos/id/1004/1000/1000")!),
        Item(id: UUID(), title: "test14", image: URL(string: "https://picsum.photos/id/1005/1000/1000")!),
        Item(id: UUID(), title: "test15", image: URL(string: "https://picsum.photos/id/1006/1000/1000")!),
        Item(id: UUID(), title: "test16", image: URL(string: "https://picsum.photos/id/1020/1000/1000")!),
        Item(id: UUID(), title: "test17", image: URL(string: "https://picsum.photos/id/1008/1000/1000")!),
        Item(id: UUID(), title: "test18", image: URL(string: "https://picsum.photos/id/1009/1000/1000")!),
        Item(id: UUID(), title: "test19", image: URL(string: "https://picsum.photos/id/1010/1000/1000")!),
        Item(id: UUID(), title: "test20", image: URL(string: "https://picsum.photos/id/101/1000/1000")!)
    ]
}
