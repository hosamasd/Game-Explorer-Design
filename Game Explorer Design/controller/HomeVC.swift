//
//  ViewController.swift
//  Game Explorer Design
//
//  Created by Hossam on 8/31/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    lazy var segmentView:CustomSegmentView = {
           let v = CustomSegmentView()
           v.translatesAutoresizingMaskIntoConstraints = false
        v.constrainHeight(constant: 80)
           return v
       }()
       
       lazy var collectionView:UICollectionView = {
           let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
           layout.scrollDirection = .vertical
           let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
    
           cv.translatesAutoresizingMaskIntoConstraints = false
           cv.showsVerticalScrollIndicator = false
           cv.register(TopGamesCollectionViewCell.self, forCellWithReuseIdentifier: "TopGamesCollectionViewCell")
           cv.register(NextGamesCollectionViewCell.self, forCellWithReuseIdentifier: "NextGamesCollectionViewCell")
           cv.backgroundColor = .white
           cv.setCollectionViewLayout(layout, animated: false)
           cv.delegate = self
           cv.dataSource = self
        
           return cv
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        setUpCustomNavBar()
    }

    func setupViews()  {
        view.backgroundColor = .white
    view.addSubViews(views: segmentView,collectionView)
        
        segmentView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)

        collectionView.anchor(top: segmentView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
       }
       
       func setUpCustomNavBar(){
           
           navigationController?.navigationBar.shadowImage = UIImage()
           navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
           navigationController?.navigationBar.barTintColor = .white
           navigationController?.navigationBar.isTranslucent = false
           
           //MARK:- search Button
           let searchButton = UIButton(type: .system)
           searchButton.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), for: .normal)
           searchButton.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
           navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
           let rightBarButtonItem1 = UIBarButtonItem()
           rightBarButtonItem1.customView = searchButton
           
           //MARK:- home Button
           let homeButton = UIButton(type: .system)
           homeButton.setImage(UIImage(named: "home")?.withRenderingMode(.alwaysOriginal), for: .normal)
           homeButton.addTarget(self, action: #selector(homeButtonPressed), for: .touchUpInside)
           homeButton.frame = CGRect(x: 0, y: 0, width: 40, height: 20)
           navigationItem.rightBarButtonItem = UIBarButtonItem(customView: homeButton)
           let rightBarButtonItem2 = UIBarButtonItem()
           rightBarButtonItem2.customView = homeButton
           
           navigationItem.setRightBarButtonItems([rightBarButtonItem2, rightBarButtonItem1], animated: true)
           
           //MARK:- Title
           let title = UILabel(text: "  Lusaxgames", font: UIFont.systemFont(ofSize: 20), textColor: CustomColor.appBlack)
          
           let leftBarButtonItem = UIBarButtonItem()
           leftBarButtonItem.customView = title
           
           navigationItem.setLeftBarButtonItems([leftBarButtonItem], animated: true)
       }
       
       @objc func homeButtonPressed(){
       }


}


extension HomeVC:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, gameCardProtocol {
    
    func didGameCardTapped() {
//        let VC = DetailViewController()
//        navigationController?.pushViewController(VC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopGamesCollectionViewCell", for: indexPath) as! TopGamesCollectionViewCell
            return cell
        }
        if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NextGamesCollectionViewCell", for: indexPath) as! NextGamesCollectionViewCell
            cell.delegate = self
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item == 0 {
            return CGSize(width: collectionView.frame.width-32, height: 360)
        } else {
            return CGSize(width: collectionView.frame.width, height: 270 + 70)
        }
    }
    
}
