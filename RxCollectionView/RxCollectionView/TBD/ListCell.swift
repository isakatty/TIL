//
//  ListCell.swift
//  RxCollectionView
//
//  Created by Jisoo HAM on 1/30/24.
//

import UIKit

class ListCell: UICollectionViewCell {
    static let identifier = "ListCell"
    
    let starLabel: UILabel = {
        let lb = UILabel()
        lb.text = "⭐️"
        lb.font = . systemFont(ofSize: 18, weight: .semibold)
        return lb
    }()
    
    let alarmLabel: UILabel = {
        let lb = UILabel()
        lb.text = "⏰"
        lb.font = . systemFont(ofSize: 18, weight: .semibold)
        return lb
    }()
    
    let totalStack: UIStackView = {
        let st = UIStackView()
        st.axis = .horizontal
        st.distribution = .equalSpacing
        st.alignment = .center
        st.spacing = 10
        return st
    }()
    
    let busNumStack: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .center
        st.spacing = 5
        return st
    }()
    
    let arrMinStack: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .center
        st.spacing = 5
        return st
    }()
    
    let arrStopStack: UIStackView = {
        let st = UIStackView()
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .center
        st.spacing = 5
        return st
    }()
    
    let busNumber: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 18, weight: .bold)
        lb.textColor = .black
        return lb
    }()
    
    let nextStopName: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 15, weight: .bold)
        lb.textColor = .black
        return lb
    }()
    
    let arr1stMsgMin: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 15, weight: .regular)
        lb.textColor = .black
        return lb
    }()
    
    let arr2ndMsgMin: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 15, weight: .regular)
        lb.textColor = .black
        return lb
    }()
    
    let arr1stMsgSt: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 11, weight: .regular)
        lb.textColor = .black
        return lb
    }()
    
    let arr2ndMsgSt: UILabel = {
        let lb = UILabel()
        lb.font = .systemFont(ofSize: 11, weight: .regular)
        lb.textColor = .black
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
}

extension ListCell {
    func configureUI() {
        [starLabel, alarmLabel, totalStack,
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
        
        [starLabel, busNumStack, arrMinStack, arrStopStack, alarmLabel]
            .forEach { components in
                totalStack.addArrangedSubview(components)
            }
        
        contentView.addSubview(totalStack)
        
        NSLayoutConstraint.activate([
            totalStack.topAnchor.constraint(equalTo: super.topAnchor, constant: 15),
            totalStack.widthAnchor.constraint(equalTo: super.widthAnchor),
            totalStack.leadingAnchor.constraint(equalTo: super.leadingAnchor),
            totalStack.trailingAnchor.constraint(equalTo: super.trailingAnchor)
        ])
    }
}
