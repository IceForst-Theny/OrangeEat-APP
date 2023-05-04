//
//  FiveGuysView.swift
//  OrangeEat
//
//  Created by Lining Sun on 5/3/23.
//



import SwiftUI


struct FiveGuys_View: View {
    @StateObject var HomeModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 10) {
                HStack(spacing: 15) {
                    Button(action: {
                        withAnimation(.easeIn){HomeModel.showMenu.toggle()}
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(Color.pink)
                    })

//                    Text(HomeModel.userLocation == nil ? "Cart" : "Deliver To")
//                        .foregroundColor(.black)

//                    Text(HomeModel.userAddress)
//                        .font(.caption)
//                        .fontWeight(.heavy)
//                        .foregroundColor(Color.pink)

                    Spacer(minLength: 0)
                }
                .padding([.horizontal, .top])

                Divider()
                
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $HomeModel.search)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                Divider()
                
                if HomeModel.items.isEmpty {
                    Spacer()
                    
                    ProgressView()
                    
                    Spacer()
                } else {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        VStack(spacing: 25) {
                            ForEach(HomeModel.filtered) {item in
                                // Item View
                                ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                                    ItemView(item: item)
                                    
                                    HStack {
                                        Text("")
                                            .foregroundColor(.white)
                                            .padding(.vertical, 10)
                                            .padding(.horizontal)
                                            
//                                            .background(Color.pink)
                                        
                                        Spacer(minLength: 0)
                                        
                                        Button(action: {
                                            HomeModel.addToCart(item: item)
                                        }, label: {
                                            Image(systemName: item.isAdded ? "checkmark" : "plus")
                                                .foregroundColor(.white)
                                                .padding(10)
                                                .background(item.isAdded ? Color.green : Color(.blue))
                                                .clipShape(Circle())
                                                
                                                
                                        })
                                    }
                                    .padding(.trailing, 10)
                                    .padding(.top, 10)
                                })
                                .frame(width: UIScreen.main.bounds.width - 30)
                            }
                        }
                        .padding(.top, 10)
                    })
                }
            }
            
            // Side Menu
            HStack {
                Menu(homeData: HomeModel)
                    .offset(x: HomeModel.showMenu ? 0 : -UIScreen.main.bounds.width / 1.6)
                
                Spacer(minLength: 0)
            }
            .background(
                Color.black.opacity(HomeModel.showMenu ? 0.3 : 0).ignoresSafeArea()
                // Close when tab is outside
                    .onTapGesture(perform: {
                        withAnimation(.easeIn){HomeModel.showMenu.toggle()}
                    })
            )
            
//            // Non-closable alert if permission denied\
//            if HomeModel.noLocation {
//                Text("Please Enable Location Access In Settings to move further!")
//                    .foregroundColor(.black)
//                    .frame(width: UIScreen.main.bounds.width - 100, height: 120)
//                    .background(Color.white)
//                    .cornerRadius(10)
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .background(Color.black.opacity(0.3).ignoresSafeArea())
//            }
        }
        .onAppear(perform: {
            // Calling location delegate
            //HomeModel.locationManager.delegate = HomeModel
            HomeModel.fetchDunkinData(StoreName: "FiveGuys_Items")
        })
        .onChange(of: HomeModel.search, perform: { value in
            // To avoid continuous search requests
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                if value == HomeModel.search && HomeModel.search != "" {
                    // Search Data
                    HomeModel.filterData()
                }
            }
            
            if HomeModel.search == "" {
                // Reset all data
                withAnimation(.linear) {HomeModel.filtered = HomeModel.items}
            }
        })
    }
}
struct FiveGuysView_Previews: PreviewProvider {
    static var previews: some View {
        FiveGuys_View()
    }
}
