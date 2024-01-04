//
//  MovieCell.swift
//  MovieList
//
//  Created by Jisoo HAM on 1/4/24.
//

import UIKit

class MovieCell: UITableViewCell {
    
    var viewModel: MovieViewModel! {
        didSet {
            configureUI()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupStackView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let centerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = " 영화 목록 "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieOpenDtLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .leading
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    func setupStackView() {
        self.contentView.addSubview(centerLabel)
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(movieNameLabel)
        stackView.addArrangedSubview(movieOpenDtLabel)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            centerLabel.heightAnchor.constraint(equalToConstant: 30),
            movieNameLabel.heightAnchor.constraint(equalToConstant: 30),
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.centerLabel.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.centerLabel.bottomAnchor),
        ])
    }
    
    func configureUI() {
        movieNameLabel.text = viewModel.movieNm
        movieOpenDtLabel.text = viewModel.openDt
    }
}
