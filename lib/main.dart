import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

void main() {
  runApp(const MyApp12());
}

class MyApp12 extends StatelessWidget {
  const MyApp12({super.key});

  @override
  Widget build(BuildContext context) {
    //! Androd
    if (UniversalPlatform.isAndroid) {
      debugPrint("Android");

      // ? Material UI Presentation
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AndroidLoginScreen(),
      );
    } else if (UniversalPlatform.isWeb) {
      debugPrint("isIOS");

      return const CupertinoApp(
        home: WebLoginScreen(),
      );
    } else {
      return const MaterialApp(
        home: DefaultLoginScreen(),
      );
    }
  }
}

class AndroidLoginScreen extends StatelessWidget {
  const AndroidLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            hearder(context),
            inputField(context),
            forgotPassword(context),
            signup(context)
          ],
        ),
      ),
    );
  }
}

hearder(context) {
  return const Column(children: [
    Text(
      "Login",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  ]);
}

inputField(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const TextField(
        decoration: InputDecoration(
          hintText: "Username",
          border: OutlineInputBorder(),
          filled: true,
        ),
        style: TextStyle(height: 2),
      ),
      const SizedBox(height: 10),
      const TextField(
        decoration: InputDecoration(
          hintText: "Password",
          border: OutlineInputBorder(),
          filled: true,
        ),
        style: TextStyle(height: 2),
        obscureText: true,
      ),
      const SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Color.fromARGB(255, 150, 115, 231),
        ),
        child: const Text(
          "Login",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      )
    ],
  );
}

forgotPassword(context) {
  return const Padding(
    padding: EdgeInsets.only(top: 1),
    child: Text(
      "Forgot password?",
      style: TextStyle(color: Colors.black),
    ),
  );
}

signup(context) {
  return Container(
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Sign up here",
              style: TextStyle(color: Color.fromARGB(255, 150, 115, 231)),
            ),
          )
        ],
      ));
}

class WebLoginScreen extends StatelessWidget {
  const WebLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Web Login'),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                    'assets/images/login.png'), // Asegúrate de que la imagen esté en tu carpeta assets
              ),
              const SizedBox(height: 20),
              const Text(
                'SIMPLE',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.white,
                ),
              ),
              const SizedBox(height: 20),
              const CupertinoTextField(
                placeholder: 'Username',
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              const SizedBox(height: 20),
              const CupertinoTextField(
                placeholder: 'Passphrase',
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              CupertinoButton.filled(
                onPressed: () {},
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                onPressed: () {},
                child: const Text('Reset your passphrase?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultLoginScreen extends StatelessWidget {
  const DefaultLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Unsupported Platform'),
      ),
    );
  }
}
