import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mynotes/firebase_options.dart';


class LoginView extends StatefulWidget {
  const LoginView({ Key? key }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  // late is a keyword in dart  which gives guarantee that _email and _password variables ki baad mai value assign kuch ho
  // jayegi
  // ab HomePage ek statefulwidget hai to ookai paas 2 function hai ek initState() jo by default run hota hai to 
  //texteditingcontrollers jo maine create kiyai hai  email and password ki value oon textfield se lakar esmai daldenge 
  //to hum init ko override kar rahe hai and baad mai in texteditingcontrollers ki value ko dispose bhi karna hai
  // so init and dispose are two important tasks
  
  @override
  void initState() {
    _email=TextEditingController();
    _password=TextEditingController();
    super.initState();
  } 
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(title: const Text('Login')),
      body : FutureBuilder(
        future: Firebase.initializeApp(
              options : DefaultFirebaseOptions.currentPlatform,
            ),
        builder:(context,snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.done:
               return Column(
                children : [
                TextField(controller: _email,
                enableSuggestions: false, 
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText:'Enter your email here',),),
                TextField(controller: _password,
                obscureText: true, 
                enableSuggestions: false, 
                autocorrect: false,
                decoration: const InputDecoration(hintText:'Enter your password here',),),
                TextButton(onPressed: () async {
                  final email=_email.text;
                  final password=_password.text;
                  try{
                  final userCredential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email, password: password,
                    );
                    print(userCredential);
                  }
                  on FirebaseAuthException catch(e){
                    // print(e.code);
                    if(e.code=='user-not-found'){
                      print('user not found');
                    }
                    else if(e.code=='wrong-password'){
                      print("wrong password");
                    }
                    // else{
                    //   // password gaalaat ho to 
                    //   print('something else happened');
                    //   print(e.code);
                    // }
                  }
                  catch(e){
                    print(e.runtimeType);
                    print('Something bad happened');
                    print(e);
                  }
                },
                child : const Text('Login')),

                ],
             );
             default:
              return const Text('Loading...');
          }
        },
       ),
     );
  }
  
}