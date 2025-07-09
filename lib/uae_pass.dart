import 'package:flutter/services.dart';

import 'uae_pass_platform_interface.dart';

class UaePass {
  Future<void> setUpSandbox() async {
    UaePassPlatform.instance.setUp(
        "sandbox_stage",
        "sandbox_stage",
        false,
        "uaepassdemoappDS",
        "123123213",
        "https://hheo-gateway-stg.politewave-7a937208.uaenorth.azurecontainerapps.io/Identity/api/UaePass/login-mobile",
        "urn:uae:digitalid:profile", "en");
  }

  Future<void> setUpEnvironment(
      String clientId, String clientSecret, String urlScheme, String state,
      {bool isProduction = false,
      String redirectUri = "https://hheo-gateway-stg.politewave-7a937208.uaenorth.azurecontainerapps.io/Identity/api/UaePass/login-mobile",
      String scope = "urn:uae:digitalid:profile",  String language = "en"}) async {
    UaePassPlatform.instance.setUp(clientId, clientSecret, isProduction,
        urlScheme, state, redirectUri, scope, language);
  }

  Future<String> signIn() async {
    try {
      return await UaePassPlatform.instance.signIn();
    } on PlatformException catch (e) {
      throw (e.message ?? "Unknown error");
    } catch (e) {
      throw ("Unknown error");
    }
  }

  Future<String> getAccessToken(String token) async {
    try {
      return await UaePassPlatform.instance.getAuthToken(token);
    } on PlatformException catch (e) {
      throw (e.message ?? "Unknown error");
    } catch (e) {
      throw ("Unknown error");
    }
  }

  Future<void> signOut() async {
    try {
      return await UaePassPlatform.instance.signOut();
    } on PlatformException catch (e) {
      throw (e.message ?? "Unknown error");
    } catch (e) {
      throw ("Unknown error");
    }
  }
}
