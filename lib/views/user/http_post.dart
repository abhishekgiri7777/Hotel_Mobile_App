import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:device_info/device_info.dart';

class SendDataHttpPost extends StatefulWidget {
  @override
  _SendDataHttpPostState createState() => _SendDataHttpPostState();
}

class _SendDataHttpPostState extends State<SendDataHttpPost> {
  get prefs => null;

  // static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  // Future<String> _deviceData;

  // @override
  // void initState() {
  //   super.initState();
  //   initPlatformState();
  // }

  // Future<void> initPlatformState() async {
  //   Future<void> deviceData;

  //   try {
  //     if (Platform.isAndroid) {
  //       deviceData = _readAndroidDeviceInfo(await deviceInfoPlugin.androidInfo);
  //     } else if (Platform.isIOS) {
  //       deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo)
  //           as Future<String>;
  //     }
  //   } on PlatformException {
  //     deviceData = 'Error:' as Future<void>;
  //   }
  //   if (!mounted) return;

  //   setState(() {
  //     _deviceData = deviceData;
  //   });
  // }

  // Future<String> _readAndroidDeviceInfo(AndroidDeviceInfo build) async {
  //   var info = await deviceInfoPlugin.androidInfo;
  //   String token = info.androidId.toString();
  //   return token;
  //   // {
  //   //   // 'type': build.model,
  //   //   'token': build.androidId,
  //   // };
  // }

  // Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
  //   return <String, dynamic>{
  //     // 'type': data.model,
  //     'token': data.identifierForVendor,
  //   };
  // }

