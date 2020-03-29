import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {

  final Widget child;
  final Function onPressed;

  PrimaryButton({@required this.child, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Theme(
      data: Theme.of(context).copyWith(

      ),
      child: RaisedButton(
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}