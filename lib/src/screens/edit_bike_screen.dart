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
  
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
      Provider.of<BikeProvider>(context, listen: false)
        .fetchBike(context, widget.id)
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BikesScaffold(
        body: Consumer<BikeProvider>(
          builder: (context, BikeProvider state, _){
            if(state.fetchingData 
              || state.data == null 
              || state.data.id != widget.id
            ){
              return SizedBox();
            }
            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: <Widget>[
                  BikesTextField(
                    label: 'photo',
                    maxLength: 150,
                    initialValue: state.data.photoUrl,
                    onSaved: (String value) => state.data.photoUrl = value,
                  ),
                  BikesTextField(
                    label: 'name',
                    maxLength: 100,
                    initialValue: state.data.name,
                    onSaved: (String value) => state.data.name = value,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: BikesTextField(
                          initialValue: state.data.category,
                          label: 'category',
                          onSaved: (String value) => state.data.category = value,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: BikesTextField(
                          initialValue: state.data.frameSize,
                          label: 'frame size',
                          maxLength: 5,
                          onSaved: (String value) => state.data.frameSize = value,
                        ),
                      ),
                    ]
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: BikesTextField(
                          label: 'location',
                          initialValue: state.data.location,
                          onSaved: (String value) => state.data.location = value,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: BikesTextField(
                          label: 'price range',
                          initialValue: state.data.priceRange,
                          onSaved: (String value) => state.data.priceRange = value,
                        ),
                      )
                    ]
                  ),
                  BikesTextField(
                    label: 'description',
                    maxLength: 500,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    initialValue: state.data.description,
                    onSaved: (String value) => state.data.description = value,
                  ),
                  BikesButton(
                    label: '${widget.id == null ? 'Add' : 'Update'} Bike',
                    onPressed: () => _editBike(state.data),
                  )
                ],
              ),
            );
          }
        )
      )
    );
  }

  void _editBike(Bike bike){
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      widget.id == null
      ? Provider.of<BikesProvider>(context, listen: false).addBike(bike)
      : Provider.of<BikesProvider>(context, listen: false).editBike(bike, widget.id);
      Navigator.pop(context);
    }
  }
}