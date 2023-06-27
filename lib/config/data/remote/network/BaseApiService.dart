abstract class BaseApiService {

  final String baseUrl = "https://dummy.restapiexample.com/";

  Future<dynamic> getResponse(String url);

}