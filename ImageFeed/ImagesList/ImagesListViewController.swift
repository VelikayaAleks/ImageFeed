//
//  ViewController.swift
//  ImageFeed
//
//  Created by Александра Великая on 07.04.2024.
//

import UIKit

final class ImagesListViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    
    private let photosName: [String] = Array(0..<20).map{ "\($0)" }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
    
    
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        guard let image = UIImage(named: photosName[indexPath.row]) else {
            return
        }
        
        //cell.dateLabel.applyGradient()
        let isLiked = indexPath.row % 2 == 0
        let likeImage = isLiked ? UIImage(named: "Like_Active") : UIImage(named: "Like_No_Active")
        cell.likeButton.setImage(likeImage, for: .normal)
    }


}

extension UIView {
    func applyGradient() {
        let startColor = UIColor(red: 26 / 255, green: 27 / 255, blue: 34 / 255, alpha: 0.0).cgColor
        let color = UIColor(red: 26 / 255, green: 27 / 255, blue: 34 / 255, alpha: 0.2).cgColor
        let endColor = UIColor(red: 26 / 255, green: 27 / 255, blue: 34 / 255, alpha: 0.0).cgColor
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [startColor, color, endColor]
        //gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.layer.insertSublayer(gradient, at: 0)
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
}


extension ImagesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let image = UIImage(named: photosName[indexPath.row]) else {
            return 0
        }
        
        let imageInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
        let imageWidth = image.size.width
        let scale = imageViewWidth / imageWidth
        let cellHeight = image.size.height * scale + imageInsets.top + imageInsets.bottom
        return cellHeight
    }
}

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)
        
        guard let imagesListCell = cell as? ImagesListCell else {
            return UITableViewCell()
        }
        
        configCell(for: imagesListCell, with: indexPath)
        return imagesListCell
    }
    
}
