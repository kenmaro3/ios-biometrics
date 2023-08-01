//
//  Home.swift
//  Biometrics
//
//  Created by Kentaro Mihara on 2023/07/24.
//

import SwiftUI
import LocalAuthentication

struct Home: View {
    var size: CGSize
    @State private var isFaceIdDone: Bool = false
    var body: some View {
        VStack(
            alignment: .center,
            spacing: 10
            
        ){
            Text(isFaceIdDone ? "Face ID worked!!" : "Hello, world")
                .onAppear{
                    print("here")
                    Task.detached{ @MainActor in
                        print("will start on appear main")
                        faceIdAuthentication()
                        
                    }
                }
            
            Button{
                isFaceIdDone = false
                faceIdAuthentication()
                
            } label: {
                Text("Reset")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: size.width * 0.4)
                    .padding(.vertical, 15)
                    .background{
                        Capsule()
                            .fill(.black)
                    }
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(maxHeight: .infinity, alignment: .center)
    }
    
    func faceIdAuthentication(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "Authenticate to access the app"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){ success, authenticationError in
                if success{
                    print("successed")
                    isFaceIdDone = true
                }else{
                    print("failed")
                }
            }
        }else{
            // Device does not support Face ID or Touch ID
            print("Biometric authentication unavailable")
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(size: CGSize())
    }
}
