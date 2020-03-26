import 'package:bikes/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditBikeScreen extends StatefulWidget {
  EditBikeScreen({
    this.id
  });

  final int id;

  @override
  _EditBikeScreenState createState() => _EditBikeScreenState();
}

class _EditBikeScreenState extends State<EditBikeScreen> {
  
  final _formKey = GlobalKey<FormState>();

  String _frameSize = 'S';
  
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
      Provider.of<BikesProvider>(context, listen: false)
        .fetchBike(widget.id)
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BikesScaffold(
        body: Consumer<BikesProvider>(
          builder: (context, BikesProvider state, _){
            if(state.fetchingBike || state.bike == null || state.bike.id != widget.id){
              return SizedBox();
            }
            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: <Widget>[
                  BikesTextField(
                    label: 'photo',
                    initialValue: state.bike.photoUrl,
                    onSaved: (String value) => state.bike.photoUrl = value,
                  ),
                  BikesTextField(
                    label: 'name',
                    initialValue: state.bike.name,
                    onSaved: (String value) => state.bike.name = value,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: BikesTextField(
                          initialValue: state.bike.category,
                          label: 'category',
                          onSaved: (String value) => state.bike.category = value,
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
                          value: state.bike.frameSize ?? _frameSize,
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
                          onSaved: (String value) => state.bike.frameSize = value,
                        ),
                      ),
                    ]
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: BikesTextField(
                          label: 'location',
                          initialValue: state.bike.location,
                          onSaved: (String value) => state.bike.location = value,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: BikesTextField(
                          label: 'price range',
                          initialValue: state.bike.priceRange,
                          onSaved: (String value) => state.bike.priceRange = value,
                        ),
                      )
                    ]
                  ),
                  BikesTextField(
                    label: 'description',
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: () => _editBike(state.bike),
                    initialValue: state.bike.description,
                    onSaved: (String value) => state.bike.description = value,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    height: 60,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      elevation: 0,
                      child: Text(widget.id == null ? 'Add bike' : 'Update Bike'),
                      onPressed: () => _editBike(state.bike),
                    )
                  )
                ],
              ),
            );
          }
        )
      )
    );
  }

  _editBike(bike){
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Provider.of<BikesProvider>(context, listen: false).editBike(bike, widget.id);
      Navigator.pop(context);
    }
  }
}