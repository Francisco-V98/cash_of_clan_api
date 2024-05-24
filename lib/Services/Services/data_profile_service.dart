import 'package:cash_of_clan_api/Services/models/models.dart';
import 'package:dio/dio.dart';

class DataProfileService {
  var dio = Dio();
  final String baseUrl = 'https://api.clashofclans.com/v1';
  
  Map<String, dynamic> headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImEyNjEyNmUxLTkyNTQtNDJkMi1hYWUwLTY2MDg0MmYyZmJmZSIsImlhdCI6MTcxNjQxMzkyMSwic3ViIjoiZGV2ZWxvcGVyLzY0NTRkY2U2LWVkN2ItZjMzZC0zMzM4LTM2MDVhN2E0N2IxMCIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjM4LjEzNy4xODAuMjMiXSwidHlwZSI6ImNsaWVudCJ9XX0.UYN0FuHgCEfHedpQvOBYDbUyQfsUAwcGayCLeTxtAmYy6UPWkNgBkUbdGPhWXntZL5nI78XkRXRswv6DeEvz0A',
    'Content-Type': 'application/json',
  };

  Future<GetDataPlayerModel> getDataPlayer(String id) async {
    final String url = '$baseUrl/players/%23$id';

    try {
      Response response = await dio.get(
        url,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return GetDataPlayerModel.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load data player: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data player: $e');
    }
  }
}
