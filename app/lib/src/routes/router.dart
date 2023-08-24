import 'package:app/src/modules/access/views/login/login-page.dart';
import 'package:app/src/modules/home/views/home-page.dart';
import 'package:app/src/routes/app-routes.dart';
import 'package:flutter/cupertino.dart';

class Router {

  static dynamic getArgumentPropValue(
      Map<String, dynamic> arguments, String prop, dynamic defaultValue) {
    return arguments[prop] ?? defaultValue;
  }

  static Future<void> logRoute(RouteSettings routeSettings) async {
    //todo se quiser logar algum tipo de evento para saber as rotas que o usuário está passando. Faz aqui;
  }

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final Map<String, dynamic>? arguments = routeSettings.arguments as Map<String, dynamic>?;
    logRoute(routeSettings);

    switch (routeSettings.name) {

      case AppRoutes.login:
        return slideUpPageRoute(LoginPage(), AppRoutes.login);

      case AppRoutes.home:
        return slideUpPageRoute(HomePage(), AppRoutes.home);
      // case AppRoutes.self_service_reason_demand_page:
      //   return slideUpPageRoute(
      //       SelfServiceReasonDemandPage(
      //           pageIndex: arguments!['pageIndex'],
      //           serviceType: arguments['serviceType']),
      //       AppRoutes.self_service_reason_demand_page);

      //
      // case AppRoutes.doc_authorizations_page:
      //   return slideUpPageRoute(
      //       DocAuthorizationsPage(), AppRoutes.doc_authorizations_page);


      default:
        return CupertinoPageRoute<dynamic>(
          builder: (_) => HomePage(),
        );
    }
  }

  static CupertinoPageRoute<dynamic> slideUpPageRoute(
      Widget page, String pageName) {
    return CupertinoPageRoute<dynamic>(
      builder: (_) => page,
      title: pageName,
      settings: RouteSettings(name: pageName),
    );
  }
}
