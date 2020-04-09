import UIKit
import GoogleSignIn
import FirebaseAuth
import FirebaseUI

class ViewController: UIViewController, GIDSignInDelegate {
    
     override func viewDidLoad() {
             super.viewDidLoad()
             // Do any additional setup after loading the view.
            GIDSignIn.sharedInstance()?.presentingViewController = self
              // Automatically sign in the user.
              GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
         }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
      if let error = error {
        if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
          print("The user has not signed in before or they have since signed out.")
        } else {
          print("\(error.localizedDescription)")
        }
        return
      }
      // Perform any operations on signed in user here.
      let userId = user.userID                  // For client-side use only!
      let idToken = user.authentication.idToken // Safe to send to the server
      let fullName = user.profile.name
      let givenName = user.profile.givenName
      let familyName = user.profile.familyName
      let email = user.profile.email
    //      self.window?.rootViewController!.performSegue(withIdentifier: "toHome", sender: nil)
        print("疲れたーーーーーーーーー")
    }
    
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBAction func didTapSignOut(_ sender: AnyObject) {
      GIDSignIn.sharedInstance().signOut()
      print("Sign out!")
    }
}

//extension ViewController: GIDSignInDelegate {
//
//    override func viewDidLoad() {
//         super.viewDidLoad()
//         // Do any additional setup after loading the view.
//        GIDSignIn.sharedInstance()?.presentingViewController = self
//          // Automatically sign in the user.
//          GIDSignIn.sharedInstance()?.restorePreviousSignIn()
//     }
//
//func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
//          withError error: Error!) {
//  if let error = error {
//    if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
//      print("The user has not signed in before or they have since signed out.")
//    } else {
//      print("\(error.localizedDescription)")
//    }
//    return
//  }
//  // Perform any operations on signed in user here.
//  let userId = user.userID                  // For client-side use only!
//  let idToken = user.authentication.idToken // Safe to send to the server
//  let fullName = user.profile.name
//  let givenName = user.profile.givenName
//  let familyName = user.profile.familyName
//  let email = user.profile.email
////      self.window?.rootViewController!.performSegue(withIdentifier: "toHome", sender: nil)
//    print("疲れたーーーーーーーーー")
//}
//}

