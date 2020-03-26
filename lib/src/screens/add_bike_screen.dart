import 'package:bikes/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AddBikeScreen extends StatefulWidget {

  @override
  _AddBikeScreenState createState() => _AddBikeScreenState();
}

class _AddBikeScreenState extends State<AddBikeScreen> {

  final _formKey = GlobalKey<FormState>();

  String _frameSize = 'S';
  Bike _bike = Bike();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            'assets/logo.svg',
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            children: <Widget>[
              BikesTextField(
                label: 'photo',
                onSaved: (String value) => _bike.photoUrl = value,
              ),
              BikesTextField(
                label: 'name',
                onSaved: (String value) => _bike.name = value,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: BikesTextField(
                      label: 'category',
                      onSaved: (String value) => _bike.category = value,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hasFloatingPlaceholder: true,
                        labelText: 'frame size',
                        border: InputBorder.none
                      ),
                      value: _frameSize,
                      items: <String>['XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL']
                        .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      onChanged: (String value){
                        setState(() => _frameSize = value);
                        FocusScope.of(context).unfocus();
                      },
                      onSaved: (String value) => _bike.frameSize = value,
                    ),
                  ),
                ]
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: BikesTextField(
                      label: 'location',
                      onSaved: (String value) => _bike.location = value,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: BikesTextField(
                      label: 'price range',
                      onSaved: (String value) => _bike.priceRange = value,
                    ),
                  )
                ]
              ),
              BikesTextField(
                label: 'description',
                textInputAction: TextInputAction.done,
                onFieldSubmitted: () => _addBike(_bike),
                onSaved: (String value) => _bike.description = value,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                height: 60,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  elevation: 0,
                  child: Text('Add bike'),
                  onPressed: () => _addBike(_bike),
                )
              )
            ],
          ),
        )
      )
    );
  }

  _addBike(bike){
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Provider.of<BikesProvider>(context, listen: false).addBike(bike);
      Navigator.pop(context);
    }
  }
}