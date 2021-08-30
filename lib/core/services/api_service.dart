import 'dart:async';
import 'dart:convert';

import 'package:ewallet_clover/core/functions/encrypt_and_decrypt.dart';
import 'package:ewallet_clover/core/functions/http_handler.dart';

class APIService {
  String _url = 'https://thesisemoney.000webhostapp.com/dev';

  Future<ResponseModel> signIn({String mobile, mpin}) async {
    return await requestHandler(
      url: '$_url/signIn',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'mobile': encrypt(mobile),
        'mpin': encrypt(mpin),
      }),
    );
  }

  Future<ResponseModel> getBalance({String mobile, mpin}) async {
    return await requestHandler(
      url: '$_url/getBalance',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'mobile': encrypt(mobile),
      }),
    );
  }

  Future<ResponseModel> inquireMobileNumber({String mobileNumber}) async {
    return await requestHandler(
      url: '$_url/inquireMobile',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "mobile": encrypt(mobileNumber),
      }),
    );
  }

  Future<ResponseModel> validateMobileNumber({String mobileNumber}) async {
    return await requestHandler(
      url: '$_url/validateAccount',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "mobile": encrypt(mobileNumber),
      }),
    );
  }

  Future<ResponseModel> requestOTP({String mobileNumber}) async {
    return await requestHandler(
      url: '$_url/requestOTP',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "contactNumber": mobileNumber,
      }),
    );
  }

  Future<ResponseModel> validateOTP({String mobileNumber, otp}) async {
    return await requestHandler(
      url: '$_url/validateOTP',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "contactNumber": mobileNumber,
        "otp": otp,
      }),
    );
  }

  Future<ResponseModel> registration({String birthDate, email, mobile, mpin, firstName, middleName, lastName, gender, maritalStatus, deviceModel, deviceID, fullAddress}) async {
    return await requestHandler(
      url: '$_url/registration',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "mobile": encrypt(mobile),
        "mpin": encrypt(mpin),
        "emailAdd": encrypt(email),
        "firstname": encrypt(firstName),
        if (middleName != '') "middleInitial": encrypt(middleName),
        "lastname": encrypt(lastName),
        "dateOfBirth": encrypt(birthDate),
        "gender": encrypt(gender),
        "maritalStatus": encrypt(maritalStatus),
        "fullAddress": encrypt(fullAddress),
        "model": encrypt(deviceModel),
        "imei": encrypt(deviceID),
      }),
    );
  }

  Future<ResponseModel> checkEmail({String email}) async {
    return await requestHandler(
      url: '$_url/inquireEmail',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': email,
      }),
    );
  }

  Future<ResponseModel> fundTransfer({String amount, source, target, refID}) async {
    return await requestHandler(
      url: '$_url/FT',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "trnDescription": encrypt("Fund Transfer"),
        "amount": encrypt(amount),
        "sourceMobile": encrypt(source),
        "targetMobile": encrypt(target),
        "mobileRef": encrypt(refID),
      }),
    );
  }

  Future<ResponseModel> getTransactionHistory({String mobile}) async {
    return await requestHandler(
      url: '$_url/transactionHistory',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "mobile": mobile,
      }),
    );
  }

  Future<ResponseModel> getSecurityQuestions() async {
    return await requestHandler(
      url: '$_url/getSecurityQuestions',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      isGet: true,
    );
  }

  Future<ResponseModel> saveAnswers({String accountID, answer1, answer2, answer3}) async {
    return await requestHandler(
      url: '$_url/saveAnswers',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "accountID": accountID,
        "questionID1": "1",
        "answer1": answer1,
        "questionID2": "2",
        "answer2": answer2,
        "questionID3": "3",
        "answer3": answer3,
      }),
    );
  }

  Future<ResponseModel> validateAnswers({String mobileNumber, answer1, answer2, answer3}) async {
    return await requestHandler(
      url: '$_url/validateAnswers',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "mobile": mobileNumber,
        "questionID1": "1",
        "answer1": answer1,
        "questionID2": "2",
        "answer2": answer2,
        "questionID3": "3",
        "answer3": answer3,
      }),
    );
  }

  Future<ResponseModel> resetMPIN({String mobile, mpin, token}) async {
    return await requestHandler(
      url: '$_url/changeMPIN',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "mobile": mobile,
        "mpin": mpin,
        "token": token,
      }),
    );
  }
}
