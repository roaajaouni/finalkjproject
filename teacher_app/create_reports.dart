import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/teacher_blocs/create_reeport_bloc/create_report_bloc.dart';
import 'package:flutter_childhood/model/teacher_app_model/create_report_model.dart';

import '../../../core/constant/color.dart';
import '../../widget/customcontainertextfield.dart';
import '../../widget/login/custombutton.dart';

// class TeacherCreateReport extends StatelessWidget {
//   final String name;
//   final int id;
//   TeacherCreateReport({super.key, required this.name, required this.id});
//   TextEditingController learning = TextEditingController();
//   // TextEditingController childReport = TextEditingController();
//   // TextEditingController date = TextEditingController();
//   TextEditingController mood = TextEditingController();
//   TextEditingController activities = TextEditingController();
//   TextEditingController attitude = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     double screenheight = MediaQuery.of(context).size.height;
//     double screenwidth = MediaQuery.of(context).size.width;
//     return SafeArea(
//       child: BlocListener<CreateReportBloc, CreateReportState>(
//         listener: (context, state) {
//     if(state is TeacherCreateReportSuccessState){
//       Navigator.pop(context);
//     }
//     else if (state is TeacherCreateReportFailureState){
//            ScaffoldMessenger.of(context)
//                 .showSnackBar(const SnackBar(content: Text("Create successfully")));
//     }
//         },
//         child: Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               centerTitle: true,
//               title:  Text(
//                     " $name 's report",
//                     style: const TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.w500,
//                       color: AppColor.fairuz,
//                     ),
//                   ),
//                 backgroundColor: AppColor.terqaz,
//                 leading: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(
//                     Icons.arrow_back,
//                     color: AppColor.fairuz,
//                   ),
//                 )),
//             body: Container(
//               margin: const EdgeInsets.all(10),
//               child: ListView(children: [
//                 SizedBox(
//                 // height: 50,
//                 height: screenheight/20,
//                 ),
//                 // Column(
//                 //   children: [
//                 //     Padding(
//                 //       padding: const EdgeInsets.all(8.0),
//                 //       child: TextField(
//                 //         controller: childReport,
//                 //         style: const TextStyle(
//                 //             fontSize: 25, color: AppColor.darkpink),
//                 //         decoration: const InputDecoration(
//                 //             border: InputBorder.none,
//                 //             hintText: 'Roaa \'s Report'),
//                 //       ),
//                 //     ),
//                 //     Padding(
//                 //       padding: const EdgeInsets.all(8.0),
//                 //       child: TextField(
//                 //         controller: date,
//                 //         decoration: const InputDecoration(
//                 //           hintText: 'Sunday, April 7 ,2024 .',
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
                
    
//                 Row(children: [
//                   Expanded(
//                     child: CustomContainerTextField(
//                       hinttext: 'click here',
//                       mycontroller: learning,
//                       text: 'Learning',
//                       mystyle: const TextStyle(
//                           fontSize: 25, color: AppColor.babygreen),
//                     ),
//                   ),
//                    SizedBox(
//                     // width: 10,
//                     width: screenwidth/600,
//                   ),
//                   CustomContainerTextField(
//                     hinttext: 'click here',
//                     mycontroller: attitude,
//                     text: 'Attitude',
//                     mystyle: const TextStyle(
//                         fontSize: 25, color: AppColor.babyblue),
//                   )
//                 ]),
    
//                 SizedBox(
//                   // height: 10,
//                   height: screenheight/100,
//                 ),
//                 //////////
//                 Row(children: [
//                   CustomContainerTextField(
//                     hinttext: 'click here',
//                     mycontroller: mood,
//                     text: 'Mood',
//                     mystyle: const TextStyle(
//                         fontSize: 25, color: AppColor.darkpink),
//                   ),
//                   SizedBox(
//                     // width: 10,
//                     width: screenwidth/90,
//                   ),
//                   Expanded(
//                     child: CustomContainerTextField(
//                       hinttext: 'click here',
//                       mycontroller: activities,
//                       text: 'Activities',
//                       mystyle: const TextStyle(
//                           fontSize: 25, color: AppColor.babyyellow),
//                     ),
//                   ),
//                 ]),
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 Custombutton(
//                   text: 'Create',
//                   onPressed: () {
//                     context.read<CreateReportBloc>().add(
//                         TeacherCreateReportEvent(
//                             childId: id,
//                             teacherCreateReportModel:
//                                 TeacherCreateReportModel(
//                                     learn: learning.text,
//                                     attiude: attitude.text,
//                                     mood: mood.text,
//                                     activities: activities.text)));
//                   },
//                 )
//               ]),
//             )),
//       ),
//     );
//   }
// }




class TeacherCreateReport extends StatelessWidget {
  final String name;
  final int id;
  TeacherCreateReport({super.key, required this.name, required this.id});
  TextEditingController learning = TextEditingController();
  TextEditingController mood = TextEditingController();
  TextEditingController attitude = TextEditingController();

  // List of activities for the dropdown
  final List<String> activitiesList = ['music', 'drawing and coloring','reading stories' ];
  String? selectedActivity;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: BlocListener<CreateReportBloc, CreateReportState>(
        listener: (context, state) {
          if (state is TeacherCreateReportSuccessState) {
            Navigator.pop(context);
          } else if (state is TeacherCreateReportFailureState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Create successfully")));
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              " $name 's report",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: AppColor.fairuz,
              ),
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
          body: Container(
            margin: const EdgeInsets.all(10),
            child: ListView(
              children: [
                SizedBox(
                  height: screenheight / 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomContainerTextField(
                        hinttext: 'click here',
                        mycontroller: learning,
                        text: 'Learning',
                        mystyle: const TextStyle(
                            fontSize: 25, color: AppColor.babygreen),
                      ),
                    ),
                    SizedBox(
                      width: screenwidth / 600,
                    ),
                    CustomContainerTextField(
                      hinttext: 'click here',
                      mycontroller: attitude,
                      text: 'Attitude',
                      mystyle: const TextStyle(
                          fontSize: 25, color: AppColor.babyblue),
                    )
                  ],
                ),
                SizedBox(
                  height: screenheight / 100,
                ),
                Row(
                    children: [
                      Expanded(
                        child: CustomContainerTextField(
                          hinttext: 'click here',
                          mycontroller: mood,
                          text: 'Mood',
                          mystyle: const TextStyle(
                              fontSize: 25, color: AppColor.darkpink),
                        ),
                      ),
                      SizedBox(
                        width: screenwidth / 200,
                      ),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Activities',
                            labelStyle: const TextStyle(
                              fontSize: 25,
                              color: AppColor.babypink,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 8,
                            ),
                          ),
                          value: selectedActivity,
                          items: activitiesList.map((String activity) {
                            return DropdownMenuItem<String>(
                              value: activity,
                              child: Text(activity,
                                style: const TextStyle(
    fontSize: 10, // Adjust the font size if needed
  ),
                              ),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            selectedActivity = newValue!;
                          },
                        ),
                      ),
                    ],
                  ),
                
                const SizedBox(
                  height: 40,
                ),
                Custombutton(
                  text: 'Create',
                  onPressed: () {
                    context.read<CreateReportBloc>().add(
                      TeacherCreateReportEvent(
                        childId: id,
                        teacherCreateReportModel: TeacherCreateReportModel(
                          learn: learning.text,
                          attiude: attitude.text,
                          mood: mood.text,
                          activities: selectedActivity.toString(), // Save selected activity
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
