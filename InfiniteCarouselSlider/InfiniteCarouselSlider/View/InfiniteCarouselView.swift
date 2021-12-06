//
//  InfiniteCarouselView.swift
//  InfiniteCarouselSlider
//
//  Created by Muhammad Sabri Saad on 23/09/2021.
//

import SwiftUI

struct InfiniteCarouselView: View {
    
    @Binding var tabs:[Tab]
    @Binding var currentIndex:Int
    @State var fakeIndex:Int = 0
    @State var offset: CGFloat = 0
    @State var genericTab:[Tab] = []

    var body: some View {
        TabView(selection: $fakeIndex) {
            ForEach(genericTab) {tab in
                VStack(spacing: 18) {
                    Spacer()
                    Text("Your Condition")
                        .font(.title.bold())
                        .foregroundColor(.gray)
                    
                    Text(tab.title)
                        .font(.title3.bold())
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    Spacer()
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 120, weight: .light))
                        .foregroundColor(.green)
                        .padding(.bottom)
                    Spacer()
                }
                .padding(.horizontal,20)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .clipShape(CustomCardShap())
                .cornerRadius(30)
                .padding(.horizontal,50)
                .overlay(
                    GeometryReader {proxy in
                        Color.clear
                            .preference(key: OffsetKey.self, value: proxy.frame(in: .global).minX)
                    }
                )
                .onPreferenceChange(OffsetKey.self, perform: { offset in
                    self.offset = offset
                })
                .tag(getIndex(tab: tab))
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .frame(height: 350)
        .padding(.top,20)
        
        .onChange(of: offset) { newValue in

            if fakeIndex == 0 && offset == 0 {
                fakeIndex = genericTab.count - 2
            }

            if fakeIndex == genericTab.count - 1 && offset == 0 {
                fakeIndex = 1
            }
        }
        .onAppear {
            genericTab = tabs
            guard var first = genericTab.first else {return}
            guard var last = genericTab.last else {return}

            first.id = UUID().uuidString 
            last.id = UUID().uuidString

            genericTab.append(first)
            genericTab.insert(last,at: 0)

            fakeIndex = 1
        }
        .onChange(of: tabs) { newValue in
            genericTab = tabs
            guard var first = genericTab.first else {return}
            guard var last = genericTab.last else {return}

            first.id = UUID().uuidString
            last.id = UUID().uuidString

            genericTab.append(first)
            genericTab.insert(last,at: 0)
        }
        .onChange(of: fakeIndex) { newValue in
            currentIndex = fakeIndex - 1
           
        }
    }
    
    func getIndex(tab:Tab) -> Int {
        let index = genericTab.firstIndex { currentTab in
            return currentTab.id == tab.id
        } ?? 0
        return index
    }
}

struct MainView_Previews1: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OffsetKey: PreferenceKey {
    
    static var defaultValue: CGFloat = 0.0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
}
