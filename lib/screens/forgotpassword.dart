import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projetv2/global/golobal.dart';
import 'package:projetv2/screens/login_screen.dart';
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
  
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final  emailTextEditingController =TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _submit(){
    firebaseAuth.sendPasswordResetEmail(
        email: emailTextEditingController.text.trim()
    ).then((value){
      Fluttertoast.showToast(msg: "we have sent you an email to recover password,please check email");
    }).onError((error, stackTrace){
      Fluttertoast.showToast(msg: "Error Occured :\n ${error.toString()}");
    });
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
                  'Reset password',
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
                                    "Reset password",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  )
                              ),
                              SizedBox(height: 20,),

                              GestureDetector(
                                onTap: (){},
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
                                    "Already have an account?",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));

                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue,
                                      ),
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
