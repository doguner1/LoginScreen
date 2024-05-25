//
//  LoginView.swift
//  LoginScreen
//
//  Created by Doğu GNR on 29.03.2024.
//

import SwiftUI

struct LoginView: View {
    @State var password = ""
    @AppStorage("login") var LoginCntrl: Int = 0
    
    
    @AppStorage("name") var LoginName: String = ""
    
    var social = ["twitter","facebook","google"]
    
    var body: some View {
        VStack{
            
            if LoginCntrl == 1 {
                UserView
                    .padding(.horizontal,25)
                    .padding(.top,30)
            }else{
                LoginView
                    .padding(.horizontal,25)
                    .padding(.top,25)
            }
            
            
            VStack(alignment:.leading ,spacing: 15){
                Text("Parola").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                
                SecureField("Parola",text: $password).padding()
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5,x:0 ,y:5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5,x:0 ,y:-5)
                
                Button(action: {}){
                    Text("Parolamı Unuttum").font(.system(size: 15))
                        .foregroundColor(Color("Renk1"))
                }.padding(.top,10)
            }
            .padding(.horizontal,25)
            .padding(.top,25)
            
            
            Button(action: {
                
                    LoginCntrl = 1
                
                
            }) {
                Text("Oturum Aç").font(.system(size: 20))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color("Renk1"), Color("Renk2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    ).cornerRadius(10)
            }.padding(.horizontal,25)
             .padding(.top,25)
            
            //Sosyal Butonları
            
            Button(action:{}) {
                HStack(spacing: 35){
                    Image(systemName: "faceid").font(.system(size: 26)).foregroundColor(Color("Renk1"))
                    Text("Face ID ile oturum aç").font(.system(size: 20)).fontWeight(.bold).foregroundColor(Color("Renk1"))
                    Spacer()
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 20).stroke(Color("Renk1"),lineWidth: 1))
            }
            .padding(.top,30)
                .padding(.horizontal,25)
            
            HStack(spacing: 30){
                ForEach(social,id: \.self){ name in
                    Button(action:{}){
                        Image(name).renderingMode(.original)
                            .resizable()
                            .frame(width: 25,height: 25)
                            .foregroundColor(Color(name == "google" ? "Renk2" : "Renk1"))
                    }
                }
            }.padding(.top ,25)
        }//Vstack
        
    }
}

#Preview {
    LoginView()
}

extension LoginView {
    private var UserView: some View{
        HStack{
            VStack(alignment: .leading){
                
                Text("Tekrar Merhaba").fontWeight(.bold)
                Text("Doğu").font(.title).fontWeight(.bold)
                
                Button(action: {
                        LoginCntrl = 0
                   
                }){
                        Text("Bu ben değilim")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color("Renk1"))
                        .padding(.top,4)
                }
            }//Vstack
            Spacer(minLength: 0)
            
            Image("KisiProfil1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100,height: 100)
                .clipShape(Circle())
        }//Hstack
    }
}

extension LoginView {
    private var LoginView: some View{
        VStack(alignment:.leading ,spacing: 15){
            Text("Email").font(.caption).fontWeight(.bold).foregroundColor(.gray)
            
            TextField("Email Adresi",text: $LoginName).padding()
                .background(Color.white)
                .cornerRadius(5)
                .shadow(color: Color.black.opacity(0.1), radius: 5,x:0 ,y:5)
                .shadow(color: Color.black.opacity(0.08), radius: 5,x:0 ,y:-5)
        }//Vstack Paralo
    }
}
