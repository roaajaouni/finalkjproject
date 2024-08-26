// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_childhood/blocs/teacher_blocs/note_bloc/read_note_bloc.dart';
// import 'package:flutter_childhood/core/constant/color.dart';
// import 'package:flutter_childhood/core/constant/imageasset.dart';

// class TeacherReadNotePage extends StatelessWidget {
//   // final TeacherReadNoteModel teacherReadNoteModel;
//   final int id;
//   final String name;
//   TeacherReadNotePage({super.key, required this.id, required this.name});
//   TextEditingController content = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           ReadNoteBloc()..add(TeacherReadNoteEvent(childId: id)),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//             centerTitle: true,
//             title: Text(
//               " $name's  note",
//               style: const TextStyle(color: AppColor.fairuz),
//             ),
//             backgroundColor: AppColor.terqaz,
//             leading: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: const Icon(
//                 Icons.arrow_back,
//                 color: AppColor.fairuz,
//               ),
//             )),
//         body: Container(
//           margin: const EdgeInsets.all(15),
//           padding: const EdgeInsets.all(10),
//           child: BlocBuilder<ReadNoteBloc, ReadNoteState>(
//             builder: (context, state) {
//               if (state is TeacherNoAddedNoteState) {
//                 return Container(
//                   color: Colors.white,
//                   padding: const EdgeInsets.all(15),
//                   margin: const EdgeInsets.all(10),
//                   child: Column(
//                     children: [
//                       Image.asset(
//                         AppImageAsset.magic,
//                         height: 200,
//                       ),
//                       const SizedBox(
//                         height: 50,
//                       ),
//                       const Center(
//                         child: Text(
//                           '   Hi !  ',
//                           style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.w500,
//                               color: AppColor.terqaz),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 50,
//                       ),
//                       const Center(
//                         child: Text(
//                           '    No notes added yet ',
//                           style: TextStyle(
//                               fontSize: 30,
//                               fontWeight: FontWeight.w500,
//                               color: AppColor.terqaz),
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 200,
//                       ),
//                     ],
//                   ),
//                 );
//               } else if (state is TeacherReadNoteSuccessState) {
//                 return Column(
//                   children: [
//                     Center(
//                       child: Container(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               color: AppColor.fairuz,
//                               borderRadius: BorderRadius.circular(20)),
//                           padding: const EdgeInsets.only(
//                               top: 20, left: 15, right: 15),
//                            height: 300,
                        
//                           // width: 300,
//                           //width: double.infinity,

//                           child: state.teacherReadNoteModel.notes != null &&
//                                   state.teacherReadNoteModel.notes.isNotEmpty
//                               ? Column(
//                                 children: [
//                                   Flexible(
//                                     child: Text(
//                                       state.teacherReadNoteModel.notes,
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(fontSize: 18),
//                                       // overflow: TextOverflow.ellipsis,
//                                       // maxLines: 3,
//                                          softWrap: true,
//                                     ),
//                                   ),
//                                 ],
//                               )
//                               : const Center(
//                                 child: Text(
//                                     'No notes added yet',
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(fontSize: 23,color: Colors.black87),
//                                   ),
//                               )),
//                     ),
//                     const SizedBox(
//                       height: 50,
//                     ),
//                     ClipOval(
//                         child: Image.asset(
//                       AppImageAsset.magic,
//                       height: 170,
//                       width: 170,
//                     )),
//                   ],
//                 );
//               } else if (state is TeacherReadNoteFailureState) {
//                 return Center(
//                   child: Text(state.errorMessage),
//                 );
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/teacher_blocs/note_bloc/read_note_bloc.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/core/constant/imageasset.dart';

class TeacherReadNotePage extends StatelessWidget {
  final int id;
  final String name;
  TeacherReadNotePage({super.key, required this.id, required this.name});
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ReadNoteBloc()..add(TeacherReadNoteEvent(childId: id)),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            " $name's note",
            style: const TextStyle(color: AppColor.fairuz),
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
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<ReadNoteBloc, ReadNoteState>(
            builder: (context, state) {
              if (state is TeacherNoAddedNoteState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImageAsset.magic,
                        height: 200,
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        '   Hi !  ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: AppColor.terqaz,
                        ),
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        '    No notes added yet ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: AppColor.terqaz,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is TeacherReadNoteSuccessState) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColor.fairuz,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: state.teacherReadNoteModel.notes != null &&
                              state.teacherReadNoteModel.notes.isNotEmpty
                          ? SingleChildScrollView(
                              child: Text(
                                state.teacherReadNoteModel.notes,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                              ),
                            )
                          : const Center(
                              child: Text(
                                ' Hi ! \n  No notes added yet',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(height: 200),
                    ClipOval(
                      child: Image.asset(
                        AppImageAsset.magic,
                        height: 170,
                        width: 170,
                      ),
                    ),
                  ],
                );
              } else if (state is TeacherReadNoteFailureState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
