//
//  TableCell.swift
//  RxCollectionView
//
//  Created by Jisoo HAM on 1/30/24.
//

import UIKit

import RxSwift

class TableCell: UITableViewCell {
    static let identifier = "TableCell"
    
    var disposeBag = DisposeBag()
    
    let starBtn: UIButton = {
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: "star")
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .clear
        let btn = UIButton(configuration: config)
        return btn
    }()
    
    let alarmBtn: UIButton = {
        var config = UIButton.Configuration.filled()
        config.image = UIImage(systemName: "alarm")
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5)
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .clear
        let btn = UIButton(configuration: config)
        return btn
    }()
    
    private let totalStack: UIStackView = {
        let st = UIStackView()
        st.axis = .horizontal
        st.distribution = .fill
        st.alignment = .center
        st.spacing = 10
        return st
    }()
    
    private let busNumStack: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .leading
        st.spacing = 5
        return st
    }()
    
    private let arrMinStack: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .leading
        st.spacing = 5
        return st
    }()
    
    private let arrStopStack: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .leading
        st.spacing = 5
        return st
    }()
    
    private let busNumber: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        lb.textColor = .black
        return lb
    }()
    
    private let nextStopName: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 15, weight: .bold)
        lb.textColor = .black
        return lb
    }()
    
    private let arr1stMsgMin: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 15, weight: .regular)
        lb.textColor = .black
        return lb
    }()
    
    private let arr2ndMsgMin: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 15, weight: .regular)
        lb.textColor = .black
        return lb
    }()
    
    private let arr1stMsgSt: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 11, weight: .regular)
        lb.textColor = .black
        return lb
    }()
    
    private let arr2ndMsgSt: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 11, weight: .regular)
        lb.textColor = .black
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(with item: CellInfo) {
        busNumber.text = item.busNm
        nextStopName.text = item.nextSt
        arr1stMsgMin.text = item.arrMsgMin1
        arr2ndMsgMin.text = item.arrMsgMin2
        arr1stMsgSt.text = item.arrMsgSt1
        arr2ndMsgSt.text = item.arrMsgSt2
    }
    
    override func prepareForReuse() {
        starBtn.configuration?.image = UIImage(systemName: "star")
        alarmBtn.configuration?.image = UIImage(systemName: "alarm")
        [busNumber, nextStopName, arr1stMsgSt, arr1stMsgMin, arr2ndMsgSt, arr2ndMsgMin]
            .forEach { components in
                components.text = ""
            }
    }
}

extension TableCell {
    func configureUI() {
        [starBtn, alarmBtn, totalStack,
         busNumStack, arrMinStack, arrStopStack,
         busNumber, nextStopName, arr1stMsgSt,
         arr1stMsgMin, arr2ndMsgSt, arr2ndMsgMin]
            .forEach { components in
                components.translatesAutoresizingMaskIntoConstraints = false
            }
        
        [busNumber, nextStopName]
            .forEach { components in
                busNumStack.addArrangedSubview(components)
            }
        
        [arr1stMsgMin, arr2ndMsgMin]
            .forEach { components in
                arrMinStack.addArrangedSubview(components)
            }
        
        [arr1stMsgSt, arr2ndMsgSt]
            .forEach { components in
                arrStopStack.addArrangedSubview(components)
            }
        
        [starBtn, busNumStack, arrMinStack, arrStopStack, alarmBtn]
            .forEach { components in
                totalStack.addArrangedSubview(components)
            }
        
        contentView.addSubview(totalStack)
        
        NSLayoutConstraint.activate([
            totalStack.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            totalStack.widthAnchor.constraint(equalTo: widthAnchor, constant: -10),
            totalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            totalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
