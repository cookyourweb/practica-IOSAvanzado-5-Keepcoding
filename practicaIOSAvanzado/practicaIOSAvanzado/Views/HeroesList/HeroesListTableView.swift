//
//  HeroesListTableView.swift
//  PracticaIOSAvanzado
//
//  Created by vero on 14/2/23.
//

import Foundation
import UIKit

class HeroesListTableView: UIView {
    
    
    let loadingIcon: UIActivityIndicatorView =  {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = .systemGreen
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        return activityIndicatorView
    }()
    
    let titleHeader: UILabel = {
        let label = UILabel()
        label.text = "Our Heroes"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    
    let logout: UIImageView = {
        
        let image = UIImageView(image: UIImage(named: "close"))
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let deleteCoreDataButtom: UIButton = {
        
        let button = UIButton(type: .close)
        button.setTitle("Delete CoreData", for: .normal)
        button.backgroundColor = UIColor.black
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    
   
    
    let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.searchBarStyle = .minimal
        
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        //Registrar la celda
        table.register(HeroeListViewCell.self, forCellReuseIdentifier: "HeroeListViewCell")
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Views
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        backgroundColor = .systemGray6
        addSubview(titleHeader)
        addSubview(deleteCoreDataButtom)
        addSubview(logout)
        addSubview(searchBar)
        addSubview(tableView)
        addSubview(loadingIcon)
        
        NSLayoutConstraint.activate([
            
        
            
            
            logout.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            logout.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            logout.heightAnchor.constraint(equalToConstant: 40),
            logout.widthAnchor.constraint(equalToConstant: 40),
            
            
            
            titleHeader.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleHeader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleHeader.heightAnchor.constraint(equalToConstant: 40),
            
            
            deleteCoreDataButtom.topAnchor.constraint(equalTo: titleHeader.bottomAnchor, constant: 20),
            deleteCoreDataButtom.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            deleteCoreDataButtom.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            deleteCoreDataButtom.heightAnchor.constraint(equalToConstant: 20),
            deleteCoreDataButtom.widthAnchor.constraint(equalToConstant: 40),
         
            
            searchBar.topAnchor.constraint(equalTo: deleteCoreDataButtom.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            searchBar.bottomAnchor.constraint(equalTo: tableView.topAnchor),
            
            
        
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            loadingIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingIcon.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    

}


