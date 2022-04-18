import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mynotes/views/login_view.dart';
import 'package:mynotes/views/register_view.dart';
import 'firebase_options.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: { // this is named route maine pahle se define kar diya ke mai screen change ya view change karunga 
                   // so this is not anonymous route 
        '/login/' : (context) => const LoginView(),
        '/register/' : (context) => const RegisterView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

//    @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar : AppBar(title: const Text('Home')),
//       body : FutureBuilder(
//         future: Firebase.initializeApp(
//               options : DefaultFirebaseOptions.currentPlatform,
//             ),
//         builder:(context,snapshot){
//           switch(snapshot.connectionState){
//             case ConnectionState.done:
//               // final user=FirebaseAuth.instance.currentUser;
//               // print(user);
//               // final emailVerified= user?.emailVerified ?? false;
//               // if(emailVerified){
//               //   // print("You are a verified user");
//               //   return const Text('Done');
//               // }
//               // else{
//               //   // print("You need to verify your email first");
//               //  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VerifyEmailView()));
//               // // pushing a ( a new screen) on the screen 
//               //   return const VerifyEmailView(); // now just pushing a widget on the screen homepage itself ab bas
//               //    // naya widget purane vale widget ke oopar aa jayega 
//               // }
//               // // return const Text('Done');
//               return const LoginView();
//              default:
//               return const Text('Loading...');
//           }
//         },
//        ),
//      );
//   }
// }
   @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
              options : DefaultFirebaseOptions.currentPlatform,
            ),
        builder:(context,snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.done:
              // final user=FirebaseAuth.instance.currentUser;
              // print(user);
              // final emailVerified= user?.emailVerified ?? false;
              // if(emailVerified){
              //   // print("You are a verified user");
              //   return const Text('Done');
              // }
              // else{
              //   // print("You need to verify your email first");
              //  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VerifyEmailView()));
              // // pushing a ( a new screen) on the screen 
              //   return const VerifyEmailView(); // now just pushing a widget on the screen homepage itself ab bas
              //    // naya widget purane vale widget ke oopar aa jayega 
              // }
              // // return const Text('Done');
              return const LoginView();
             default:
              // return const Text('Loading...');
              return const CircularProgressIndicator();
          }
        },
       );
  }
}

// class VerifyEmailView extends StatefulWidget {
//   const VerifyEmailView({ Key? key }) : super(key: key);

//   @override
//   State<VerifyEmailView> createState() => _VerifyEmailViewState();
// }

// class _VerifyEmailViewState extends State<VerifyEmailView> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(title: const Text('verify email'),),
//       body: Column(children: [
//           const Text('Please verify your email address : '),
//           TextButton(
//             onPressed: () async {
//               final user = FirebaseAuth.instance.currentUser;
//               await user?.sendEmailVerification();
//             },
//             child: const Text('Send email verification'),
//           )
//         ],
//         ),
//     );
//   }
// }





