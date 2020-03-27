import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BikesTextField extends StatelessWidget{
  const BikesTextField({
    this.label = '',
    this.maxLength = 30,
    this.initialValue = '',
    this.textInputAction = TextInputAction.next,
    this.maxLines = 1,
    this.focusNode,
    this.nextFocusNode,
    this.onFieldSubmitted,
    this.onSaved,
    this.keyboardType = TextInputType.text,
  });

  final String label;
  final int maxLength;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final void Function() onFieldSubmitted;
  final Function(String) onSaved;
  final String initialValue;
  final int maxLines;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context){

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: label,
          counterText: '',
        ),
        keyboardType: keyboardType,
        maxLines: maxLines,
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