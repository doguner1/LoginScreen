//
//  SignUp.swift
//  LoginScreen
//
//  Created by Doğu GNR on 29.03.2024.
//

import SwiftUI

struct SignUp: View {
    @State var userName = ""
    @State var password = ""
    var social = ["twitter","facebook","google"]
    
    var body: some View {
        VStack{
            HStack{//Yan yana
                Text("Hesap Oluştur").font(.title).fontWeight(.bold)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "person.fill").font(.system(size: 30)).padding()
                })
                
            }.padding(.horizontal,25)
                .padding(.top,30)
            
            
            VStack(alignment:.leading ,spacing: 15){
                Text("Kullanıcı Adı").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                TextField("Email Adresi", text: $userName)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                    .autocapitalization(.none) // Otomatik ilk büyük harfi düzeltmeyi devre dışı bırakma

                
                Text("Parola").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                SecureField("Parolanız",text: $password).padding().background(Color.white).cornerRadius(5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5,x:0,y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5,x:0,y: -5)
                
            }.padding(.horizontal,25)
                .padding(.top,25)
            
            Button(action: {}) {
                Text("Kaydol").font(.system(size: 20))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50) //Button merkeze konulduğu için soldan ve sağdan 50 birim boşluk bırakıyor
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color("Renk1"), Color("Renk2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    ).cornerRadius(10)//Arka planı çift renk için
            }.padding(.horizontal,25)
             .padding(.top,25)
            
            //Sosyal Butonları
            
            Button(action:{}) {
                HStack(spacing: 35){
                    Image(systemName: "faceid").font(.system(size: 26)).foregroundColor(Color("Renk1"))
                    Text("Face ID ile kaydol").font(.system(size: 20)).fontWeight(.bold).foregroundColor(Color("Renk1"))
                    Spacer()
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 20).stroke(Color("Renk1"),lineWidth: 1))
            }//Button bitişi
            .padding(.top,30)
                .padding(.horizontal,25)
            
            HStack(spacing: 30){
                ForEach(social,id: \.self){ name in
                    Button(action:{}){
                        Image(name).renderingMode(.original)//.template yaparsak renklerde oynama yapabiliriz.Default original olarak gelir. Original kalacaksa yazmaya gerek yok.Düz .template ise hepsi mavi renk oluyor
                            .resizable()
                            .frame(width: 25,height: 25)
                            .foregroundColor(Color(name == "google" ? "Renk2" : "Renk1"))
                    }
                }
            }.padding(.top ,25)
        }
    }
}

#Preview {
    SignUp()
}
