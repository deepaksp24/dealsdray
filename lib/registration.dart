import 'package:dealsdray/homepage.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _formKey = GlobalKey<FormState>();
  var _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Opacity(
                    opacity: .5,
                    child: Image(
                      image: AssetImage("assets/images/logo.png"),
                      width: 200,
                    ),
                  ),
                ),
                Text(
                  "Let's begin!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "please enter the crenditials to proceed",
                  style: TextStyle(
                      fontSize: 15,
                      color: const Color.fromARGB(255, 81, 81, 81)),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey, // Associate the form key with this Form widget
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              const InputDecoration(hintText: "your mail"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter mail.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            var mail = value;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "your password",
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                          obscureText: !_passwordVisible,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            var password = value;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "enter referral code (optional).",
                          ),
                          validator: (value) {},
                          onSaved: (value) {
                            var referral_code = value;
                          },
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
      floatingActionButton: Transform.translate(
        offset: Offset(0, -20), // Move the button 10 pixels up
        child: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {
            _navigateToNextPage();
          },
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  void _navigateToNextPage() {
    print("route");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Homepage()),
    );
  }
}
