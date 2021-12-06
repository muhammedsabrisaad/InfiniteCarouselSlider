//
//  CustomCardShap.swift
//  InfiniteCarouselSlider
//
//  Created by Muhammad Sabri Saad on 06/12/2021.
//

import SwiftUI

struct CustomCardShap: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {path in
            
            let p1 = CGPoint(x: 0, y: 0)
            let p2 = CGPoint(x:rect.width , y: 0)
            let p3 = CGPoint(x: rect.width - 32, y: rect.height)
            let p4 = CGPoint(x: 32, y: rect.height)
            
            path.move(to: p4)
            
            path.addArc(tangent1End: p1, tangent2End: p2, radius: 40)
            path.addArc(tangent1End: p2, tangent2End: p3, radius: 40)
            path.addArc(tangent1End: p3, tangent2End: p4, radius: 40)
            path.addArc(tangent1End: p4, tangent2End: p1, radius: 40)
        }
    }
    
    
}


