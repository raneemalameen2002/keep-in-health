import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
class Api {
  static Future<Map<String, dynamic>> login(String email,
      String password) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/user/login'),
      headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      print('Error occurred - Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to login');
    }
  }

  static Future<Map<dynamic, dynamic>> verify(String id, String code) async {
    print('-----------------------'+id);
    print('-----------------------'+code);
    final response = await http.put(
      Uri.parse('http://127.0.0.1:8000/api/user/verify'),
      headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/vnd.api+json',
      },
      body: {
        'id': id,
        'code': code,
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      print('Error occurred - Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to verify');
    }
  }


  static Future<Map<String, dynamic>?> addtocard({
    String? product_id,
    String? quantity,
    String? user_id,
  }) async {
    try {
      final Map<String, dynamic> requestBody = {};
      if (product_id != null) requestBody['product_id'] = product_id;
      if (quantity != null) requestBody['quantity'] = quantity;
      if (user_id != null) requestBody['user_id'] = user_id;

      final addtocardResponse = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/user/cart/add'),
        body: requestBody,
      );

      if (addtocardResponse.statusCode == 200) {
        final responseData = json.decode(addtocardResponse.body);
        return responseData;
      } else {
        // استخدام print لتسجيل رسالة الخطأ
        print('Failed to add to card. Status code: ${addtocardResponse.statusCode}');
        print('Response body: ${addtocardResponse.body}');
        return {'error': 'Failed to add to card'};
      }
    } catch (error) {
      // استخدام print لتسجيل رسالة الخطأ في حالة حدوث أي خطأ
      print('Error: $error');
      return {'error': 'Error occurred while processing the request'};
    }
  }
  static Future<Map<String, dynamic>?> register({
    String? name,
    String? email,
    String? phone_number,
    String? password,
    String? password_confirmation,
    String? pharmacy_name,
    String? pharmacy_address,
    String? pharmacy_license,
  }) async {
    try {
      final String name1 = 'Hamza';
      final String password_confirmation1 = '00000000';
      final String pharmacy_license1 = '870001';


      final Map<String, dynamic> requestBody = {
        'name': name ?? name1,
        'email': email,
        'phone_number': phone_number,
        'password': password,
       'password_confirmation': password_confirmation ?? password_confirmation1,
        'pharmacy_name': pharmacy_name,
        'pharmacy_address': pharmacy_address,
        'pharmacy_license': pharmacy_license ??pharmacy_license1 ,
      };

      final register = await http.post(
        Uri.parse('http://127.0.0.1:8000/api/user/register'),
        headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json',
        },
        body: jsonEncode(requestBody),
      );

      if (register.statusCode == 422) {
        final errorMessage = json.decode(register.body)['message'];
        print('Registration failed. Error: $errorMessage');
        return null;
      } else {
        final responseData = json.decode(register.body);
        // ربما تحتاج إلى معالجة البيانات أو استخدامها بطريقة معينة هنا
        print('Registration successful. Response: $responseData');
        return responseData;
      }
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }
}