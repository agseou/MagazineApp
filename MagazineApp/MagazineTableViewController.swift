//
//  MagazineTableViewController.swift
//  MagazineApp
//
//  Created by 은서우 on 2024/01/09.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {
    
    let list = MagazineInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // separator 선 없애기
        tableView.separatorStyle = .none
        // 행의 높이
        tableView.rowHeight = 460
    }
    
    // 1. 행의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.magazine.count
    }
    
    // 2. 각 행 view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineTableViewCell") as! MagazineTableViewCell
        
        // 이미지뷰
        cell.MagazineimageView.layer.cornerRadius = 10

        let url = URL(string: list.magazine[indexPath.row].photo_image)
        cell.MagazineimageView.kf.setImage(with: url)
        cell.MagazineimageView.contentMode = .scaleAspectFill
        
        // title Label
        cell.titleLabel.text = list.magazine[indexPath.row].title
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.font = .boldSystemFont(ofSize: 20)
        cell.titleLabel.lineBreakMode = .byWordWrapping
        // subtitle Label
        cell.subTitleLabel.text = list.magazine[indexPath.row].subtitle
        cell.subTitleLabel.font = .systemFont(ofSize: 14, weight: .light)
        
        // Date Label
        // string -> date
        let format = DateFormatter()
        format.dateFormat = "yyMMdd"
        let convertedDate = format.date(from: list.magazine[indexPath.row].date)
        // date -> string
        let mydateformatter = DateFormatter()
        mydateformatter.dateFormat = "yy년 M월 d일"
        cell.dateLabel.text = mydateformatter.string(from: convertedDate!)
        cell.dateLabel.font = .systemFont(ofSize: 12, weight: .light)
        cell.dateLabel.textColor = .lightGray
   
        //그림자
//        cell.shadowView.layer.shadowColor = UIColor.black.cgColor
//        cell.shadowView.layer.shadowOpacity = 0.5
//        cell.shadowView.layer.shadowRadius = 10
//        cell.layer.cornerRadius = 15
//        cell.shadowView.backgroundColor = .clear
//        cell.shadowView.clipsToBounds = false
        
        cell.selectionStyle = .none
        
        return cell
    }
    

   
}
