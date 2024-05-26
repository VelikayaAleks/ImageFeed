//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Александра Великая on 23.05.2024.
//
import UIKit
import Foundation

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
}
