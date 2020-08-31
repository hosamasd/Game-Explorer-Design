//
//  GradientView.swift
//  Game Explorer Design
//
//  Created by Hossam on 8/31/20.
//  Copyright © 2020 Hossam. All rights reserved.
//

import UIKit

class GradientView: CustomBaseView {
    
     override open class var layerClass: AnyClass {
         return CAGradientLayer.classForCoder()
      }
      
      override init(frame: CGRect) {
          super.init(frame: frame)
          let gradientLayer = layer as! CAGradientLayer
          gradientLayer.colors = [UIColor.clear.cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 0.8).cgColor]
          gradientLayer.startPoint = CGPoint(x: 0, y: 0)
          gradientLayer.endPoint = CGPoint(x: 0, y: 1)
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
}
