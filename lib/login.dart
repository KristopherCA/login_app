import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  String _welcomeString;

  _clear() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
      _welcomeString = null;

    });
  }

 _welcome(){
    setState(() {

      if(_userController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
        _welcomeString = _userController.text;

        FocusScope.of(context).requestFocus(new FocusNode());



      }


    }
    );

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        titleSpacing: 100.0
      ),
      backgroundColor: Colors.blueGrey.shade200,
      body: Container(
        padding: EdgeInsets.only(bottom: 00.0),
        margin: EdgeInsets.only(bottom: 25.0),
        width: 800.0,
        height:  400.0,
        child: ListView(
          children: <Widget>[
            Image.asset( _welcomeString != null ? "images/happy.png"  :  "images/face.png" ,
              width: 100.0,
              height:100.0,
              color: Colors.black,
            ),
            Container(
              height: 175.0,
              width: 405.0, 
                margin: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
              padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _userController,
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "Username", icon: Icon(Icons.person)),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password", icon: Icon(Icons.lock)),
                  ),
                  Padding(padding: EdgeInsets.all(11.0)),
                  Center(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 35.0),
                          child: RaisedButton(
                              onPressed: _welcome,
                              color: Colors.redAccent,
                              child: Text("Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 19.0)
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 75.0, right: 25.0),
                          child: RaisedButton(
                              onPressed: _clear,
                              color: Colors.redAccent,
                              child: Text("Clear",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 19.0))),
                        ),
                      ],
                    ),
                  )
                ],
              ),

            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Center(


                child: Text(_welcomeString != null ? "Welcome $_welcomeString!" : "",
                style: TextStyle(color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w500),)
                )
                )
              ],


            )
          ],
        ),
      ),
    );
  }
}
