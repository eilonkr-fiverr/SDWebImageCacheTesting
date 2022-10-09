//
//  CustomTableViewCell.swift
//  SDWebImage-Diffable-Testing
//
//  Created by Eilon Krauthamer on 06/10/2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var selectionView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(item: Item, isSelected: Bool) {
        titleLabel.text = item.title
        profileImageView.sd_setImage(with: item.image, placeholderImage: UIImage(systemName: "person"))
        selectionView.backgroundColor = isSelected ? .systemGreen : .systemGray5
    }
}
