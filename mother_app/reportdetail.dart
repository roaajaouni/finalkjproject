// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_childhood/model/mother_app_model/view_report_model.dart';

// import '../../../core/constant/color.dart';

// class ReportDetail extends StatelessWidget {
//   final ViewReportModel viewReportModel;
//     // final HomeMotherModel homeMotherModel;
// final String name;
// final String age;
// final String gender;
//   const ReportDetail({super.key, required this.viewReportModel, required this.name, required this.age, required this.gender, });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text('Report Detail',style: TextStyle(color: AppColor.fairuz),),
//             backgroundColor: AppColor.terqaz,
//             leading: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: const Icon(Icons.arrow_back,color: AppColor.fairuz,),
//             )),
//         body: Container(
//             margin: const EdgeInsets.all(10),
//             padding: const EdgeInsets.all(10),
//             // color: AppColor.fairuz,
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Column(
//                       children: [
//                         // SizedBox(
//                         //   height: 70,
//                         //   width: 70,
//                         //   child: ClipOval(
//                         //       child:  Image.asset(AppImageAsset.girl) 
                              
//                         //       ),
//                         // ),
//                         const SizedBox(
//                           height: 6,
//                         ),
//                          Text(name  ,                        
//                            style:const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: AppColor.terqaz),
//                         ),
//                         // const SizedBox(
//                         //   height: 6,
//                         // ),
//                         //  Text(" $age years old "),
//                         // const SizedBox(
//                         //   height: 6,
//                         // ),
//                         //  Text("gender : $gender "),
//                       ],
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                      Column(
//                       children: [
//                        const SizedBox(
//                           height: 15,
//                         ),
//                         // Text(
//                         //   "  Date created :  ${viewReportModel.created}",
//                         //   style:const TextStyle(
//                         //       fontSize: 12,
//                         //       fontWeight: FontWeight.w600,
//                         //       color: Colors.black54),
//                         // ),
//                           Text(" age : $age years old "),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                          Text("gender : $gender "),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Divider(
//                   thickness: 5.0,
//                   color: AppColor.terqaz,
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.only(
//                       left: 20, right: 20, top: 30, bottom: 30),
//                   height: 150,
//                   width: 400,
//                   //color: AppColor.babypurple,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(children: [
//                        const Text(
//                           "Learning :",
//                           style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600,
//                               color: AppColor.green),
//                         ),
//                       const  SizedBox(
//                           height: 20,
//                         ),
//                         Text(viewReportModel.learn,
//                           softWrap: true,
//                           style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black54),
//                         ),
//                       ]),
//                       Column(children: [
//                        const  Text(
//                           "Attitude :",
//                           style:  TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600,
//                               color: AppColor.babyblue),
//                         ),
//                        const SizedBox(
//                           height: 20,
//                         ),
//                         Text(viewReportModel.attiude,
//                         softWrap: true,
//                             style:const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black54)),
//                       ]),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Container(
//                   //color: AppColor.fairuz,
//                   padding: const EdgeInsets.only(
//                       left: 20, right: 20, top: 30, bottom: 30),
//                   height: 150,
//                   width: 400,
//                   child:  Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(children: [
//                        const Text(
//                           "Mood :",
//                           style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600,
//                               color: AppColor.darkpink),
//                         ),
//                       const  SizedBox(
//                           height: 20,
//                         ),
//                         Column(
//                           children: [
//                             Text(viewReportModel.mood,
//                             softWrap: true,
//                                 style: const TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.black54)),
//                           ],
//                         ),
//                       ]),
//                       Column(children: [
//                       const  Text(
//                           "Activities :",
//                           style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600,
//                               color: AppColor.babyyellow),
//                         ),
//                       const  SizedBox(
//                           height: 20,
//                         ),
//                         Text(viewReportModel.activities,
//                         softWrap: true,
//                             style:const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.black54)),

//                       ]),
                     
//                     ],
//                   ),
//                 ),
//                 // const SizedBox(height: 20,),
//                 //                 SizedBox(height: 130,width: 150,
                                
//                 //                   child: Image.asset(AppImageAsset.train))
//               ],
//             ))
//             );
//   }
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_childhood/model/mother_app_model/view_report_model.dart';

import '../../../core/constant/color.dart';

class ReportDetail extends StatelessWidget {
  final ViewReportModel viewReportModel;
  final String name;
  final String age;
  final String gender;

  const ReportDetail({
    super.key,
    required this.viewReportModel,
    required this.name,
    required this.age,
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
                          color: AppColor.terqaz,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: screenwidth / 20),
                  Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      Text("Age: $age years old"),
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      Text("Gender: $gender"),
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
                            "Learning:",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: AppColor.green,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height / 100),
                          Text(
                            viewReportModel.learn,
                            maxLines: 3,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            "Attitude:",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: AppColor.babyblue,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height / 100),
                          Text(
                            viewReportModel.attiude,
                            maxLines: 3,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
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
                            "Mood:",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: AppColor.darkpink,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height / 100),
                          Text(
                            viewReportModel.mood,
                            maxLines: 3,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            "Activities:",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: AppColor.babyyellow,
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height / 100),
                          Text(
                            viewReportModel.activities,
                            maxLines: 3,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
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
