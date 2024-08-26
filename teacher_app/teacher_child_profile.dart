// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_childhood/model/teacher_app_model/teacher_home_model.dart';
import 'package:flutter_childhood/view/screen/teacher_app/food.dart';
import 'package:flutter_childhood/view/screen/teacher_app/note_detail.dart';
import 'package:flutter_childhood/view/screen/teacher_app/bus_teacher.dart';
import 'package:flutter_childhood/view/screen/teacher_app/teacher_saved_report.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import 'create_reports.dart';

class TeacherChildProfile extends StatelessWidget {
  TeacherHomeModel teacherHomeModel;
  TeacherChildProfile({
    Key? key,
    required this.teacherHomeModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.terqaz, width: 8)),
              margin: const EdgeInsets.only(top: 25),
              padding: const EdgeInsets.all(15),
              // height: 200,
              height: screenheight/4,
              child: Row(
                children: [
                  Column(
                    children: [
                      ClipOval(
                          child:teacherHomeModel.child_gender=='female'?   Image.asset(
                        AppImageAsset.girl,
                        width: 90,
                        // height: 90,
                        height: screenheight/10,
                        fit: BoxFit.cover,
                      ):
                           Image.asset(
                        AppImageAsset.boy,
                        width: 90,
                        // height: 90,
                        height: screenheight/10,
                        fit: BoxFit.cover,
                      )
                      ),
                       SizedBox(
                        // height: 5,
                        height:screenheight/166, 
                      ),
                       Text(
                        teacherHomeModel.name,
                        style:const  TextStyle(
                            color: AppColor.primaryColor, fontSize: 15),
                      ),
                       SizedBox(
                        // height: 5,
                        height: screenheight/166,
                      ),
                       Text(
                        '${teacherHomeModel.age} years old',
                        style: const TextStyle(
                          color: AppColor.blue,
                        ),
                      ),
                    ],
                  ),
                   SizedBox(
                    // width: 40,
                    width: screenwidth/10,
                  ),
                   Column(
                    children: [
                      // Text(
                      //   'mother name : Haya',
                      //   style:
                      //       TextStyle(fontSize: 18, color: AppColor.babypurple),
                      // ),
                       SizedBox(
                        // height: 22,
                        height: screenheight/52,
                      ),
                      Text(
                        'Gender : ${teacherHomeModel.child_gender}',
                        style:
                          const  TextStyle(fontSize: 15, color: AppColor.darkpink),
                      ),
                      SizedBox(
                        // height: 22,
                        height: screenheight/30,
                      ),
                      Text(
                        'health status : ${teacherHomeModel.state_health}',
                        style:
                          const  TextStyle(fontSize: 15, color: AppColor.babygreen),
                      ),
                    ],
                  ),
                ],
              )),
           SizedBox(
            // height: 30,
            height: screenheight/30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeacherCreateReport(name: teacherHomeModel.name,id: teacherHomeModel.id,),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  // height: 150,
                  height: screenheight/5,
                  // width: 150,
                  width: screenwidth/3,
                  decoration: BoxDecoration(
                      color: AppColor.fairuz,
                      border: Border.all(color: AppColor.terqaz, width: 5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  child: const Text(
                    textAlign:TextAlign.center,
                    'Create reports',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColor.blue),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeacherReadNotePage(id: teacherHomeModel.id,name: teacherHomeModel.name,),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  // height: 150,
                  height: screenheight/5,
                  // width: 150,
                  width: screenwidth/3,
                  decoration: BoxDecoration(
                      color: AppColor.fairuz,
                      border: Border.all(color: AppColor.terqaz, width: 5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  child: const Text(
                    'Read Notes',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColor.purple),
                  ),
                ),
              ),
            ],
          ),

           SizedBox(
            // height: 10
            height: screenheight/60
            ),
         
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeacherSavedReport(id: teacherHomeModel.id,name: teacherHomeModel.name,gender: teacherHomeModel.child_gender,age: teacherHomeModel.age,),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  // height: 150,
                  height: screenheight/5,
                  // width: 150,
                  width: screenwidth/3,
                  decoration: BoxDecoration(
                      color: AppColor.fairuz,
                      border: Border.all(color: AppColor.terqaz, width: 5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Saved Reports',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColor.green),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Bus_page(id: teacherHomeModel.id,name: teacherHomeModel.name,),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  // height: 150,
                  height: screenheight/5,
                  // width: 150,
                  width: screenwidth/3,
                  decoration: BoxDecoration(
                      color: AppColor.fairuz,
                      border: Border.all(color: AppColor.terqaz, width: 5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  child: const Text(
                    'State',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColor.yellow),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
           InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodPage(
                       id: teacherHomeModel.id,name: teacherHomeModel.name,
                        ),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  // height: 150,
                  height: screenheight/5,
                  // width: 150,
                  width: screenwidth/3,
                  decoration: BoxDecoration(
                      color: AppColor.fairuz,
                      border: Border.all(color: AppColor.terqaz, width: 5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50))),
                  child: const Text(
                    'Meals',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColor.purple),
                  ),
                ),
              ),
         
        ],
      ),
    ));
  }
}
