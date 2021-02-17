// import 'dart:io' show Platform;
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:dio/dio.dart' as dio;
// import 'package:get/get.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:device_info/device_info.dart';

// class RegistrationPage extends StatefulWidget {
//   @override
//   _RegistrationPageState createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//   Map<String, dynamic> _deviceData = <String, dynamic>{};

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   Future<void> initPlatformState() async {
//     Map<String, dynamic> deviceData;

//     try {
//       if (Platform.isAndroid) {
//         deviceData = _readAndroidDeviceInfo(await deviceInfoPlugin.androidInfo);
//       } else if (Platform.isIOS) {
//         deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
//       }
//     } on PlatformException {
//       deviceData = <String, dynamic>{
//         'Error:': 'Failed to get platform version.'
//       };
//     }
//     if (!mounted) return;

//     setState(() {
//       _deviceData = deviceData;
//     });
//   }

//   Map<String, dynamic> _readAndroidDeviceInfo(AndroidDeviceInfo build) {
//     return <String, dynamic>{
//       // 'type': build.model,
//       'token': build.androidId,
//     };
//   }

//   Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
//     return <String, dynamic>{
//       // 'type': data.model,
//       'token': data.identifierForVendor,
//     };
//   }

//   String deviceType = "Mobile_app";

//   dio.Dio _dio = dio.Dio();
//   Future formData(
//     String _firstname,
//     String _lastname,
//     String _mobile,
//     String _email,
//     String _city,
//     String _address,
//     String _address2,
//     String _zip,
//     String _password,
//     String _confirmpassword,
//   ) async {
//     dynamic data = dio.FormData.fromMap({
//       "First_Name": _firstname,
//       "Last_Name": _lastname,
//       "Mobile_No": _mobile,
//       "Email": _email,
//       "City": _city,
//       "Address": _address,
//       "Address_2": _address2,
//       "Zip_Code": _zip,
//       "Password": _password,
//       "ConfirmPassword": _confirmpassword,
//       "Device_Type": deviceType,
//       "Device_Token": _deviceData['token'],
//     });

//     final String pathUrl =
//         'http://api.msusportal.com/api/user/set_user_register';
//     print("Device Type  :" + deviceType);
//     print("Device Token :" + _deviceData['token']);
//     var response = await _dio.post(pathUrl,
//         data: data,
//         options: dio.Options(headers: {
//           'Content-type': 'application/json; charset=UTF-8',
//         }));
//     return response.data;
//   }

//   /*Text controller*/
//   TextEditingController _firstname = TextEditingController();
//   TextEditingController _lastname = TextEditingController();
//   String _mobile;
//   TextEditingController _email = TextEditingController();
//   TextEditingController _city = TextEditingController();
//   TextEditingController _address = TextEditingController();
//   TextEditingController _address2 = TextEditingController();
//   TextEditingController _zip = TextEditingController();
//   TextEditingController _password = TextEditingController();
//   TextEditingController _confirmpassword = TextEditingController();

//   var gender = ['Male', 'Female', 'Others'];
//   // var _gender = 'Gender';
//   var _abhishek = "Bahnschrift-Font-family";

//   bool passwordVisible = true;
//   /*Form key*/
//   final _formkey = GlobalKey<FormState>();

//   var gap = 5.0;
//   bool isSwitched = false;

//   /*Error Message*/
//   String nameError;
//   String mobileError;
//   String emailError;
//   String genderError;
//   String passwordError;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomPadding: false,
//         appBar: AppBar(
//           backgroundColor: Color(0xff504B45),
//           title: Container(
//               margin: EdgeInsets.only(left: 80),
//               child: Text(
//                 "Registration",
//                 style: TextStyle(fontFamily: _abhishek),
//               )),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () => Get.back(),
//           ),
//         ),
//         body: Form(
//           key: _formkey,
//           child: Padding(
//             padding: const EdgeInsets.only(top: 4.0, left: 15.0, right: 15.0),
//             child: Container(
//               height: MediaQuery.of(context).size.height,
//               width: MediaQuery.of(context).size.width,
//               child: ListView(
//                 // scrollDirection: Axis.vertical,
//                 children: [
//                   SizedBox(
//                     height: 10,
//                   ),

//                   /*Full Name Field*/
//                   TextFormField(
//                     // ignore: missing_return
//                     validator: (String value) {
//                       if (value.isEmpty)
//                         nameError = "*required field";
//                       else
//                         return nameError = null;
//                     },
//                     controller: _firstname,
//                     keyboardType: TextInputType.text,
//                     decoration: InputDecoration(
//                         contentPadding: EdgeInsets.all(gap * 2),
//                         labelText: "First Name",
//                         labelStyle: TextStyle(fontFamily: _abhishek),
//                         errorText: nameError,
//                         border: OutlineInputBorder(),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.deepOrange),
//                         )),
//                   ),
//                   SizedBox(
//                     height: 08,
//                   ),
//                   TextFormField(
//                     // ignore: missing_return
//                     validator: (String value) {
//                       if (value.isEmpty)
//                         nameError = "*required field";
//                       else
//                         return nameError = null;
//                     },
//                     controller: _lastname,
//                     keyboardType: TextInputType.text,
//                     decoration: InputDecoration(
//                         contentPadding: EdgeInsets.all(gap * 2),
//                         labelText: "Last Name",
//                         labelStyle: TextStyle(fontFamily: _abhishek),
//                         errorText: nameError,
//                         border: OutlineInputBorder(),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.deepOrange),
//                         )),
//                   ),
//                   SizedBox(
//                     height: 08,
//                   ),

//                   /*Mobile Number Field*/
//                   IntlPhoneField(
//                     showDropdownIcon: false,
//                     decoration: InputDecoration(
//                         contentPadding: EdgeInsets.only(left: gap * 2),
//                         labelText: 'Phone Number',
//                         labelStyle: TextStyle(fontFamily: _abhishek),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(),
//                         )),
//                     initialCountryCode: 'IN',
//                     onChanged: (phone) {
//                       _mobile = phone.number;
//                     },
//                   ),
//                   SizedBox(
//                     height: 08,
//                   ),

//                   /*Email Field*/
//                   TextFormField(
//                     // ignore: missing_return
//                     validator: (String value) {
//                       if (value.isEmpty) emailError = "*required field";
//                     },
//                     controller: _email,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       contentPadding:
//                           EdgeInsets.only(left: gap * 2, bottom: gap),
//                       labelText: "Email",
//                       labelStyle: TextStyle(fontFamily: _abhishek),
//                       errorText: emailError,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 08,
//                   ),
//                   TextFormField(
//                     // ignore: missing_return
//                     validator: (String value) {
//                       if (value.isEmpty)
//                         // ignore: missing_return
//                         emailError = "*required field";
//                     },
//                     controller: _city,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       contentPadding:
//                           EdgeInsets.only(left: gap * 2, bottom: gap),
//                       labelText: "City",
//                       labelStyle: TextStyle(fontFamily: _abhishek),
//                       errorText: emailError,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 08,
//                   ),
//                   TextFormField(
//                     // ignore: missing_return
//                     validator: (String value) {
//                       if (value.isEmpty)
//                         // ignore: missing_return
//                         emailError = "*required field";
//                     },
//                     controller: _address,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       contentPadding:
//                           EdgeInsets.only(left: gap * 2, bottom: gap),
//                       labelText: "Address",
//                       labelStyle: TextStyle(fontFamily: _abhishek),
//                       errorText: emailError,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 08,
//                   ),
//                   TextFormField(
//                     // ignore: missing_return
//                     validator: (String value) {
//                       if (value.isEmpty)
//                         // ignore: missing_return
//                         emailError = "*required field";
//                     },
//                     controller: _address2,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       contentPadding:
//                           EdgeInsets.only(left: gap * 2, bottom: gap),
//                       labelText: "Address2",
//                       labelStyle: TextStyle(fontFamily: _abhishek),
//                       errorText: emailError,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 08,
//                   ),
//                   TextFormField(
//                     // ignore: missing_return
//                     validator: (String value) {
//                       if (value.isEmpty)
//                         // ignore: missing_return
//                         emailError = "*required field";
//                     },
//                     controller: _zip,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       contentPadding:
//                           EdgeInsets.only(left: gap * 2, bottom: gap),
//                       labelText: "ZIP",
//                       labelStyle: TextStyle(fontFamily: _abhishek),
//                       errorText: emailError,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 08,
//                   ),
//                   TextFormField(
//                     // ignore: missing_return
//                     validator: (String value) {
//                       if (value.isEmpty)
//                         // ignore: missing_return
//                         emailError = "*required field";
//                     },
//                     controller: _password,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       contentPadding:
//                           EdgeInsets.only(left: gap * 2, bottom: gap),
//                       labelText: "Password",
//                       labelStyle: TextStyle(fontFamily: _abhishek),
//                       errorText: emailError,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 08,
//                   ),
//                   TextFormField(
//                     // ignore: missing_return
//                     validator: (String value) {
//                       if (value.isEmpty)
//                         // ignore: missing_return
//                         emailError = "*required field";
//                     },
//                     controller: _confirmpassword,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: InputDecoration(
//                       contentPadding:
//                           EdgeInsets.only(left: gap * 2, bottom: gap),
//                       labelText: "Confirm Password",
//                       labelStyle: TextStyle(fontFamily: _abhishek),
//                       errorText: emailError,
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 08,
//                   ),

//                   /*Submit button*/
//                   Material(
//                     color: Colors.deepOrangeAccent,
//                     borderRadius: BorderRadius.circular(30.0),
//                     child: MaterialButton(
//                         minWidth: MediaQuery.of(context).size.width,
//                         padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//                         child: Text("Sign up",
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: _abhishek)),
//                         onPressed: () async {
//                           setState(() {
//                             print("Form Validate : " +
//                                 _formkey.currentState.validate().toString());
//                           });

