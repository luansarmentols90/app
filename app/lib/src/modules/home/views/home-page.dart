import 'package:app/src/modules/home/controllers/home-controller.dart';
import 'package:app/src/modules/shared/metrics/app-metrics.dart';
import 'package:app/src/modules/shared/styles/colors/app_colors.dart';
import 'package:app/src/modules/shared/styles/texts/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(top: AppMetrics.spacing),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(AppMetrics.spacing),
                          child: const Text("Uma curiosidade sobre chuck norris:" , style: AppTextStyles.h1Bold),
                        ),
                        Observer(builder: (_){
                          return this.homeController.isLoading
                          ? const CircularProgressIndicator(
                            color: AppColors.black,
                          )
                          : Container(
                              margin: const EdgeInsets.all(AppMetrics.spacing),
                              child: Text(this.homeController.answer, style: AppTextStyles.h1.copyWith(color: AppColors.blue)),
                            );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: AppMetrics.spacing),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () async => await this.homeController.getAnswer(),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text("Buscar resposta", style: AppTextStyles.h1Bold.copyWith(color: AppColors.white)),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
