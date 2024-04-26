
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

createUserWithEmailAndPassword(String emailAddress, password, context) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    User? user = credential.user;
    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Successfully")));
    }
    else{

    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The password provided is too weak.")));
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The account already exists for that email.")));
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
signInWithEmailAndPassword(String emailAddress, password, context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    User? user = credential.user;
    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login Successfully")));
    } else {
      // Handle the case when user is null (unlikely in signInWithEmailAndPassword)
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("No user found for that email.")));
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Wrong password provided.")));
      print('Wrong password provided.');
    } else {
      // Handle other FirebaseAuthException cases if needed
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.message}")));
      print('Error: ${e.message}');
    }
  } catch (e) {
    // Handle other exceptions if needed
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")));
    print('Error: $e');
  }
}