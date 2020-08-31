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
    
    lazy var horizontalStackView=getStack(views: HView1,HView2, spacing: 20, distribution: .fillEqually, axis: .horizontal)
    
    lazy var verticalStackView = getStack(views: VView1,VView2, spacing: 20, distribution: .fillEqually, axis: .vertical)
    
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
        img.constrainWidth(constant: (frame.width-32)/2)
//        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "img1")
        img.stack(UIView(),hstack(label1,UIView()))

        return img
    }()
    
    lazy var image2:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
//        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "img2")
        img.stack(UIView(),hstack(label2,UIView()))
        return img
    }()
    
    lazy var image3:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.layer.cornerRadius = 10
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "img3")
        img.stack(UIView(),hstack(label3,UIView()))

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
        
        let zz = getStack(views: image1,image2, spacing: 16, distribution: .fillEqually, axis: .vertical)
        let ss = getStack(views: headingLabel,optionBtn, spacing: 16, distribution: .fill, axis: .horizontal)

      let dd =   hstack(zz,image3,spacing:16)
        stack(ss,dd,spacing:16)
        
    }
}
