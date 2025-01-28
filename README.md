# Shopify App - Firebase Authentication

A Flutter shopping application integrated with Firebase Authentication for user login and signup functionality.

## Features

- **Login Screen**
    
    - Email and password authentication.
        
    - Navigation to the Signup Screen.
    
- **Signup Screen**
    
    - Navigation back to the Login Screen after successful signup.
    
- **Firebase Integration**
    
    - Secure user authentication using Firebase Auth.
        
    - Seamless navigation between screens based on authentication state.

## Code Structure

- **`main.dart`**
    
    - Initializes Firebase.
    
- **`login_screen.dart`**
    
    - Handles user login with Firebase Auth.
     
- **`sign_up_screen.dart`**
    
    - Manages user registration with Firebase Auth.


## Dependencies

- [`firebase_core`](https://pub.dev/packages/firebase_core): Firebase core plugin.
    
- [`firebase_auth`](https://pub.dev/packages/firebase_auth): Firebase Authentication plugin.