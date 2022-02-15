//
//  SignUpViewController.swift
//  Cathay
//
//  Created by Kong Yau Lee on 13/11/2021.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var again: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendMessage(_ sender: Any) {
        if ((emailTextField.text=="")||(passwordTextField.text=="")){
            let alert = UIAlertController(title: "You did not input Email or Password", message: "Please try again", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert,animated: true,completion: nil)
        }
        else{
            if emailTextField.text == "" {
                let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                present(alertController, animated: true, completion: nil)
            
            } else {
                Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                    
                    if error == nil {
                        print("You have successfully signed up")
                        //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                        
                        self.performSegue(withIdentifier: "BackToLogIn", sender: sender)
                        
                    } else {
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @Override 
    Auth.auth().signIn(with: credential) { authResult, error in
        if let error = error {
          let authError = error as NSError
          if isMFAEnabled, authError.code == AuthErrorCode.secondFactorRequired.rawValue {
            // The user is a multi-factor user. Second factor challenge is required.
            let resolver = authError
              .userInfo[AuthErrorUserInfoMultiFactorResolverKey] as! MultiFactorResolver
            var displayNameString = ""
            for tmpFactorInfo in resolver.hints {
              displayNameString += tmpFactorInfo.displayName ?? ""
              displayNameString += " "
            }
            self.showTextInputPrompt(
              withMessage: "Select factor to sign in\n\(displayNameString)",
              completionBlock: { userPressedOK, displayName in
                var selectedHint: PhoneMultiFactorInfo?
                for tmpFactorInfo in resolver.hints {
                  if displayName == tmpFactorInfo.displayName {
                    selectedHint = tmpFactorInfo as? PhoneMultiFactorInfo
                  }
                }
                PhoneAuthProvider.provider()
                  .verifyPhoneNumber(with: selectedHint!, uiDelegate: nil,
                                     multiFactorSession: resolver
                                       .session) { verificationID, error in
                    if error != nil {
                      print(
                        "Multi factor start sign in failed. Error: \(error.debugDescription)"
                      )
                    } else {
                      self.showTextInputPrompt(
                        withMessage: "Verification code for \(selectedHint?.displayName ?? "")",
                        completionBlock: { userPressedOK, verificationCode in
                          let credential: PhoneAuthCredential? = PhoneAuthProvider.provider()
                            .credential(withVerificationID: verificationID!,
                                        verificationCode: verificationCode!)
                          let assertion: MultiFactorAssertion? = PhoneMultiFactorGenerator
                            .assertion(with: credential!)
                          resolver.resolveSignIn(with: assertion!) { authResult, error in
                            if error != nil {
                              print(
                                "Multi factor finanlize sign in failed. Error: \(error.debugDescription)"
                              )
                            } else {
                              self.navigationController?.popViewController(animated: true)
                            }
                          }
                        }
                      )
                    }
                  }
              }
            )
          } else {
            self.showMessagePrompt(error.localizedDescription)
            return
          }
          // ...
          return
        }
        // User is signed in
        // ...
    }
}
