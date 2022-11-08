import 'package:flutter/material.dart';
import 'package:sample_app/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 250,
              height: 250,
              child: Image.asset('assets/logo.jpg'),
            ),

            // User input box
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: TextFormField(
                controller: _usernameController,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
                decoration: const InputDecoration(
                  hintText: "Input Username",
                ),
              ),
            ),

            // Password input box
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
                decoration: const InputDecoration(
                  hintText: "Input Password",
                ),
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
              child: MaterialButton(
                onPressed: () {
                  // ignore: avoid_print
                  print('Username: ${_usernameController.text}');
                  // ignore: avoid_print
                  print('Password: ${_passwordController.text}');

                  // Route Me
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                textColor: Colors.white,
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
