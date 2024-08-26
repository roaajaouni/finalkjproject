import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/mother_create_notebloc/create_note_bloc.dart';
import 'package:flutter_childhood/model/mother_app_model/create_note_model.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

import '../../widget/login/custombutton.dart';

class CreateNotesPage extends StatelessWidget {
  final int id;
  final String childname;
  CreateNotesPage({super.key, required this.id, required this.childname});
  TextEditingController name = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
     double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: BlocProvider(
      create: (context) => CreateNoteBloc(),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: BlocListener<CreateNoteBloc, CreateNoteState>(
          listener: (context, state) {
            if (state is MotherCreateNoteSuccessState) {
              Navigator.pop(context);
            } else if (state is MotherCreateNoteFailureState) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          child: SafeArea(
            child: ListView(
              children: [
                Stack(children: [
                  Container(
                    
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(58),
                        color: AppColor.terqaz,
                      ),
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(10),
                      // height: 150,
                      height: screenheight/4,
                      // width: 450,
                      width: screenwidth/1,
                      child: const Text(
                        'You can send  notes and anything about your child . \n  \n We are interested in that .',
                        style: TextStyle(fontSize: 18, color: AppColor.fairuz),
                      )),
                  Positioned(
                      bottom: 20,
                      right: 20,
                      child: Image.asset(
                        AppImageAsset.bee,
                        // height: 90,
                        height: screenheight/10,
                        // width: 90,
                        width: screenwidth/6,
                      ))
                ]),
                SizedBox(
                  // height: 30,
                  height: screenheight/30,
                ),
                Column(
                  children: [
                    // const Text(
                    //   'Name :',
                    //   textAlign: TextAlign.start,
                    //   style: TextStyle(fontSize: 18),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Center(
                    //   child: Container(
                    //       decoration: BoxDecoration(
                    //           color: AppColor.fairuz,
                    //           borderRadius: BorderRadius.circular(20)),
                    //       padding: const EdgeInsets.only(
                    //           top: 20, left: 15, right: 15),
                    //       height: 80,
                    //       width: 300,
                    //       child: TextField(
                    //         controller: name,
                    //         decoration: const InputDecoration(
                    //             hintText: 'click here ',
                    //             border: InputBorder.none,
                    //             hintStyle: TextStyle(
                    //                 color: Color.fromARGB(255, 233, 230, 230))),
                    //       )),
                    // ),
                    SizedBox(
                      // height: 10,
                      height: screenheight/40,
                    ),
                    const Text(
                      'Write a note :',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      // height: 15,
                      height: screenheight/30,
                    ),
                    Center(
                      child: Container(
                          decoration: BoxDecoration(
                              color: AppColor.fairuz,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.only(
                              top: 20, left: 15, right: 15),
                          // height: 200,
                          // width: 300,
                          height: screenheight/4.8,
                          width: screenwidth/1.3,
                          child: TextField(
                            controller: content,
                            maxLines:8,
                            decoration: const InputDecoration(
                              hintText: 'click here ',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 233, 230, 230)),
                            ),
                          )),
                    ),
                    SizedBox(
                      // height: 70,
                      height: screenheight/15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<CreateNoteBloc, CreateNoteState>(
                          builder: (context, state) {
                            if (state is CreateNoteInitial) {
                              return MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: AppColor.terqaz,
                                textColor: AppColor.fairuz,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 50),
                                // text: 'submit',
                                child: const Text('Submit'),
                                onPressed: () {
                                  //! put the method
                                  context.read<CreateNoteBloc>().add(
                                      MotherCreateNoteEvent(
                                          childId: id,
                                          motherCreateNoteModel:
                                              MotherCreateNoteModel(
                                                  name: childname,
                                                  notes: content.text)));
                                },
                              );
                            } else if (state is MotherCreateNoteLoadingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Custombutton(
                                text: 'submit',
                                onPressed: () {
                                  //! put the method
                                  context.read<CreateNoteBloc>().add(
                                      MotherCreateNoteEvent(
                                          childId: id,
                                          motherCreateNoteModel:
                                              MotherCreateNoteModel(
                                            name: name.text,
                                            notes: content.text,
                                          )));
                                },
                              );
                            }
                          },
                        ),
                         SizedBox(
                          // height: 10,
                          height: screenheight/20,
                        ),
                        // Custombutton(
                        //   text: 'back',
                        //   onPressed: () {
                        //     Navigator.pop(context);
                        //   },
                        // ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
