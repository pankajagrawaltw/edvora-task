//
//  LogInView.swift
//  EdvoraTestTask
//
//  Created by Lokesh Patil on 29/11/21.
//

import SwiftUI

struct LogInView: View {
    @State var username:String = ""
    @State var password:String = ""
    @State var showPassword:Bool = false
    @State var email:String = ""
    
    var body: some View {
        VStack {
        ScrollView {
            VStack(alignment: .center, spacing: 15){
                Image("appLogo")
                    .padding(.top, 50)
                Spacer()
                
                VStack(alignment: .center, spacing: 20){
                    
                    
                    ///
                    ///   Email Username
                    ///
                    
                    HStack( spacing: 10){
                        Image("username")
                            .frame(width: 10, height: 10)
                            .padding(12)
                        TextField("", text: $username).modifier(TextFieldClearButton(text: $username))
                            .onChange(of: username, perform: { newValue in
                                if newValue == " "{
                                    username = ""
                                }
                            })
                    }
                    .borderedTextLayout(title: "Username",
                                        value: username,
                                        isValidate: Validation().textValidation(text: username, validationType: .username).0,
                                        errorMsg: Validation().textValidation(text: username, validationType: .username).1)
                    
                    // Password Textyfield
                    HStack( spacing: 10){
                        Image("password")
                            .frame(width: 10, height: 10)
                            .padding(12)
                        if (!showPassword){
                            SecureField("", text: $password)
                                .modifier(TextFieldClearButton(text: $password))
                                .onChange(of: password, perform: { newValue in
                                    if newValue == " "{
                                        password = ""
                                    }
                                })
                        } else {
                            TextField("", text: $password)
                                .modifier(TextFieldClearButton(text: $password))
                                .onChange(of: password, perform: { newValue in
                                    if newValue == " "{
                                        password = ""
                                    }
                                })
                        }
                        
                        Button(action: {
                            showPassword.toggle()
                        }) {
                            if (!showPassword){
                                Image("eye-open")
                                    .frame(width: 10, height: 10)
                            }
                            else {
                                Image("eye-open")
                                    .frame(width: 10, height: 10)
                            }
                        }
                        .padding(12)
                        
                    }
                    .borderedTextLayout(title: "Password",
                                        value: password,
                                        isValidate: Validation().textValidation(text: password, validationType: .password).0,
                                        errorMsg: Validation().textValidation(text: password, validationType: .password).1)
                    
                    
                    ///
                    ///   Email Textfield
                    ///
                    
                    HStack( spacing: 10){
                        Image("email")
                            .frame(width: 10, height: 10)
                            .padding(12)
                        TextField("", text: $email).modifier(TextFieldClearButton(text: $email))
                            .onChange(of: email, perform: { newValue in
                                if newValue == " "{
                                    email = ""
                                }
                            })
                        
                        
                    }
                    .borderedTextLayout(title: "Email",
                                        value: email,
                                        isValidate: Validation().textValidation(text: email, validationType: .email).0,
                                        errorMsg: Validation().textValidation(text: email, validationType: .email).1)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            print("Forgotten password action")
                        }) {
                            Text("Forgotten password?")
                                .foregroundColor(Color.primeryColor)
                        }
                    }
                    
                    
                }
            }
        }
            Spacer()
            
            ///
            ///   Login Button
            ///
            
            Button(action: {
                print("LOGIN action")
            }) {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(10.0)
                
            }
            .frame(width: UIScreen.main.bounds.width - 60, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.primeryColor)
            .cornerRadius(10)
            .padding(.bottom, 10)
            
            HStack(alignment: .center) {
                Text("Don't have an account?")
                    .foregroundColor(Color.grayAccests)
                Button(action: {
                    print("Forgotten password action")
                }) {
                    Text("Sign Up")
                        .foregroundColor(Color.primeryColor)
                }
            }
        }.padding(20)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
