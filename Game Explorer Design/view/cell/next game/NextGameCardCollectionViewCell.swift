//
//  NextGameCardCollectionViewCell.swift
//  Game Explorer Design
//
//  Created by Hossam on 8/31/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class NextGameCardCollectionViewCell: BaseCollectionCell {
    
    let cardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 15
        v.backgroundColor = .white
        return v
    }()
    
    let detailView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = CustomColor.appBlue
        v.layer.cornerRadius = 10
        v.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        v.constrainHeight(constant: 70)
        return v
    }()
    
    let cardImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.image = UIImage(named: "gimg")
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 15
        return img
    }()
    
    let gameLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.numberOfLines = 0
        return l
    }()
    
    let cartBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = CustomColor.appBlue
        btn.setImage(UIImage(named: "cart"), for: .normal)
        btn.layer.cornerRadius = 20
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOffset = CGSize(width: 0, height: 2)
        btn.layer.shadowRadius = 8
        btn.layer.shadowOpacity = 0.2
        btn.constrainWidth(constant: 50)
        btn.constrainHeight(constant: 50)
        return btn
    }()
    
    override func setupViews() {
        
        addSubview(cardView)
        cardView.addSubViews(views: cardImage,detailView)
        detailView.addSubViews(views: gameLabel,cartBtn)
        cardImage.fillSuperview()
        
        cardView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 20, left: 25, bottom: 20, right: 25))
        detailView.anchor(top: nil, leading: cardView.leadingAnchor, bottom: cardView.bottomAnchor, trailing: cardView.trailingAnchor)
        gameLabel.anchor(top: detailView.topAnchor, leading: detailView.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 15, left: 15, bottom: 0, right: 0))
        cartBtn.anchor(top: detailView.topAnchor, leading: detailView.leadingAnchor, bottom: nil, trailing: detailView.trailingAnchor,padding: .init(top: 25, left: 0, bottom: 0, right: 20))
        
        setCardShadow()
        setUpAttributeText(title: "Crash Team Racing", subtitle: "Nitro-Fueled")
        
    }
    
    func setCardShadow(){
        cardView.layer.shadowColor = CustomColor.appBlue.cgColor
        cardView.layer.shadowRadius = 10
        cardView.layer.shadowOffset = CGSize(width: 0, height: 8)
        cardView.layer.shadowOpacity = 0.4
    }
    
    func removeCardShadow(){
        cardView.layer.shadowRadius = 0
        cardView.layer.shadowOpacity = 0
    }
    
    func setUpAttributeText(title:String , subtitle:String){
        let attributedText = NSMutableAttributedString(string:"\(title)\n" , attributes:[NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18),NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedText.append(NSAttributedString(string: "\(subtitle)" , attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        gameLabel.attributedText = attributedText
    }
}
