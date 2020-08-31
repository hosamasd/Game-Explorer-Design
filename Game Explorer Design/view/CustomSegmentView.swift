//
//  CustomSegmentView.swift
//  Game Explorer Design
//
//  Created by Hossam on 8/31/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit


class CustomSegmentView: CustomBaseView {

    var indicatorWidth:CGFloat!
    let segmentWidth = (UIScreen.main.bounds.width - 50)
    
    lazy var segmentView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = CustomColor.lightBlue
        v.layer.cornerRadius = 12
        v.constrainHeight(constant: 50)
        return v
    }()
    
    lazy var stackView:UIStackView = {
        let v = UIStackView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.axis = .horizontal
        v.distribution = .fillEqually
        v.spacing = 0
        return v
    }()
    
    lazy var indicatorView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = CustomColor.appBlue
        v.layer.cornerRadius = 8
        v.layer.shadowColor = CustomColor.appBlue.cgColor
        v.layer.shadowOffset = CGSize(width: 0, height: 2)
        v.layer.shadowOpacity = 0.3
        v.layer.shadowRadius = 10
        return v
    }()
    
    lazy var button1:UIButton = {
        let btn = UIButton()
        btn.setTitle("Ps4", for: .normal)
        btn.setTitleColor(CustomColor.appBlack, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btn1Pressed), for: .touchUpInside)
        btn.setTitleColor(.white, for: .normal)
        return btn
    }()
    
    lazy var button2:UIButton = {
        let btn = UIButton()
        btn.setTitle("XOne", for: .normal)
        btn.setTitleColor(CustomColor.appBlack, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btn2Pressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var button3:UIButton = {
        let btn = UIButton()
        btn.setTitle("Switch", for: .normal)
        btn.setTitleColor(CustomColor.appBlack, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btn3Pressed), for: .touchUpInside)
        return btn
    }()
    
    lazy var button4:UIButton = {
        let btn = UIButton()
        btn.setTitle("Pc", for: .normal)
        btn.setTitleColor(CustomColor.appBlack, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btn4Pressed), for: .touchUpInside)
        return btn
    }()
    
    override func setupViews() {
        
        addSubViews(views: segmentView)
                
        segmentView.addSubViews(views: indicatorView,stackView)
        stackView.fillSuperview()
        addSubview(segmentView)
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(button4)
        indicatorWidth = (segmentWidth / 4)
        
        segmentView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 0, left: 25, bottom: 10, right: 25))
        indicatorView.anchor(top: nil, leading: segmentView.leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 0, left: 5, bottom: 0, right: 0))

        NSLayoutConstraint.activate([
            indicatorView.widthAnchor.constraint(equalToConstant:indicatorWidth - 10),
            indicatorView.heightAnchor.constraint(equalToConstant: 40),
            indicatorView.centerYAnchor.constraint(equalTo: segmentView.centerYAnchor)
        ])
    }
    
    @objc func btn1Pressed(){
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1 , options: .curveEaseInOut, animations: {
            self.indicatorView.center.x = self.button1.center.x
            self.button1.setTitleColor(.white, for: .normal)
            self.button2.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button3.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button4.setTitleColor(CustomColor.appBlack, for: .normal)
        }, completion: nil)
    }
    
    @objc func btn2Pressed(){
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1 , options: .curveEaseInOut, animations: {
            self.indicatorView.center.x = self.button2.center.x
            self.button1.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button2.setTitleColor(.white, for: .normal)
            self.button3.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button4.setTitleColor(CustomColor.appBlack, for: .normal)
        }, completion: nil)
    }
    
    @objc func btn3Pressed(){
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1 , options: .curveEaseInOut, animations: {
            self.indicatorView.center.x = self.button3.center.x
            self.button1.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button2.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button3.setTitleColor(.white, for: .normal)
            self.button4.setTitleColor(CustomColor.appBlack, for: .normal)
        }, completion: nil)
    }
    
    @objc func btn4Pressed(){
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1 , options: .curveEaseInOut, animations: {
            self.indicatorView.center.x = self.button4.center.x
            self.button1.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button2.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button3.setTitleColor(CustomColor.appBlack, for: .normal)
            self.button4.setTitleColor(.white, for: .normal)
        }, completion: nil)
    }
    
  
    
}

