import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:example/blocs/bottomNavigationBloc.dart';

class BluePage extends StatefulWidget {
  const BluePage({Key key}) : super(key: key);

  @override
  _BluePageState createState() => _BluePageState();
}

class _BluePageState extends State<BluePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Blue Page',
          style: Theme.of(context).textTheme.headline5.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: MaterialButton(
                  color: Colors.amber,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  splashColor: Colors.black87,
                  onPressed: () {
                    BlocProvider.of<BottomNavigationBloc>(context)
                        .add(BottomNavigationItems.GreenPage);
                  },
                  child: Text(
                    "Open The Green Page",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
