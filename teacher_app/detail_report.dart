// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_childhood/core/constant/color.dart';
// import 'package:flutter_childhood/model/mother_app_model/view_report_model.dart';

// class TeacherDetailReportPage extends StatelessWidget {
//   final ViewReportModel viewReportModel;
//   final String age;
//   final String name;
//   final String gender;
//   const TeacherDetailReportPage({super.key, required this.viewReportModel, required this.age, required this.name, required this.gender});

//   @override
//   Widget build(BuildContext context) {
//     double screenheight = MediaQuery.of(context).size.height;
//     double screenwidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//        backgroundColor: Colors.white,
//         appBar: AppBar(
//           centerTitle: true,
//          title: const Text('Report Detail',style: TextStyle(color: AppColor.fairuz),),
//             backgroundColor: AppColor.terqaz,
//             leading: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: const Icon(Icons.arrow_back,color: AppColor.fairuz,),
//             )),

//             body: Container(
//               margin: const EdgeInsets.all(10),
//               padding: const EdgeInsets.all(10),
//               // color: AppColor.fairuz,
//               child: Column(
//                 children: [
//                   Row(
                    
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         children: [
                          
//                           SizedBox(
//                             // height: 6,
//                             height: screenheight/50,
//                           ),
//                            Text(name,
//                             //name  ,                        
//                              style:const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColor.terqaz),
//                           ),
//                           // const SizedBox(
//                           //   height: 6,
//                           // ),
//                           //  Text(" $age years old "),
//                           // const SizedBox(
//                           //   height: 6,
//                           // ),
//                           //  Text("gender : $gender "),
//                         ],
//                       ),
//                        SizedBox(
//                         // width: 10,
//                         width:screenwidth/20 ,
//                       ),
//                        Column(
//                         children: [
//                           SizedBox(
//                             // height: 15,
//                             height: screenheight/50,
//                           ),
//                           // Text(
//                           //   "  Date created :  ${viewReportModel.created}",
//                           //   style:const TextStyle(
//                           //       fontSize: 12,
//                           //       fontWeight: FontWeight.w600,
//                           //       color: Colors.black54),
//                           // ),
//                             Text("age : $age years old",
//                              // " age : $age years old "
//                               ),
//                            SizedBox(
//                             // height: 15,
//                             height: screenheight/50,
//                           ),
//                            Text("gender : $gender",
                           
//                             ),
//                         ],
//                       ),
//                     ],
//                   ),
//                    SizedBox(
//                     // height: 20,
//                     height: screenheight/70,
//                   ),
//                   const Divider(
//                     thickness: 5.0,
//                     color: AppColor.terqaz,
//                   ),
//                    SizedBox(
//                     // height: 20,
//                     height: screenheight/300,
//                   ),
//                   Container(
//                     padding: const EdgeInsets.only(
//                         left: 20, right: 20, top: 30, bottom: 30),
//                     // height: 150,
//                     height: screenheight/5,
//                     width: 400,
//                     //color: AppColor.babypurple,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(children: [
//                          const Text(
//                             "Learning :",
//                             style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.w600,
                               
//                                 color: AppColor.green),
//                           ),
//                         SizedBox(
//                             // height: 20,
//                             height: screenheight/100,
//                           ),
//                           Expanded(
//                             child: Text(viewReportModel.learn,
//                               //viewReportModel.learn,
                              
//                               style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black54),
//                             ),
//                           ),
//                         ]),
//                         Column(children: [
//                          const  Text(
//                             "Attitude :",
//                             style:  TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColor.babyblue),
//                           ),
//                           SizedBox(
//                             // height: 20,
//                             height: screenheight/100,
//                           ),
//                           Text(viewReportModel.attiude,
//                             //viewReportModel.attiude,
//                               style:const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black54)),
//                         ]),
//                       ],
//                     ),
//                   ),
//                    SizedBox(
//                     // height: 30,
//                     height: screenheight/10,
//                   ),
//                   Container(
//                     //color: AppColor.fairuz,
//                     padding: const EdgeInsets.only(
//                         left: 20, right: 20, top: 30, bottom: 30),
//                     // height: 150,
//                     height: screenheight/0.5,
//                     // width: 400,
//                     width: screenheight/0.5,
//                     child:  Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(children: [
//                          const Text(
//                             "Mood :",
//                             style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColor.darkpink),
//                           ),
//                          SizedBox(
//                             // height: 20,
//                             height: screenheight/100,
//                           ),
//                          Flexible(
//                            child: Text(viewReportModel.mood,
//                              //viewReportModel.mood,
//                              maxLines: 3,
                            
//                              // overflow: TextOverflow.ellipsis,
//                                style: const TextStyle(
//                                    fontSize: 18,
//                                    fontWeight: FontWeight.w600,
//                                    color: Colors.black54)),
//                          ),
//                         ]),
//                         Column(children: [
//                         const  Text(
//                             "Activities :",
//                             style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.w600,
//                                 color: AppColor.babyyellow),
//                           ),
//                           SizedBox(
//                             // height: 20,
//                             height: screenheight/100,
//                           ),
//                           Text(viewReportModel.activities,
//                            // viewReportModel.activities,
//                               style:const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.black54)),
              
//                         ]),
                       
//                       ],
//                     ),
//                   ),
//                   // const SizedBox(height: 20,),
//                   //                 SizedBox(height: 130,width: 150,
                                  
//                   //                   child: Image.asset(AppImageAsset.train))
//                 ],
//               )),
            
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/model/mother_app_model/view_report_model.dart';

class TeacherDetailReportPage extends StatelessWidget {
  final ViewReportModel viewReportModel;
  final String age;
  final String name;
  final String gender;

  const TeacherDetailReportPage({
    super.key,
    required this.viewReportModel,
    required this.age,
    required this.name,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Report Detail',
          style: TextStyle(color: AppColor.fairuz),
        ),
        backgroundColor: AppColor.terqaz,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.fairuz,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      Text(
                        name,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColor.terqaz),
                      ),
                    ],
                  ),
                  SizedBox(width: screenwidth / 20),
                  Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      Text("age : $age years old"),
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      Text("gender : $gender"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 70),
              const Divider(
                thickness: 5.0,
                color: AppColor.terqaz,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 300),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            "Learning :",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: AppColor.green),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height / 100),
                          Text(
                            viewReportModel.learn,
                            maxLines: 3,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            "Attitude :",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: AppColor.babyblue),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height / 100),
                          Text(
                            viewReportModel.attiude,
                            maxLines: 3,
                            style: const TextStyle(
                                fontSize: 18,
                                
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            "Mood :",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: AppColor.darkpink),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height / 100),
                          Text(
                            viewReportModel.mood,
                            maxLines: 3,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            "Activities :",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: AppColor.babypink),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height / 100),
                          Text(
                            viewReportModel.activities,
                            maxLines: 3,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