  // final devicedata = ;
  Future deviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    prefs.setString({'deviceinfo', androidInfo.id});
    String token = prefs.getString("deviceinfo");
    // String token = androidInfo.androidId.toString();
    return token;
  }

  String deviceType = "Mobile_app";
  var gap = 10.0;
  var error;
  final _formkey = GlobalKey<FormState>();

  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _mobile = TextEditingController();
  final _email = TextEditingController();
  final _city = TextEditingController();
  final _address = TextEditingController();
  final _address2 = TextEditingController();
  final _zip = TextEditingController();
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();

  Future<void> postdata(
      Map<String, String> userData(
    String _firstname,
    String _lastname,
    String _mobile,
    String _email,
    String _city,
    String _address,
    String _address2,
    String _zip,
    String _password,
    String _confirmpassword,
  )) async {
    final url = 'http://api.msusportal.com/api/user/set_user_register';
    final data = {
      "First_Name": _firstname.text.toString(),
      "Last_Name": _lastname.text.toString(),
      "Mobile_No": _mobile.toString(),
      "Email": _email.text.toString(),
      "City": _city.text.toString(),
      "Address": _address.text.toString(),
      "Address_2": _address2.text.toString(),
      "Zip_Code": _zip.text.toString(),
      "Password": _password.text.toString(),
      "ConfirmPassword": _confirmpassword.text.toString(),
      "Device_Type": deviceType,
      "Device_Token": deviceInfo().toString(),
    };

    final headers = {
      'content-type': 'application/json',
    };

    print("Please wait....");
    print("Device_Type : $deviceType");
    print(deviceInfo().toString());
    // print(deviceInfo());
    var response = await http.post(url,
        body: data.toString(),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    //      {
    //   "First_Name": _firstname.text.toString(),
    //   "Last_Name": _lastname.text.toString(),
    //   "Mobile_No": _mobile.text.toString(),
    //   "Email": _email.text.toString(),
    //   "City": _city.text.toString(),
    //   "Address": _address.text.toString(),
    //   "Address_2": _address2.text.toString(),
    //   "Zip_Code": _zip.text.toString(),
    //   "Password": _password.text.toString(),
    //   "ConfirmPassword": _confirmpassword.text.toString(),
    //   "Device_Type": "deviceType",
    //   "Device_Token": _deviceData.toString(),
    // },    // }),

    // );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              key: _formkey,
              child: ListView(
                children: [
                  /*Full Name Field*/
                  TextFormField(
                    //ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty)
                        error = "*required Field";
                      else
                        return null;
                    },
                    controller: _firstname,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(gap),
                        labelText: "First Name",
                        errorText: error,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        )),
                  ),
                  SizedBox(
                    height: gap,
                  ),
                  TextFormField(
                    //ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty)
                        error = "*required Field";
                      else
                        return null;
                    },
                    controller: _lastname,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(gap),
                        labelText: "Last Name",
                        errorText: error,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        )),
                  ),
                  SizedBox(
                    height: gap,
                  ),
                  TextFormField(
                    //ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty)
                        error = "*required Field";
                      else
                        return null;
                    },
                    controller: _mobile,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(gap),
                        labelText: "Mobile",
                        errorText: error,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        )),
                  ),
                  SizedBox(
                    height: gap,
                  ),
                  TextFormField(
                    //ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty)
                        error = "*required Field";
                      else
                        return null;
                    },
                    controller: _email,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(gap),
                        labelText: "Email",
                        errorText: error,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        )),
                  ),
                  SizedBox(
                    height: gap,
                  ),
                  TextFormField(
                    //ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty)
                        error = "*required Field";
                      else
                        return null;
                    },
                    controller: _city,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(gap),
                        labelText: "City",
                        errorText: error,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        )),
                  ),
                  SizedBox(
                    height: gap,
                  ),
                  TextFormField(
                    //ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty)
                        error = "*required Field";
                      else
                        return null;
                    },
                    controller: _address,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(gap),
                        labelText: "Address",
                        errorText: error,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        )),
                  ),
                  SizedBox(
                    height: gap,
                  ),
                  TextFormField(
                    //ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty)
                        error = "*required Field";
                      else
                        return null;
                    },
                    controller: _address2,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(gap),
                        labelText: "Address 2",
                        errorText: error,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        )),
                  ),
                  SizedBox(
                    height: gap,
                  ),
                  TextFormField(
                    //ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty)
                        error = "*required Field";
                      else
                        return null;
                    },
                    controller: _zip,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(gap),
                        labelText: "Zip",
                        errorText: error,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        )),
                  ),
                  SizedBox(
                    height: gap,
                  ),
                  TextFormField(
                    //ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty)
                        error = "*required Field";
                      else
                        return null;
                    },
                    controller: _password,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(gap),
                        labelText: "Password",
                        errorText: error,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        )),
                  ),
                  SizedBox(
                    height: gap,
                  ),
                  TextFormField(
                    //ignore: missing_return
                    validator: (String value) {
                      if (value.isEmpty)
                        error = "*required Field";
                      else
                        return null;
                    },
                    controller: _confirmpassword,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(gap),
                        labelText: "Confirm Password",
                        errorText: error,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange),
                        )),
                  ),
                  SizedBox(
                    height: gap,
                  ),
                  RaisedButton(
                    color: Colors.orangeAccent,
                    child: Text("Sign up"),
                    onPressed: () {
                      setState(() {
                        print("Form Validate : " +
                            _formkey.currentState.validate().toString());
                        print(_firstname.text.toString());
                        print(_lastname.text.toString());
                        print(_mobile.text.toString());
                        print(_email.text.toString());
                        print(_city.text.toString());
                        print(_address.text.toString());
                        print(_address2.text.toString());
                        print(_zip.text.toString());
                        print("Passowrd :" + _password.text.toString());
                        print("Confirm Passowrd :" +
                            _confirmpassword.text.toString());
                      });
                      if (_formkey.currentState.validate().toString() != null) {
                        postdata((_firstname,
                                _lastname,
                                _mobile,
                                _email,
                                _city,
                                _address,
                                _address2,
                                _zip,
                                _password,
                                _confirmpassword) =>
                            null);
                      }
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
