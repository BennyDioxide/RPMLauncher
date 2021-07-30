import 'dart:convert';

import 'package:http/http.dart';
import 'package:rpmlauncher/MCLauncher/APIs.dart';

class FabricAPI {
  Future<bool> IsCompatibleVersion(VersionID) async {
    final url =
        Uri.parse("${APis().FabricApi}/versions/intermediary/${VersionID}");
    Response response = await get(url);
    return response.body != "";
  }

  Future<String> GetLoaderVersion(VersionID) async {
    final url = Uri.parse("${APis().FabricApi}/versions/loader/${VersionID}");
    Response response = await get(url);
    Map<String, dynamic> body = jsonDecode(response.body);
    return body[0]["loader"]["version"];
  }
}