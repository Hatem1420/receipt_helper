import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@singleton
class OpenAiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://generativelanguage.googleapis.com/v1beta',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<Map<String, dynamic>> getReceipt({required String imagePath}) async {
    final image = File(imagePath);

    final bytes = await image.readAsBytes();
    final base64Image = base64Encode(bytes);
    try {
      final response = await _dio.post(
        '/models/gemini-3.1-flash-lite:generateContent',
        queryParameters: {'key': dotenv.env['gemini_key']},
        data: {
          "contents": [
            {
              "parts": [
                {"text": receiptPrompt},
                {
                  "inlineData": {"mimeType": "image/jpeg", "data": base64Image},
                },
              ],
            },
          ],
          "generationConfig": {
            "temperature": 0,
            "responseMimeType": "application/json",
          },
        },
      );
      log(response.data.toString());
      final receiptJson =
          jsonDecode(
                response.data['candidates'][0]['content']['parts'][0]['text'],
              )
              as Map<String, dynamic>;
      return receiptJson;
    } on DioException catch (e) {
      log(e.response?.data.toString() ?? '');
      log(e.toString());
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}

const String receiptPrompt =
    """You are an OCR and receipt data extraction engine.

Analyze the receipt image and extract all available information.

The receipt may be in Arabic, English, or both.

Rules:

* Return ONLY valid JSON.
* Do not include markdown.
* Do not include explanations.
* Do not include comments.
* Use null when a value cannot be determined.
* Preserve original item names exactly as written.
* Extract all visible line items.
* Convert numeric values to numbers.
* Convert dates to ISO format (YYYY-MM-DD) when possible.
* Detect currency if present.
* Calculate totals only if explicitly shown on the receipt.
* If a field does not exist, return null.

Return JSON using this schema:

{
"merchant": {
"name": null,
"branch": null,
"tax_number": null,
"phone": null,
"address": null
},
"receipt": {
"receipt_number": null,
"invoice_number": null,
"date": null,
"time": null,
"currency": null,
"payment_method": null
},
"totals": {
"subtotal": null,
"discount": null,
"tax": null,
"service_charge": null,
"total": null
},
"items": [
{
"name": "",
"quantity": null,
"unit_price": null,
"total_price": null
}
],
"metadata": {
"language": null,
"confidence": null
}
}
""";
