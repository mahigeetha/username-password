import 'package:flutter/material.dart';
class Bmw extends StatefulWidget {
  const Bmw({Key? key}) : super(key: key);
  @override
  State<Bmw> createState() => _BmwState();}
class _BmwState extends State<Bmw> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name= '';
  String _password = '';
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: SizedBox(
                height: 70,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'email',
                      labelText: 'email',
                      border: OutlineInputBorder(),
                    ),
                    validator: validateEmail,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 70,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: 'password',
                    labelText: 'password',
                    border: OutlineInputBorder(),
                  ),
                  validator: validatePassword,
                ),

              ),
            ),

            ElevatedButton(onPressed: (){
              onPressed: validateInputs();
            }, child: Text('Submit')),
            SizedBox(
              height: 30,
            ),

            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('fogot password',style: TextStyle(color: Colors.blue),),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('dont have an account',style: TextStyle(color: Colors.blue),),
                )


              ],
            )


          ],
        ),
      ),
    );
  }


  void validateInputs()
  {
    if(_formKey.currentState!.validate()){
      print('called');
    }
  }
}
String? validateEmail(String? value){
  if(value!.isEmpty){
    return 'please enter email';
  }
  else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
    return 'pleas enter a valid email';
  }
  else {
    return null;
  }
}


String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Invalid password!";
  }
  if (value.length < 8) {
    return "Password must has 8 characters";
  }
  if (!value.contains(RegExp(r'[A-Z]'))) {
    return "Password must has uppercase";
  }
  if (!value.contains(RegExp(r'[0-9]'))) {
    return "Password must has digits";
  }
  if (!value.contains(RegExp(r'[a-z]'))) {
    return "Password must has lowercase";
  }
  if (!value.contains(RegExp(r'[#?!@$%^&*-]'))) {
    return "Password must has special characters";
  } else{
    return null;
  }

}






