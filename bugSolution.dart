```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class Result<T> {
  final T? data;
  final Exception? error;

  Result(this.data, this.error);
}

Future<Result<Map<String, dynamic>>> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Result(jsonData, null);
    } else {
      return Result(null, Exception('Request failed with status: ${response.statusCode}.'));
    }
  } catch (e) {
    return Result(null, e);
  }
}

void main() async {
  final result = await fetchData();
  if (result.error != null) {
    print('Error: ${result.error}');
  } else {
    print('Data: ${result.data}');
  }
}
```