import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_workflow/screens/home/home_page.dart';
import 'package:provider_workflow/screens/sign_in/sign_in_page.dart';
import 'package:provider_workflow/services/firebase_auth_service.dart';

class AuthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<FirebaseAuthService>(context, listen: false);

    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          return user != null ? HomePage() : SignInPage();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
