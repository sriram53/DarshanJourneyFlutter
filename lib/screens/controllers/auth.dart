import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:google_sign_in/google_sign_in.dart';

Client client = Client()
                .setEndpoint('https://cloud.appwrite.io/v1')
                .setProject('660bf21452c580f0986e')
                .setSelfSigned(status:true);


Account account = Account(client);

Future<String> createUser(String name,String email, String password) async{
  try{
    await account.create(userId: ID.unique(), email: email, password: password);
    return "success";
  }
  on AppwriteException catch (e) {
    return e.message.toString();
  }
}

Future<String> loginUser(String email,String password) async{
  try{
    await account.createEmailPasswordSession(email: email, password: password);
    return "success";
  }
  on AppwriteException catch (e) {
    return e.message.toString();
  }
}


// check if user session is active or not
Future<bool> checkSessions() async {
  try {
    await account.getSession(sessionId: "current");
    return true;
  } catch (e) {
    return false;
  }
}

// logout the user delete the session
Future logoutUser() async {
  await account.deleteSession(sessionId: "current");
}

// get details of the user logged in
Future<User?> getUser() async {
  try {
    final user = await account.get();
    return user;
  } catch (e) {
    return null;
  }
}

// send verification mail to the user
Future<bool> sendVerificationMail() async {
  try {
    await account.createVerification(
        url:
            "https://reset-password-and-verify-email-appwrite.onrender.com/verify");
    return true;
  } catch (e) {
    return false;
  }
}

// send recovery mail to the user
Future<bool> sendRecoveryMail(String email) async {
  try {
    await account.createRecovery(
        email: email,
        url:
            "https://reset-password-and-verify-email-appwrite.onrender.com/recovery");
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}


Future<bool> continueWithGoogle() async {
  // ignore: no_leading_underscores_for_local_identifiers
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);

  try {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      // User canceled the sign-in process
      return false;
    }
    return true;
  } catch (e) {
    print("error : ${e.toString()}");
    return false;
  }}