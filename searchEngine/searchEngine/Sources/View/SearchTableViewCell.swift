//
//  SearchTableViewCell.swift
//  searchEngine
//
//  Created by Jisoo HAM on 3/2/24.
//

import UIKit

public final class SearchTableViewCell: UITableViewCell {
    
    public let identifier = "search"
    
    private let busStopName: UILabel = {
        let lb = UILabel()
        lb.text = "강남 CC"
        lb.font = .systemFont(ofSize: 16, weight: .semibold)
        return lb
    }()
    private let busStopNumber: UILabel = {
        let lb = UILabel()
        lb.text = "12124"
        lb.font = .systemFont(ofSize: 12, weight: .semibold)
        return lb
    }()
    private let nextBusStopName: UILabel = {
        let lb = UILabel()
        lb.text = "우리집"
        lb.font = .systemFont(ofSize: 12, weight: .semibold)
        return lb
    }()
    
    private let verticalSquare: UIView = {
        let view = UIView()
        view.frame.size = .init(width: 1, height: 12)
        view.backgroundColor = .darkGray
        return view
    }()
    
    private let horiStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .leading
        stack.spacing = 2
        return stack
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        [busStopName, busStopNumber, nextBusStopName, verticalSquare, horiStack]
            .forEach { comp in
                comp.translatesAutoresizingMaskIntoConstraints = false
            }
        [busStopNumber, verticalSquare, nextBusStopName]
            .forEach { horiStack.addArrangedSubview($0) }
        addSubview(busStopName)
        addSubview(horiStack)
        
        NSLayoutConstraint.activate([
            busStopName.leadingAnchor.constraint(equalTo: leadingAnchor),
            busStopName.topAnchor.constraint(equalTo: topAnchor),
            horiStack.topAnchor.constraint(equalTo: busStopName.bottomAnchor),
            horiStack.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
    }
    
    public func bind(
        name: String,
        number: String,
        nextStop: String
    ) {
        busStopName.text = name
        busStopNumber.text = number
        nextBusStopName.text = nextStop
    }
}
