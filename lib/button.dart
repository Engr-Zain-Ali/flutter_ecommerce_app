
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String label;
  final void Function()? onTap; // Corrected the spelling of 'Function'

  const Button({Key? key, required this.label, this.onTap}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => widget.onTap?.call(),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            width: MediaQuery.of(context).size.width,
            height: 70,
            
            child: Center(
              child: Text(
                widget.label,
                style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
