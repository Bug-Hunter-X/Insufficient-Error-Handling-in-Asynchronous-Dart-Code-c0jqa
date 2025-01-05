```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success, process the JSON response
      final jsonData = jsonDecode(response.body);
      // Access data, e.g., jsonData['key']
    } else {
      // Handle error, e.g., throw Exception('Failed to fetch data');
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    // Handle exceptions (network issues, JSON decoding errors)
    print('Error fetching data: $e');
    rethrow; // Re-throw to allow higher-level handling
  }
}
```