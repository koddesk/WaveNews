//
//  RecommendedTableView.swift
//  WaveNews
//
//  Created by KODDER on 15.05.2023.
//

import UIKit

class RecommendedTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
    }
    
    private func configure() {
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        bounces = false
        showsVerticalScrollIndicator = false
        separatorStyle = .none
        
        delegate = self
        dataSource = self
        register(RecommendedTableHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        register(RecommendedTableViewCell.self, forCellReuseIdentifier: RecommendedTableViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UITableViewDataSource
extension RecommendedTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RecommendedTableViewCell.identifier, for: indexPath) as? RecommendedTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

//MARK: - UITableViewDelegate
extension RecommendedTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = dequeueReusableHeaderFooterView(withIdentifier: "header")
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
