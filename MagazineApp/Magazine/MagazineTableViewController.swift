//
//  MagazineTableViewController.swift
//  MagazineApp
//
//  Created by 은서우 on 2024/01/09.
//

import UIKit
import Kingfisher

class MagazineTableViewController: UITableViewController {
    
    let list = MagazineInfo.magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // separator 선 없애기
        tableView.separatorStyle = .none
        // 행의 높이
        tableView.rowHeight = 460
    }
    
}

extension MagazineTableViewController {
    
    // 1. 행의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    // 2. 각 행 view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MagazineTableViewCell") as! MagazineTableViewCell
        
        // 이미지뷰
        cell.MagazineimageView.layer.cornerRadius = 10

        let url = URL(string: list[indexPath.row].photo_image)
        cell.MagazineimageView.kf.setImage(with: url)
        cell.MagazineimageView.contentMode = .scaleAspectFill
        
        // title Label
        cell.titleLabel.text = list[indexPath.row].title
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.font = .boldSystemFont(ofSize: 20)
        cell.titleLabel.lineBreakMode = .byWordWrapping
        // subtitle Label
        cell.subTitleLabel.text = list[indexPath.row].subtitle
        cell.subTitleLabel.font = .systemFont(ofSize: 14, weight: .light)
        
        // Date Label
        // string -> date
        let format = DateFormatter()
        format.dateFormat = "yyMMdd"
        let convertedDate = format.date(from: list[indexPath.row].date)
        // date -> string
        let mydateformatter = DateFormatter()
        mydateformatter.dateFormat = "yy년 M월 d일"
        cell.dateLabel.text = mydateformatter.string(from: convertedDate!)
        cell.dateLabel.font = .systemFont(ofSize: 12, weight: .light)
        cell.dateLabel.textColor = .lightGray
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1. 스토리보드 찾기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        //2. 뷰 컨트롤러 찾기
        let vc = sb.instantiateViewController(withIdentifier: MagazineDetailViewController.identifier) as! MagazineDetailViewController
        //3. 데이터 전송
        vc.urlString = list[indexPath.row].link
        //4. 뷰 컨트롤러 전환 : Push - Pop
        navigationController?.pushViewController(vc, animated: true)
        // select 상태를 풀고 싶을 때
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
    
}
