//
//  Home.swift
//  LoginScreen
//
//  Created by Doğu GNR on 29.03.2024.
//

import SwiftUI

struct Home: View {
    @State var index = 0
    @Namespace var name
    
    var body: some View {
        VStack{
            Image("logo").resizable().aspectRatio(contentMode: .fill).frame(width: 70,height: 70)
            
            HStack(spacing: 0){
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        index = 0
                    }
                    
                }, label: {
                    VStack{
                        Text("Giriş Yap").font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 0 ? .black : .gray)
                        // index 0 ise black ol yoksa gri
                        
                        ZStack{
                            Capsule().fill(Color.black.opacity(0.04))
                                .frame(height: 5)
                            
                            if index == 0 {// Giriş alanı seçildiyse altındaki renkli çizgiyi oluştur
                                Capsule().fill(Color("Renk1")).frame(height: 5)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                })
                
                Button(action: {
                    
                    withAnimation(.spring()){
                        index = 1
                    }
                    
                }, label: {
                    VStack{
                        Text("Kayıt Ol").font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(index == 1 ? .black : .gray)
                        // index 1 ise black ol yoksa gri
                        
                        ZStack{
                            Capsule().fill(Color.black.opacity(0.04))
                                .frame(height: 5)
                            
                            if index == 1 {// Giriş alanı seçildiyse altındaki renkli çizgiyi oluştur
                                Capsule().fill(Color("Renk1")).frame(height: 5)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                })
            }.padding(.top,30)
            
            if index == 0{
                LoginView()
            }else{
                SignUp()
            }
        }
    }
}

#Preview {
    Home()
}
