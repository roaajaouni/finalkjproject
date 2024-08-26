// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_childhood/blocs/teacher_blocs/note_bloc/read_note_bloc.dart';
// import 'package:flutter_childhood/core/constant/color.dart';
// import 'package:flutter_childhood/core/constant/imageasset.dart';
// import 'package:flutter_childhood/view/screen/teacher_app/note_detail.dart';

// class TeacherReadNote extends StatelessWidget {
//   final int id;
//   final String name;

//   const TeacherReadNote({super.key, required this.id, required this.name});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ReadNoteBloc()..add(TeacherReadNoteEvent(childId: id)),
//       child: Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//               backgroundColor: AppColor.terqaz,
//               leading: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(
//                   Icons.arrow_back,
//                   color: AppColor.fairuz,
//                 ),
//               )),
//           body: BlocBuilder<ReadNoteBloc, ReadNoteState>(
//             builder: (context, state) {
//               if (state is TeacherReadNoteSuccessState) {
//                 return Container(
//                   color: Colors.white,
//                   padding: const EdgeInsets.all(10),
//                   margin: const EdgeInsets.all(10),
//                   child: Column(
//                     children: [
//                       // Text('nam',

//                       //   //" $name 's reports",
//                       //   style: const TextStyle(
//                       //     fontSize: 25,
//                       //     fontWeight: FontWeight.w500,
//                       //     color: AppColor.terqaz,
//                       //   ),
//                       // ),
//                       const SizedBox(
//                         height: 10,
//                       ),

//                       Container(
//                         color: Colors.white,
//                         margin: const EdgeInsets.all(2),
//                         height: 300,
//                         padding: const EdgeInsets.all(18),
//                         child: ListView.builder(
//                           itemCount: state.teacherReadNoteModel,
//                           // state.reportMyKids.length,
//                           itemBuilder: (context, index) {
//                             return Card(
//                               color: Colors.white,
//                               margin: const EdgeInsets.only(
//                                 top: 10,
//                               ),
//                               shape: const RoundedRectangleBorder(
//                                   // borderRadius: BorderRadius.circular(150),
//                                   // side: BorderSide(color: AppColor.terqaz)
//                                   ),
//                               child: ListTile(
//                                 // onTap: () {
//                                 //   Navigator.push(context, MaterialPageRoute(builder: (context)=> ReportDetail(viewReportModel:state.reportMyKids[index] ,name: name,age: age,gender: gender,)));
//                                 // },

//                                 // ! put reportname here
//                                 title: Text(name
//                                     //' ${state.reportMyKids[index].created}'
//                                     ),
//                                 trailing: InkWell(
//                                     onTap: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   TeacherReadNotePage(teacherReadNoteModel:state.teacherReadNoteModel[index] ,)));
//                                     },
//                                     child: Container(
//                                       padding: const EdgeInsets.only(top: 4),
//                                       decoration: BoxDecoration(
//                                         borderRadius:
//                                             BorderRadius.circular(100),
//                                         color: AppColor.terqaz,
//                                       ),
//                                       height: 30,
//                                       width: 70,
//                                       child: const Text(
//                                         'view',
//                                         style: TextStyle(
//                                             color: AppColor.fairuz,
//                                             fontSize: 15),
//                                         textAlign: TextAlign.center,
//                                       ),
//                                     )),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),

//                       ClipOval(
//                           child: Image.asset(
//                         AppImageAsset.hand,
//                         height: 150,
//                         width: 150,
//                       )),
//                     ],
//                   ),
//                 );
//               } else if (state is TeacherReadNoteFailureState) {
//                 return Center(
//                   child: Text(state.errorMessage),
//                 );
//               } else {
//                 return const Center(child: CircularProgressIndicator());
//               }
//             },
//           )),
//     );
//   }
// }
