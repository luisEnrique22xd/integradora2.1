import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/home_screen.dart';
import 'package:integradora2_1/screens/login_screen.dart';

class RegisterNow extends StatefulWidget {
  const RegisterNow({super.key});

  @override
  State<RegisterNow> createState() => _RegisterNowState();
}
  
class _RegisterNowState extends State<RegisterNow> {
  String name="", lastName="", password= "", address="", phone="";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController lastNamecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController addresscontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  
  registration()async{
    if (password!= null){
      try{
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: name, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Registered Successfully",
          style: TextStyle(fontSize: 20.0),
        )));
        Navigator.push(context,MaterialPageRoute(builder: (context) =>  LoginScreen()),);
      }on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white, 
      body: SingleChildScrollView(
        child: Center(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(
                //img size
                height: 250.0,
                width: 200.0,
                child:
                 Image(
                  image: AssetImage('assets/img/logoWC.png')//logo
                  )
              ),
              const Text("Welcome to Water Care ",
              style: TextStyle(fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              )
              ),
               const SizedBox(
                height: 25.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: TextFormField(
                validator:  (value){
                  if(value == null || value.isEmpty){
                    return "Please enter your name";
                  }
                  return null;
                } ,
                controller: namecontroller,
                obscureText: false,

                decoration:   InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0),
                    ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                    ),
                    fillColor: Colors.blue[100],
                    filled: true,
                    hintText: "Name",
                ),
              ),
              
              ),
             const SizedBox(height: 10.0),
             Container(
                padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: TextFormField(
                validator:  (value){
                  if(value == null || value.isEmpty){
                    return "Please enter your Last name";
                  }
                  return null;
                } ,
                controller: lastNamecontroller,
                obscureText: false,

                decoration:   InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0),
                    ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                    ),
                    fillColor: Colors.blue[100],
                    filled: true,
                    hintText: "Last Name",
                ),
              ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: TextFormField(
                validator:  (value){
                  if(value == null || value.isEmpty){
                    return "Please enter your password";
                  }
                  return null;
                } ,
                controller: passwordcontroller,
                obscureText: true,

                decoration:   InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0),
                    ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                    ),
                    fillColor: Colors.blue[100],
                    filled: true,
                    hintText: "Password",
                ),
              ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: TextFormField(
                validator:  (value){
                  if(value == null || value.isEmpty){
                    return "Please enter your phone";
                  }
                  return null;
                } ,
                controller: phonecontroller,
                obscureText: false,

                decoration:   InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0),
                    ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                    ),
                    fillColor: Colors.blue[100],
                    filled: true,
                    hintText: "Phone",
                ),
              ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: TextFormField(
                validator:  (value){
                  if(value == null || value.isEmpty){
                    return "Please enter your address";
                  }
                  return null;
                } ,
                controller: addresscontroller,
                obscureText: false,

                decoration:   InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20.0),
                    ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                    ),
                    fillColor: Colors.blue[100],
                    filled: true,
                    hintText: "Address",
                ),
              ),
              
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Are you an user?'),
                   const SizedBox(width: 5.0,),
                   GestureDetector(
                        child: const Text(
                           'Log in',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline, // Add underlining for emphasis
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  LoginScreen()),
                          );
                        },
                      ),
                ],
              ),
              GestureDetector(
                  onTap:(){if(_formkey.currentState!.validate()){
                            setState(() {
                              name = namecontroller.text;
                              lastName = lastNamecontroller.text;
                              password = passwordcontroller.text;
                              phone = phonecontroller.text;
                              address = addresscontroller.text;
                            });
                            registration();
                          }
                          Navigator.push(context,MaterialPageRoute(builder: (context) =>  HomeScreen()),
                          );
                          },
                  child: Container(
                    padding: const EdgeInsets.all(15),//tamaño del boton vertical
                    margin: const EdgeInsets.symmetric(horizontal: 125),//tamaño del boton horizontal
                    decoration:  BoxDecoration(color: Colors.blue,
                    borderRadius: BorderRadius.circular(25)),//border
                    child: const Center(
                      child: Text('Register now',
                      style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold),),
                      ),
                  ),
                )
            ],
          ),
        ),
      ),
      )
    );
  }
}