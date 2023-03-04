//
//  HeroesListViewCell.swift
//  PracticaIOSAvanzado
//
//  Created by vero on 14/2/23.
//

import Foundation
import UIKit
import Kingfisher

class HeroeListViewCell: UITableViewCell {
    
    let heroeImageVIew: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let heroeName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heroeDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        
        addSubview(heroeImageVIew)
        addSubview(heroeName)
        addSubview(heroeDescription)
        
        NSLayoutConstraint.activate([
            heroeImageVIew.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            heroeImageVIew.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            heroeImageVIew.heightAnchor.constraint(equalToConstant: 80),
            heroeImageVIew.widthAnchor.constraint(equalToConstant: 80),
            
            heroeName.leadingAnchor.constraint(equalTo: heroeImageVIew.trailingAnchor, constant: 10),
            heroeName.topAnchor.constraint(equalTo: heroeImageVIew.topAnchor),

            heroeDescription.leadingAnchor.constraint(equalTo: heroeName.leadingAnchor),
            heroeDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            heroeDescription.topAnchor.constraint(equalTo: heroeName.bottomAnchor, constant: 8)
        ])
    }
    
    
    // MARK: - Model Hero∫
    
    func configure(_ model: Hero) {
        self.heroeName.text = model.name
        self.heroeDescription.text = model.heroeDescription
        self.heroeImageVIew.kf.setImage(with: URL(string: model.photo))
    }

    
}
