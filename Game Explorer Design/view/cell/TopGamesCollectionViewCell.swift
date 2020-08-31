//
//  TopGamesCollectionViewCell.swift
//  Game Explorer Design
//
//  Created by Hossam on 8/31/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class TopGamesCollectionViewCell: BaseCollectionCell {
    
    
    lazy var headingLabel = UILabel(text: "Top games", font: .systemFont(ofSize: 20), textColor:CustomColor.appBlack)
    
    lazy var optionBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "option"), for: .normal)
        btn.constrainWidth(constant: 25)
        btn.constrainHeight(constant: 25)
        return btn
    }()
    
    lazy var cardView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var horizontalStackView:UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        v.distribution = .fillEqually
        v.spacing = 20
        return v
    }()
    
    lazy var verticalStackView:UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .vertical
        v.distribution = .fillEqually
        v.spacing = 20
        return v
    }()
    
    lazy var HView1:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var HView2:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        v.layer.cornerRadius = 10
        v.layer.shadowColor = UIColor.yellow.cgColor
        v.layer.shadowOffset = CGSize(width: 0, height: 5)
        v.layer.shadowRadius = 12
        v.layer.shadowOpacity = 0.3
        return v
    }()
    
    lazy var VView1:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        v.layer.cornerRadius = 10
        v.layer.shadowColor = UIColor(red: 172/255, green: 135/355, blue: 87/255, alpha: 1).cgColor
        v.layer.shadowOffset = CGSize(width: 0, height: 5)
        v.layer.shadowRadius = 12
        v.layer.shadowOpacity = 0.5
        return v
    }()
    
    lazy var VView2:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .lightGray
        v.layer.cornerRadius = 10
        v.layer.shadowColor = UIColor.lightGray.cgColor
        v.layer.shadowOffset = CGSize(width: 0, height: 5)
        v.layer.shadowRadius = 12
        v.layer.shadowOpacity = 0.8
        return v
    }()
    
    //MARK:- StackImages
    
    lazy var image1:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "img1")
        return img
    }()
    
    lazy var image2:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "img2")
        return img
    }()
    
    lazy var image3:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "img3")
        return img
    }()
    
    //MARK:- StackLabels
    
    lazy var label1:UILabel = {
        let l = UILabel()
        l.text = "Rage 2"
        l.textColor = .white
        l.numberOfLines = 0
        l.font = .systemFont(ofSize: 20)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var label2 = UILabel(text: "Cyberpunk 2077", font: .systemFont(ofSize: 20), textColor: .white, numberOfLines: 0)
    
    lazy var label3 = UILabel(text: "Fortnite", font: .systemFont(ofSize: 20), textColor: .white, numberOfLines: 0)
    
    //    MARK:- StackOverlay
    
    lazy var overlayView1:GradientView = {
        let v = GradientView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 10
        v.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMinXMaxYCorner]
        v.constrainHeight(constant: 65)
        return v
    }()
    
    lazy var overlayView2:GradientView = {
        let v = GradientView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 10
        v.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMinXMaxYCorner]
        v.constrainHeight(constant: 85)
        return v
    }()
    
    lazy var overlayView3:GradientView = {
        let v = GradientView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 10
        v.layer.maskedCorners = [.layerMaxXMaxYCorner , .layerMinXMaxYCorner]
        v.constrainHeight(constant: 85)
        
        return v
    }()
    
    override func setupViews() {
        headingLabel.constrainHeight(constant: 25)
        
        addSubViews(views: headingLabel,optionBtn,cardView)
        
        cardView.addSubview(horizontalStackView)
        horizontalStackView.fillSuperview()
        horizontalStackView.addArrangedSubview(HView1)
        horizontalStackView.addArrangedSubview(HView2)
        HView1.addSubview(verticalStackView)
        
        verticalStackView.fillSuperview()
        verticalStackView.addArrangedSubview(VView1)
        verticalStackView.addArrangedSubview(VView2)
        
        VView1.addSubViews(views: image1,image2,image3,overlayView1,overlayView2,overlayView3)
        
        overlayView1.addSubview(label1)
        overlayView2.addSubview(label2)
        overlayView3.addSubview(label3)
        
        image1.fillSuperview()
        image2.fillSuperview()
        image3.fillSuperview()
        
        headingLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 30, left: 25, bottom: 0, right: 0))
        optionBtn.anchor(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor,padding: .init(top: 30, left: 0, bottom: 0, right: 30))
        overlayView1.anchor(top: nil, leading: VView1.leadingAnchor, bottom: VView1.bottomAnchor, trailing: VView1.trailingAnchor)
        overlayView2.anchor(top: nil, leading: VView2.leadingAnchor, bottom: VView2.bottomAnchor, trailing: VView2.trailingAnchor)
        overlayView3.anchor(top: nil, leading: HView2.leadingAnchor, bottom: HView2.bottomAnchor, trailing: HView2.trailingAnchor)
        
        label1.anchor(top: nil, leading: overlayView1.leadingAnchor, bottom: overlayView1.bottomAnchor, trailing: overlayView1.trailingAnchor,padding: .init(top: 0, left: 15, bottom: 15, right: 20))
        label2.anchor(top: nil, leading: overlayView2.leadingAnchor, bottom: overlayView2.bottomAnchor, trailing: overlayView2.trailingAnchor,padding: .init(top: 0, left: 15, bottom: 15, right: 20))
        label3.anchor(top: nil, leading: overlayView3.leadingAnchor, bottom: overlayView3.bottomAnchor, trailing: overlayView3.trailingAnchor,padding: .init(top: 0, left: 15, bottom: 15, right: 20))
        
    }
}
