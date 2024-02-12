//
//  HeaderView.swift
//  RxCollectionView
//
//  Created by Jisoo HAM on 1/28/24.
//

import UIKit

final class HeaderView: UITableViewHeaderFooterView {
    static let identifier = "HeaderView"
    
    private var titleLabel: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 16.0, weight: .semibold)
        return lb
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHeader(with title: String) {
        self.titleLabel.text = title
    }
    
    func configureUI() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
        ])
    }
}
