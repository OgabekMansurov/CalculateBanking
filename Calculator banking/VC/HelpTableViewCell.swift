//
//  HelpTableViewCell.swift
//  Calculator banking
//
//  Created by admin on 2023/6/8.
//

import UIKit

class HelpTableViewCell: UITableViewCell {

    
    static let identifier = String(describing: HelpTableViewCell.self)
    
    private var headerLabel: UILabel = {
       let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.font = .boldSystemFont(ofSize: 19)
        title.textColor = .white
        return title
    }()
    
    private var titlelabel:UILabel = {
       let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.textAlignment = .left
        title.font = .systemFont(ofSize: 16)
        title.textColor = .white
        return title
    }()
    
    private var descriptionLabel: UILabel = {
       let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textAlignment = .center
        title.font = .boldSystemFont(ofSize: 17)
        title.textColor = .white
        return title
    }()
    
    private var image: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(headerLabel)
        contentView.addSubview(titlelabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(image)
        
        NSLayoutConstraint.activate([
        
            headerLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            headerLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: titlelabel.topAnchor, constant: -10),
            
            titlelabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            titlelabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            titlelabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: titlelabel.bottomAnchor, constant: 10),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            descriptionLabel.bottomAnchor.constraint(equalTo: image.topAnchor, constant: -10),
            
            image.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: contentView.frame.size.width - 10),
            image.heightAnchor.constraint(equalToConstant: contentView.frame.size.width * 1.7),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            
        ])
        
    }
    func reload(item: HelpTitleUI) {
        
        headerLabel.text = item.HeaderLabel
        titlelabel.text = item.titleLabel
        descriptionLabel.text = item.descLabel
        image.image = UIImage(named: item.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
