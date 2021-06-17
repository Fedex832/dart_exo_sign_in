import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign in',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  bool _validatePassword = false;
  String _email = 'plop@plop.plop';
  String _mdp = 'plop';
  String _currentMail = '';
  String _currentMdp = '';
  onSubmit(BuildContext context) {
    key.currentState!.save();
    if (_currentMail == _email && _currentMdp == _mdp) {
      return Navigator.push(
          context, MaterialPageRoute(builder: (context) => Sucess()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[600],
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  Text(
                    'Get maximum result with minimal effort with ${Text('Appetro')} UI Kit',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Form(
            key: key,
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      onSaved: (val) => _currentMail = val!,
                      decoration: InputDecoration(hintText: 'mail@mail.mail'),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                    TextFormField(
                      onSaved: (val) => _currentMdp = val!,
                      onChanged: (String val) {
                        if (val != '') {
                          setState(() => _validatePassword = true);
                        } else {
                          setState(() => _validatePassword = false);
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          suffixIcon: Icon(
                        Icons.verified,
                        color: _validatePassword ? Colors.green : Colors.grey,
                      )),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                      onPressed: () => onSubmit(context),
                      child: Text('Sign In'),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Sucess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('YOU WIN!!!!'),
    );
  }
}
