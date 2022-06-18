//
//  CodeViewController.swift
//  0618스터디(테이블뷰)
//
//  Created by 언체인, 현이, 그루트, 키위 on 2022/06/18.
//

import UIKit

class CodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var menu: [FoodType: [Food]] = [
        .American: [
            Food(name: "햄버거", price: 5000),
            Food(name: "피자", price: 18000),
            Food(name: "아메리카노", price: 41000)
        ],
        .Chinese: [
            Food(name: "탕수육", price: 18000)
        ],
        .Korean: [
            Food(name: "비빔밥", price: 8000),
            Food(name: "돼지갈비", price: 20000)
        ],
        .Japanese: [
            Food(name: "스시", price: 20000),
            Food(name: "스윙스(돈까스)", price: 5000)
        ]
    ]
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        return tableView
    }()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return menu[.American]!.count
        case 1 :
            return menu[.Chinese]!.count
        case 2 :
            return menu[.Korean]!.count
        default :
            return menu[.Japanese]!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        
                cell.imageView?.image = UIImage(systemName: "circle")
        //        cell.textLabel?.text = "안녕하세요 \(indexPath.row)행 입니다."
        switch indexPath.section {
        case 0 :
            let test = menu[.American]
            cell.textLabel?.text = test![indexPath.row].name
        case 1 :
            let test = menu[.Chinese]
            cell.textLabel?.text = test![indexPath.row].name
        case 2 :
            let test = menu[.Korean]
            cell.textLabel?.text = test![indexPath.row].name
        default :
            let test = menu[.Japanese]
            cell.textLabel?.text = test![indexPath.row].name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0 :
            return FoodType.American.rawValue
        case 1 :
            return FoodType.Chinese.rawValue
        case 2 :
            return FoodType.Korean.rawValue
        default :
            return FoodType.Japanese.rawValue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        setTableView()
    }
    
    private func setTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)])
    }
}
