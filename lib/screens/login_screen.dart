import 'package:email_validator/email_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projetv2/screens/forgotpassword.dart';

import '../global/golobal.dart';
import 'main_page.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final  emailTextEditingController =TextEditingController();
  final passwordTextEditingController=TextEditingController();
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  void _submit() async {
    if (_formKey.currentState!.validate()) {
      await firebaseAuth.signInWithEmailAndPassword(
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim()
      ).then((auth) async {
        currentUser = auth.user;

        await Fluttertoast.showToast(msg: "Successfully Logged");
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => MainScreen()));
      }).catchError((errorMessage) {
        Fluttertoast.showToast(msg: "Error occured: \n $errorMessage");
      });
    }else{
      Fluttertoast.showToast(msg: "not all field valid");
    }

  }


  @override

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Column(
              children: [
                Image.asset('images/city.jpg'),
                SizedBox(height: 20,),
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 50)  ,
                    child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children: [
                        Form(
                          key:_formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [


                              //*********Email************
                              TextFormField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(100)
                                ],
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(40),
                                      borderSide:  BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      )
                                  ),
                                  prefixIcon: Icon(Icons.email,color: Colors.grey),
                                ),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (text) {
                                  if(text == null || text.isEmpty){
                                    return 'Email can not be empty';
                                  }
                                  if(EmailValidator.validate(text) == true){
                                    return null;
                                  }

                                  if(text.length<2){
                                    return "Please enter a valide email";
                                  }

                                  if(text.length>99){
                                    return "Email can not be more than 100 ";
                                  }
                                },
                                onChanged: (text) => setState(() {
                                  emailTextEditingController.text =text;
                                }),
                              ),

                              SizedBox(height: 20,),





                              //*******Password***********


                              TextFormField(
                                obscureText: !_passwordVisible,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(100)
                                ],
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(40),
                                        borderSide:  BorderSide(
                                          width: 0,
                                          style: BorderStyle.none,
                                        )
                                    ),
                                    prefixIcon: Icon(Icons.password,color: Colors.grey),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _passwordVisible ? Icons.visibility: Icons.visibility_off,
                                        color: Colors.grey,
                                      ),
                                      onPressed: (){
                                        setState(() {
                                          _passwordVisible= !_passwordVisible;
                                        });
                                      },
                                    )
                                ),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (text) {
                                  if(text == null || text.isEmpty){
                                    return 'Password can not be empty';
                                  }


                                  if(text.length<2){
                                    return "Please enter a valide password";
                                  }

                                  if(text.length>49){
                                    return "Password can not be more than 50 ";
                                  }
                                },
                                onChanged: (text) => setState(() {
                                  passwordTextEditingController.text =text;
                                }),
                              ),

                              SizedBox(height: 20,),




                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    onPrimary: Colors.white,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    minimumSize: Size(double.infinity, 50),
                                  ),


                                  onPressed: (){
                                    _submit();
                                  },
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  )
                              ),
                              SizedBox(height: 20,),

                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (c) => ForgotPasswordScreen()));
                                },
                                child: Text(
                                  'Forgot password',
                                  style: TextStyle(
                                    color: Colors.blue,

                                  ),
                                ),

                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Text(
                                    "Do not have an account?",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )
                )],
            )
          ],
        ),
      ),
    );
  }
}
