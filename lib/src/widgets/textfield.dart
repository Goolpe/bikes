import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BikesTextField extends StatelessWidget{
  const BikesTextField({
    @required this.label,
    this.focusNode,
    this.nextFocusNode,
    this.maxLength = 30,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.controller,
    this.onSaved
  });

  final String label;
  final int maxLength;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final void Function() onFieldSubmitted;
  final TextEditingController controller;
  final Function(String) onSaved;

  @override
  Widget build(BuildContext context){

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          counterText: '',
        ),
        textCapitalization: TextCapitalization.sentences,
        onFieldSubmitted: (_) => onFieldSubmitted == null
         ? FocusScope.of(context).nextFocus()
         : onFieldSubmitted(),
        textInputAction: textInputAction,
        focusNode: focusNode,
        maxLength: maxLength,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Enter $label';
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }
}