//                           if (_formkey.currentState.validate() != null) {
//                             await formData(
//                               _firstname.text.toString(),
//                               _lastname.text.toString(),
//                               _mobile,
//                               _email.text.toString(),
//                               _city.text.toString(),
//                               _address.text.toString(),
//                               _address2.text.toString(),
//                               _zip.text.toString(),
//                               _password.text.toString(),
//                               _confirmpassword.text.toString(),
//                             ).then((value) {
//                               print(value);
//                             });
//                           }
//                         }),
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Already have an account? ",
//                         style: TextStyle(fontFamily: _abhishek),
//                       ),
//                       FlatButton(
//                         child: Text(
//                           "Log In",
//                           style: TextStyle(
//                               color: Colors.blue,
//                               fontWeight: FontWeight.bold,
//                               fontFamily: _abhishek,
//                               fontSize: 18.0),
//                         ),
//                         onPressed: () {
//                           // Navigator.push(
//                           //     context,
//                           //     MaterialPageRoute(builder: (context) => UserLogin()
//                           //     )
//                           // );
//                         },
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Center(
//                     child: Text(
//                       "Connect with",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontFamily: _abhishek,
//                           fontSize: 16),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20.0,
//                   ),

//                   /*Sized box for scrolling when keyboard is open*/
//                   SizedBox(
//                     height: 190,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
