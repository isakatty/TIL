//
//  BusStopInfoHeaderView.swift
//  RxCollectionView
//
//  Created by Jisoo HAM on 1/30/24.
//

import UIKit

class BusStopInfoHeaderView: UIView {
    
    let textStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let btnStack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .systemBlue
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var busStopNumLb: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "23290"
        label.font = .systemFont(ofSize: 15,
                                 weight: .regular)
        label.textColor = .white
        return label
    }()
    
    var busStopNameLb: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "강남구 보건소"
        label.font = .systemFont(ofSize: 20,
                                 weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    var nextStopNameLb: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "강남구청역 방면"
        label.font = .systemFont(ofSize: 16,
                                 weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let favoriteBtn: UIButton = {
        var config = UIButton.Configuration.filled()
        
        config.image = UIImage(systemName: "star")
        
        
        var title = AttributedString.init(stringLiteral: "즐겨찾기")
        title.font = .systemFont(ofSize: 15,
                                 weight: .regular)
        config.attributedTitle = title
        
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .orange
        
        config.titlePadding = 10
        config.imagePadding = 10
        config.contentInsets = NSDirectionalEdgeInsets.init(
            top: 10,
            leading: 10,
            bottom: 10,
            trailing: 10
        )
        config.cornerStyle = .capsule
        
        let btn = UIButton(configuration: config)
        btn.tintColor = .orange
        return btn
    }()
    
    let mapBtn: UIButton = {
        var config = UIButton.Configuration.filled()
        
        config.image = UIImage(systemName: "map")
        
        var title = AttributedString.init(stringLiteral: "지도")
        title.font = .systemFont(
            ofSize: 15,
            weight: .regular
        )
        config.attributedTitle = title
        
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .orange
        
        config.titlePadding = 10
        config.imagePadding = 10
        config.contentInsets = NSDirectionalEdgeInsets.init(
            top: 10,
            leading: 10,
            bottom: 10,
            trailing: 10
        )
        config.cornerStyle = .capsule
        
        let btn = UIButton(configuration: config)
        btn.tintColor = .orange
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBlue
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BusStopInfoHeaderView {
    func configureUI() {
        configureSetup()
        configureLayouts()
    }
    
    func configureSetup() {
        self.addSubview(textStack)
        textStack.addArrangedSubview(busStopNumLb)
        textStack.addArrangedSubview(busStopNameLb)
        textStack.addArrangedSubview(nextStopNameLb)
        textStack.addArrangedSubview(btnStack)
        
        btnStack.addArrangedSubview(favoriteBtn)
        btnStack.addArrangedSubview(mapBtn)
    }
    
    func configureLayouts() {
        
        NSLayoutConstraint.activate([
            textStack.leadingAnchor.constraint(
                equalTo: leadingAnchor
            ),
            textStack.trailingAnchor.constraint(
                equalTo: trailingAnchor
            ),
            textStack.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            textStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
    }
}
