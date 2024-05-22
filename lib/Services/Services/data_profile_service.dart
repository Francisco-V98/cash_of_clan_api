import 'package:cash_of_clan_api/Services/models/models.dart';
import 'package:dio/dio.dart';

class DataProfileService {
  var dio = Dio();
  final String baseUrl = 'https://api.clashofclans.com/v1/';
  
  Map<String, dynamic> headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImNjMzI1NTEzLWI2NTUtNGU0OS1iOWRlLWNkN2RlMTU3ODA2YyIsImlhdCI6MTcxNjMwMzkzNywic3ViIjoiZGV2ZWxvcGVyLzY0NTRkY2U2LWVkN2ItZjMzZC0zMzM4LTM2MDVhN2E0N2IxMCIsInNjb3BlcyI6WyJjbGFzaCJdLCJsaW1pdHMiOlt7InRpZXIiOiJkZXZlbG9wZXIvc2lsdmVyIiwidHlwZSI6InRocm90dGxpbmcifSx7ImNpZHJzIjpbIjM4LjEzNy4xODAuMSJdLCJ0eXBlIjoiY2xpZW50In1dfQ.5v8zJ80sQXHD6OM8uaw_d6JEXYRM6H58RlGo1iJDO2nik0fYwV9zv7Nz0DUJC3yNqXoML2sczVKbfTYViuIP5A',
    'Content-Type': 'application/json',
  };

  Future<GetDataPlayerModel> getDataPlayer(String id) async {
    final String url = '$baseUrl/players/%2392PRJC900';

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
