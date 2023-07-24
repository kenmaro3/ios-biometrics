//
//  Home.swift
//  Biometrics
//
//  Created by Kentaro Mihara on 2023/07/24.
//

import SwiftUI
import LocalAuthentication

struct Home: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear{
                print("here")
                Task.detached{ @MainActor in
                    print("will start on appear main")
                    faceIdAuthentication()
                    
                }
            }
    }
    
    func faceIdAuthentication(){
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            let reason = "Authenticate to access the app"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason){ success, authenticationError in
                if success{
                    print("successed")
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

#Preview {
    Home()
}
