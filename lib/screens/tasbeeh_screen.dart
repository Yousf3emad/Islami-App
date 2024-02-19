import 'package:flutter/material.dart';
import 'package:islamic_app/consts/app_colors.dart';
import 'package:islamic_app/services/assets_manager.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  List<String> tasbeehat = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
  ];
  int tasbeeh_index = 0;
  int counter =0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: SingleChildScrollView(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(height: 320.0),
              PositionedDirectional(
                  end: 130.0,
                  top: 7.0,
                  child: Image.asset(
                    AssetsManager.headOfSebha,
                  )),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(counter< 30-1){
                      counter++;
                    }else{
                      if(tasbeeh_index>=0 && tasbeeh_index<tasbeehat.length-1){
                        tasbeeh_index++;
                        counter = 0;
                      }else{
                        counter = 0;
                        tasbeeh_index=0;
                      }
                    }
                  });
                },
                child: Image.asset(
                  AssetsManager.bodyOfSebha,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50.0,
          ),
          const Text(
            "عدد التسبيحات",
            style: TextStyle(
              fontFamily: "Elmessiri",
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: AppColors.tasbeehCounter,
            ),
            child: Center(
                child: Text("${counter}",
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
            )),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            width: 170.0,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: const Color(0xFFCC7344),
            ),
            child: Center(
              child: Text(
                tasbeehat[tasbeeh_index],
                style: TextStyle(
                  fontFamily: "Elmessiri",
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
                ],
              ),
        ));
  }
}
