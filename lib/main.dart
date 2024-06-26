import 'dart:convert';

import 'package:dealsdray/otpVerify.dart';
import 'package:dealsdray/service/respAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
//import 'package:flutter/services.dart' show rootBundle;

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3))
        .then((value) => {FlutterNativeSplash.remove()});
  }

  int _counter = 0;
  var _phoneNumber;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: // Generated code for this Column Widget...
              Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Opacity(
                opacity: 0.5,
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Opacity(
                    opacity: .5,
                    child: SizedBox(
                      height: 200,
                      child: Image(
                        image: AssetImage(
                          'assets/images/logo.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Switch.adaptive(
                value: true,
                onChanged: (newValue) async {},
              ),
              const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Hey good to see you!',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                        child: Text(
                          'Please provide your phone number',
                        ),
                      ),
                      Form(
                        key:
                            _formKey, // Associate the form key with this Form widget
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: const InputDecoration(
                                    hintText: "enter the phone number"),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _phoneNumber =
                                      value!; // Save the entered name
                                },
                              ),
                              const SizedBox(height: 20.0),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!
                                        .save(); // Save the form data
                                    print(_phoneNumber);
                                    if (await login(_phoneNumber)) {
                                      _navigateToNextPage();
                                    }
                                    _navigateToNextPage(); // Print the entered name
                                  } else {
                                    print('Please fill in the required fields');
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: const Text(
                                  'Send code',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void _navigateToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Otpverify(phoneNumber: _phoneNumber)),
    );
  }
}
