import 'package:flutter/material.dart';
import 'package:islamic_app/consts/app_colors.dart';
import 'package:islamic_app/providers/ahadeth_provider.dart';
import 'package:islamic_app/screens/inner_screens/hadess_content.dart';
import 'package:islamic_app/services/assets_manager.dart';
import 'package:islamic_app/widgets/default_text.dart';
import 'package:provider/provider.dart';

class AhadessScreen extends StatelessWidget {
  const AhadessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<AhadethProvider>(
      create: (context) => AhadethProvider(),
      builder: (context, child) {
        AhadethProvider ahadethProvider = Provider.of<AhadethProvider>(context);
        if (ahadethProvider.ahadethList.isEmpty) {
          ahadethProvider.readHadethContent();
        }
        return Column(
          children: [
            Image.asset(
              AssetsManager.basmala,
              height: size.height * .3,
            ),
            const Divider(
              color: AppColors.primaryColor,
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: DefaultText(
                txt: "الاحاديث",color: AppColors.primaryColor
              ),
            ),
            const Divider(
              color: AppColors.primaryColor,
              thickness: 2,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Flexible(
              child: SizedBox(
                width: size.width * 0.8,
                child: ListView.separated(
                  itemCount: ahadethProvider.ahadethList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, HadessContent.routeName,
                          arguments: ahadethProvider.ahadethList[index]);
                    },
                    child: Container(
                      height: 50.0,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                            color: AppColors.primaryColor, width: 2.0),
                        color: Colors.transparent,
                      ),
                      child: Center(
                        child: DefaultText(
                          txt: "الحديث رقم (${index+1})",
                              //"${ahadethProvider.ahadethList[index].title}(${index + 1})",
                          txtDirection: TextDirection.rtl,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
          ],
        );
      },
    );
  }
}
