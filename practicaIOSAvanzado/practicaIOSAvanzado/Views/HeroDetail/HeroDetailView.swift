//
//  HeroDetail.swift
//  PracticaIOSAvanzado
//
//  Created by vero on 14/2/23.
//

import Foundation
import UIKit

class HeroDetailView: UIView {
    
    let heroImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let heroName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let closeView: UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: "close"))
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
                                   
    
    
    let logout: UIImageView = {
        
        let image = UIImageView(image: UIImage(named: "close"))
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    
    let heroDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = label.font.withSize(12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        backgroundColor = .white
        addSubview(closeView)
      addSubview(heroImageVIew)
      addSubview(heroName)
        
        addSubview(scrollView)
        scrollView.addSubview(heroDescription)

        NSLayoutConstraint.activate([
//
            
    scrollView.topAnchor.constraint(equalTo: topAnchor    ,constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            closeView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            closeView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            closeView.heightAnchor.constraint(equalToConstant: 40),
            closeView.widthAnchor.constraint(equalToConstant: 40),
            
            
            
  
           
            heroImageVIew.topAnchor.constraint(equalTo: closeView.topAnchor, constant: 40),

            heroImageVIew.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            heroImageVIew.heightAnchor.constraint(equalToConstant: 330),
            heroImageVIew.widthAnchor.constraint(equalToConstant: 330),
            heroName.topAnchor.constraint(equalTo: heroImageVIew.bottomAnchor, constant: 30),
            heroName.leadingAnchor.constraint(equalTo: heroImageVIew.leadingAnchor),
            heroName.trailingAnchor.constraint(equalTo: heroImageVIew.trailingAnchor),

            heroDescription.leadingAnchor.constraint(equalTo: heroName.leadingAnchor),
            heroDescription.trailingAnchor.constraint(equalTo: heroName.trailingAnchor),
            heroDescription.topAnchor.constraint(equalTo: heroName.bottomAnchor, constant: 8),



        
            

        ])
    }
    
     // MARK: - Configure
    
    func configure(_ model: Hero) {
        self.heroName.text = model.name
        self.heroDescription.text = model.heroeDescription
        self.heroImageVIew.kf.setImage(with: URL(string: model.photo))
    }
    
}
