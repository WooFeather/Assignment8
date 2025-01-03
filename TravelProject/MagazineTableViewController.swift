//
//  MagazineTableViewController.swift
//  TravelProject
//
//  Created by 조우현 on 1/3/25.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {

    var magazines = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazines.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineTableViewCell", for: indexPath) as! MagazineTableViewCell
        let row = magazines[indexPath.row]
        
        // 아래 이미지, 타이틀 등을 묶어서 분리할 수 없을까?
        let url = URL(string: row.photo_image)
        cell.magazineImageView.kf.setImage(with: url)
        cell.magazineImageView.contentMode = .scaleAspectFill
        cell.magazineImageView.layer.cornerRadius = 10
        
        cell.titleLabel.text = row.title
        cell.titleLabel.textColor = .magazineTitle
        cell.titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        cell.titleLabel.numberOfLines = 0
        
        cell.subtitleLabel.text = row.subtitle
        cell.subtitleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        cell.subtitleLabel.textColor = .gray
        
        cell.dateLabel.text = row.date.toDate()?.toString() ?? "날짜오류"
        cell.dateLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        cell.dateLabel.textColor = .gray
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}
