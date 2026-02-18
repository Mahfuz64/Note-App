import 'package:flutter/material.dart';
import 'package:mynote/database/user.dart';
import 'package:mynote/function/validator.dart';
import 'package:mynote/utils/bottom.dart';
import 'package:mynote/widget/Social.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool isSelected = true;
  bool ischeck = false;
  TextEditingController email = TextEditingController();
  TextEditingController Password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5,
            children: [
              SizedBox(height: 80),
              SizedBox(
                height: 200,
                width: 200,
                child: Card(
                  elevation: 1,
                  child: Image.asset("asset/Splashscreen.png"),
                ),
              ),
              Text(
                "Welcome Back!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Text("Login To Your Account", style: TextStyle(fontSize: 16)),
              SizedBox(height: 40),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: 'Enter Your Email',

                  filled: true,
                ),
                validator: (String? value) {
                  return (value == null || !value.contains("@"))
                      ? "Please Enter valid Email"
                      : null;
                },
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                obscureText: isSelected,
                controller: Password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.security_outlined),
                  labelText: 'Enter Your Password',
                  filled: true,
                  suffixIcon: InkWell(
                    onTap: () {
                      isSelected = !isSelected;
                      setState(() {});
                    },
                    child: isSelected
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  ),
                ),
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: ischeck,
                    onChanged: (value) {
                      ischeck = value!;
                      setState(() {});
                    },
                  ),
                  Text("Remember Me"),
                ],
              ),
              InkWell(
                onTap: () async {
                 

                  if (validate(email.text, Password.text)) {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    if (ischeck) {
                      await prefs.setBool("islogin", true);
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Sucessful")),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Bottom()),
                    );
                  } else {
                    
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("User or Password Incorrect")),
                    );
                  }
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepPurple,
                  ),
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Forget Password',
                      style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Container(height: 1, color: Colors.grey)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(child: Container(height: 1, color: Colors.grey)),
                ],
              ),
              SizedBox(height: 10),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  social(
                    imageaddress:
                        'https://cdn2.hubspot.net/hubfs/53/image8-2.jpg',
                  ),
                  social(
                    imageaddress:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiXN9xSEe8unzPBEQOeAKXd9Q55efGHGB9BA&s",
                  ),
                  social(
                    imageaddress:
                        "https://cdn-icons-png.freepik.com/512/0/747.png",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
