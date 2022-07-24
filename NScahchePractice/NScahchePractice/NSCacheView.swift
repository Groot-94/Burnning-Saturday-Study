//
//  NSCacheImageView.swift
//  NScahchePractice
//
//  Created by Kiwon Song on 2022/07/22.
//

import UIKit

class NSCacheView: UIView {

    var firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray3
        
        return imageView
    }()
    
    var firstImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("첫 번째 이미지 받아오기", for: .normal)
        button.backgroundColor = .systemBrown
        
        return button
    }()
    
    var secondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray3
        
        return imageView
    }()
    
    var secondImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("두 번째 이미지 받아오기", for: .normal)
        button.backgroundColor = .systemPink
        
        return button
    }()
    
    var refreshImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("이미지 초기화", for: .normal)
        button.backgroundColor = .systemMint
        
        return button
    }()
    
    var deleteCacheButton: UIButton = {
        let button = UIButton()
        button.setTitle("캐시 비우기", for: .normal)
        button.backgroundColor = .systemGray
        
        return button
    }()
    
    var firstStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = 20
        
        return stackview
    }()
    
    var secondStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = 20
        
        return stackview
    }()
    
    var thirdStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.spacing = 15
        
        return stackview
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        [firstImageView, firstImageButton].forEach { firstStackView.addArrangedSubview($0)
        }
        [secondImageView, secondImageButton].forEach { secondStackView.addArrangedSubview($0)
        }
        [refreshImageButton, deleteCacheButton].forEach { thirdStackView.addArrangedSubview($0)
        }

        self.addSubview(firstStackView)
        self.addSubview(secondStackView)
        self.addSubview(thirdStackView)
        
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        thirdStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstImageView.widthAnchor.constraint(equalTo: firstImageView.heightAnchor),

            firstImageButton.heightAnchor.constraint(equalToConstant: 45),

            firstStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            firstStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            firstStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])
        
        NSLayoutConstraint.activate([
            secondImageView.heightAnchor.constraint(equalTo: secondImageView.widthAnchor),

            secondImageButton.heightAnchor.constraint(equalToConstant: 45),
            
            secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 50),
            secondStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            secondStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -100)
        ])

        NSLayoutConstraint.activate([
            refreshImageButton.heightAnchor.constraint(equalToConstant: 68),
            deleteCacheButton.heightAnchor.constraint(equalToConstant: 68),

            thirdStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            thirdStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            thirdStackView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
}
