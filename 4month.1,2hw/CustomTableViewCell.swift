//
//  CustomTableViewCell.swift
//  4month.1,2hw
//
//  Created by imran on 26.06.2023.
//

import Foundation
import UIKit
import Kingfisher

class CustomTableViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    lazy var productImage: UIImageView = {
       let image = UIImageView()
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        
        setUpView()
        
    }
    
    func setUpView(){
        self.addSubview(productImage)
        
        productImage.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview().inset(20)
            make.height.width.equalTo(120)
        }
        
        self.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        self.addSubview(descriptionLabel)
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.trailing.equalTo(productImage.snp.leading).offset(-20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(with: Product){
        self.nameLabel.text = with.title
        self.descriptionLabel.text = with.description
        self.productImage.kf.setImage(with: URL(string: with.thumbnail ?? ""))
    }
    
}
