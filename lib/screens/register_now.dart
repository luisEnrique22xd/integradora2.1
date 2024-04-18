import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:integradora2_1/screens/login_screen.dart';

class RegisterNow extends StatefulWidget {
  const RegisterNow({super.key});

  @override
  State<RegisterNow> createState() => _RegisterNowState();
}
  
class _RegisterNowState extends State<RegisterNow> {
  TextEditingController emailcontroller =  TextEditingController();
  TextEditingController passwordcontroller =  TextEditingController();
  TextEditingController password2controller =  TextEditingController();
  void registration()async{
    try{
      final UserCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text);
    }on FirebaseAuthException catch(e){
      if (passwordcontroller.text != password2controller.text){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Las contraseñas no coninciden")));
      }else if(e.code == 'weak-password'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Las contraseña es demaciado debil")));
      }else if(e.code == 'email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Correo ya existente")));
      }else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Ha ocurrido un error al intentar registrase. Intentelo de nuevo, si el error persiste contactenos")));
      }
    }
    Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white, 
      body: SingleChildScrollView(
        child: Center(
        child: Form(
          
          child: Column(
            children: [
              SizedBox(height: 50,),
              const SizedBox(
                //img size
                height: 250.0,
                width: 200.0,
                child:
                 Image(
                  image: AssetImage('assets/images/logoWC.png')//logo
                  )
              ),
              SizedBox(height: 15,),
              const Text("Welcome to Water Care ",
              style: TextStyle(fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              )
              ),
              const Text("Register user",
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
                controller: emailcontroller,
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
                    hintText: "Email",
                ),
              ),
              
              ),
             const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: TextFormField(
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
              const SizedBox(height: 15.0,),
              Container(
              padding: const EdgeInsets.symmetric(horizontal:30.0),
              child: TextFormField(
                controller: password2controller,
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
                    hintText: "Re-type your Password",
                ),
              ),
              ),
              const SizedBox(height: 5.0),
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
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        },
                      ),
                ],
              ),
              const SizedBox(height: 15.0),
              GestureDetector(
                  onTap: registration,
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