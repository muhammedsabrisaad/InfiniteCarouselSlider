//
//  CustomCorner.swift
//  InfiniteCarouselSlider
//
//  Created by Muhammad Sabri Saad on 23/09/2021.
//

import SwiftUI

//Custom Corner Shap
struct CustomCorner: Shape {
    
    var corners: UIRectCorner
    var redius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: redius, height: redius))
        
        return Path(path.cgPath)
    }
}
