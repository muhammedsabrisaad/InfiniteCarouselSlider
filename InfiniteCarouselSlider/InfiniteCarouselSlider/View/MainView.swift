//
//  MainView.swift
//  InfiniteCarouselSlider
//
//  Created by Muhammad Sabri Saad on 23/09/2021.
//

import SwiftUI

struct MainView: View {
    
    @State var tabs:[Tab] = [
        Tab(title: "Infinite Carousel Slider 1"),
        Tab(title: "Infinite Carousel Slider 2"),
        Tab(title: "Infinite Carousel Slider 3"),
        Tab(title: "Infinite Carousel Slider 4"),
    ]
    @State var currentIndex:Int = 0

    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.body.bold())
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.white.opacity(0.6),lineWidth: 1)
                        )
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("Skip")
                        .font(.body.bold())
                        .foregroundColor(.white)
                        .frame(width: 60, height: 40)
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .strokeBorder(Color.white.opacity(0.6),lineWidth: 1)
//                        )
                }
                
            }
            .overlay(
                //custom paging indcator
                HStack(spacing: 5) {
                    ForEach(tabs.indices,id:\.self) { index in
                        Capsule()
                            .fill(Color.white.opacity(currentIndex == index ? 1 : 0.55))
                            .frame(width: currentIndex == index ? 18 : 4, height: 4)
                            .animation(.easeInOut,value: currentIndex)
                    }
                }
            )
            .padding()

            //scrollView for adaptingfor small small screens
            ScrollView(getRect().height > 700 ? .vertical : .init() , showsIndicators: false) {
                VStack(spacing:20) {
                    Text("Lorem ipsum dolor")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white.opacity(0.6))
                        .padding(.top,20)
                        
                    Text("Lorem ipsum dolor \nconsetetur!")
                        .font(.system(size: 38, weight: .bold))
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .foregroundColor(.white)
                    
                    //Carousel Slider....
                    
                    InfiniteCarouselView(tabs: $tabs, currentIndex: $currentIndex)
                    
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
            }
            
            //button Bar...
            HStack {
                
                Text("Next Step")
                    .font(.body.bold())
                    .foregroundColor(.white)
                    .frame(height: 40)
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.body.bold())
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder(Color.white.opacity(0.3),lineWidth: 1)
                        )
                }
            }
            .padding(.top,25)
            .padding(.horizontal,30)
            .padding(.bottom,12)
            .background(
                Color.black
                    .clipShape(CustomCorner(corners: [.topLeft,.topRight], redius: 38))
                    .ignoresSafeArea()
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            //CGGradient BG..
            LinearGradient(gradient: Gradient(colors: [Color("BG1"), Color("BG2")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        )
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Extedning View to get screen bounds
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
