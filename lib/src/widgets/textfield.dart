import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BikesTextField extends StatelessWidget{
  const BikesTextField({
    @required this.label,
    this.maxLength = 30,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.focusNode,
    this.nextFocusNode,
    this.onFieldSubmitted,
    this.onSaved,
    this.initialValue,
  }) : assert(label != null);

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
        initialValue: initialValue ?? '',
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
          if (value.trim().isEmpty) {
            return 'Enter $label';
          }
          return null;
        },
        onSaved: onSaved,
      ),
    );
  }
}