import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skincare_demo/utils/app_constants.dart';

class RoutineScreen extends StatefulWidget {
  const RoutineScreen({super.key});

  @override
  State<RoutineScreen> createState() => _RoutineScreenState();
}

class _RoutineScreenState extends State<RoutineScreen> {
  List routineData = [
    {
      "id": 1,
      "title": "Cleanser",
      "subTitle": "Cetaphil Gentle Skin Cleanser",
      "time": "8:00 PM",
    },
    {
      "id": 2,
      "title": "Toner",
      "subTitle": "Thayers Witch Hazel Toner",
      "time": "8:00 PM",
    },
    {
      "id": 3,
      "title": "Moisturizer",
      "subTitle": "Kiehl's Ultra Facial Cream",
      "time": "8:00 PM",
    },
    {
      "id": 4,
      "title": "Sunscreen",
      "subTitle": "Supergoop Unseen Sunscreen SPF 40",
      "time": "8:00 PM",
    },
    {
      "id": 5,
      "title": "Lip Balm",
      "subTitle": "Glossier Birthday Balm Dotcom",
      "time": "8:00 PM",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: routineData.length,
        itemBuilder: (BuildContext context, int index) {
          return listItem(index);
        });
  }

  Widget listItem(int index) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        height: 48,
        width: 48,
        decoration: const BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Image.asset(
          'assets/images/ok_icon.png',
        ),
      ),
      trailing: SizedBox(
        height: 45,
        width: 105,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/camera.png',
              ),
            ),
            Text(
              routineData[index]["time"],
              style: GoogleFonts.epilogue(
                fontWeight: FontWeight.w400,
                color: AppColors.secondaryColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            routineData[index]["title"],
            style: GoogleFonts.epilogue(
              fontWeight: FontWeight.w500,
              color: AppColors.blackColor,
              fontSize: 16,
            ),
          ),
          Text(
            routineData[index]["subTitle"],
            style: GoogleFonts.epilogue(
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );

    // Container(
    // height: 72,
    // color: AppColors.secondaryColor,
    // child: Row(children: [

    // ],),
    // );
  }
}
