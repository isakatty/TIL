//
//  DetailViewController.swift
//  MovieListApp
//
//  Created by Jisoo HAM on 1/4/24.
//

import UIKit

class DetailViewController: UIViewController {

    let movieIdLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "영화 이름 :"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var movieNmLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var movieNmStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [movieIdLabel, movieNmLabel])
        stview.spacing = 5
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    let movieDtLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "개봉 날짜 :"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var movieRealDtLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var timeStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [movieDtLabel, movieRealDtLabel])
        sv.spacing = 5
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let audienceLabel: UILabel = {
        let label = UILabel()
        label.text = "총 관람객 : "
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var audienceRealLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var audienceStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [audienceLabel, audienceRealLabel])
        sv.spacing = 5
        sv.axis = .horizontal
        sv.distribution = .fill
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [movieNmStackView, timeStackView, audienceStackView])
        sv.spacing = 10
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let labelWidth: CGFloat = 70
    var stackViewTopConstraint: NSLayoutConstraint!
    
    var viewModel: MovieViewModel
    
    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setupMovieUI()
        setConstraints()
    }
    
    func configureUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        setConstraints()
    }
    
    func setupMovieUI() {
        movieNmLabel.text = viewModel.movieNm
        movieRealDtLabel.text = viewModel.openDt
        audienceRealLabel.text = viewModel.audiAc
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            movieIdLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            movieNmLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            movieDtLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            movieRealDtLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            audienceLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            audienceRealLabel.widthAnchor.constraint(equalToConstant: labelWidth),
        ])
        
        stackViewTopConstraint = stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10)
        
        NSLayoutConstraint.activate([
            stackViewTopConstraint,
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
}
