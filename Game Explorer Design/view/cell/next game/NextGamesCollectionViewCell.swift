//
//  NextGamesCollectionViewCell.swift
//  Game Explorer Design
//
//  Created by Hossam on 8/31/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

protocol gameCardProtocol {
    func didGameCardTapped()
}

class NextGamesCollectionViewCell: BaseCollectionCell {
    
    var delegate:gameCardProtocol?
    
    lazy var headingLabel = UILabel(text: "Next games", font: .systemFont(ofSize: 20), textColor: CustomColor.appBlack)
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.register(NextGameCardCollectionViewCell.self, forCellWithReuseIdentifier: "NextGameCardCollectionViewCell")
        cv.backgroundColor = .white
        cv.setCollectionViewLayout(layout, animated: false)
        cv.delegate = self
        cv.dataSource = self
        cv.delaysContentTouches = false
        return cv
    }()
    
    override func setupViews() {
        headingLabel.constrainHeight(constant: 25)
        addSubViews(views: headingLabel,collectionView)
        
        headingLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil,padding: .init(top: 20, left: 25, bottom: 0, right: 0))
        collectionView.anchor(top: headingLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)

    }
}


extension NextGamesCollectionViewCell:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NextGameCardCollectionViewCell", for: indexPath) as! NextGameCardCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            let cell = collectionView.cellForItem(at: indexPath) as! NextGameCardCollectionViewCell
            cell.cardView.transform = .init(scaleX: 0.95, y: 0.95)
            cell.removeCardShadow()
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            let cell = collectionView.cellForItem(at: indexPath) as! NextGameCardCollectionViewCell
            cell.cardView.transform = .identity
            cell.setCardShadow()
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didGameCardTapped()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
