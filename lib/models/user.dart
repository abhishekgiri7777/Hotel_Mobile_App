import 'dart:convert';

Registration registrationFromJson(String str) =>
    Registration.fromJson(json.decode(str));

String registrationToJson(Registration data) => json.encode(data.toJson());

class Registration {
  Registration({
    this.firstName,
    this.lastName,
    this.mobileNo,
    this.email,
    this.city,
    this.address,
    this.address2,
    this.zipCode,
    this.password,
    this.confirmPassword,
    this.deviceType,
    this.deviceToken,
    this.deviceSecret,
    this.ipAddress,
  });

  String firstName;
  String lastName;
  String mobileNo;
  String email;
  String city;
  String address;
  String address2;
  String zipCode;
  String password;
  String confirmPassword;
  String deviceType;
  String deviceToken;
  String deviceSecret;
  String ipAddress;

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        firstName: json["First_Name"],
        lastName: json["Last_Name"],
        mobileNo: json["Mobile_No"],
        email: json["Email"],
        city: json["City"],
        address: json["Address"],
        address2: json["Address_2"],
        zipCode: json["Zip_Code"],
        password: json["Password"],
        confirmPassword: json["ConfirmPassword"],
        deviceType: json["Device_Type"],
        deviceToken: json["Device_Token"],
        deviceSecret: json["Device_Secret"],
        ipAddress: json["IP_Address"],
      );

  Map<String, dynamic> toJson() => {
        "First_Name": firstName,
        "Last_Name": lastName,
        "Mobile_No": mobileNo,
        "Email": email,
        "City": city,
        "Address": address,
        "Address_2": address2,
        "Zip_Code": zipCode,
        "Password": password,
        "ConfirmPassword": confirmPassword,
        "Device_Type": deviceType,
        "Device_Token": deviceToken,
        "Device_Secret": deviceSecret,
        "IP_Address": ipAddress,
      };
}
