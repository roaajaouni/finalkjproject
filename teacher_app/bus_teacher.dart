import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/teacher_blocs/location_bloc/location_teacher_bloc.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/model/teacher_app_model/send_location.dart';
import 'package:flutter_childhood/view/widget/login/custombutton.dart';

class Bus_page extends StatefulWidget {
  final int id;
  final String name;
  const Bus_page({super.key, required this.id, required this.name});

  @override
  State<Bus_page> createState() => _Bus_pageState();
}

class _Bus_pageState extends State<Bus_page> {
  TextEditingController Importan_notes = TextEditingController();
  String dropDownValue = 'arrive';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text("${widget.name}'s state ",style:const TextStyle(color: AppColor.fairuz),),
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
          // actions: <Widget>[
          //   IconButton(
          //     onPressed: () {
          //       Navigator.pushReplacement(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) =>
          //                   TeacherDetailLocationPage(id: widget.id,name: widget.name,)));
          //     },
          //     icon: const Icon(Icons.location_on_outlined),
          //     iconSize: 30,
          //     color: AppColor.fairuz,
          //   )
          // ],
        ),
        body: BlocProvider(
          create: (context) =>LocationTeacherBloc (),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(50),
              child: Column(
                children: [
                  //  const Text(
                  //     '',

                  //     style: TextStyle(
                  //       fontSize: 28,
                  //       fontWeight: FontWeight.w500,
                  //       color: AppColor.terqaz,

                  //     ),
                  //   ),
                  Center(
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.fairuz,
                            borderRadius: BorderRadius.circular(20)),
                        padding:
                            const EdgeInsets.only(top: 20, left: 15, right: 15),
                        height: 200,
                        width: 300,
                        child: TextField(
                          controller: Importan_notes,
                          maxLines: 3,
                          decoration: const InputDecoration(
                              hintText: 'click here ',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 233, 230, 230))),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      margin: const EdgeInsets.all(2),
                      height: 200,
                      width: 300,
                      padding: const EdgeInsets.all(18),
                      child: Center(
                        heightFactor: 50.0,
                        child: DropdownButton<String>(
                          value: dropDownValue,
                          icon: const Icon(Icons.arrow_downward),
                          style: const TextStyle(color: AppColor.terqaz),
                          underline: Container(
                            height: 4,
                            color: AppColor.terqaz,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                            });
                          },
                          items: const [
                            DropdownMenuItem<String>(
                                value: 'arrive',
                                child: Text(
                                  'Arrived',
                                  style: TextStyle(fontSize: 20),
                                )),
                            DropdownMenuItem<String>(
                                value: 'left',
                                child: Text(
                                  'Left',
                                  style: TextStyle(fontSize: 20),
                                )),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<LocationTeacherBloc, LocationTeacherState>(
                    builder: (context, state) {
                      if (state is LocationTeacherInitial) {
                        return Custombutton(
                          text: 'submit',
                          onPressed: () {
                            //! put the method

                            context
                                .read<LocationTeacherBloc>()
                                .add(AddChildLocationEvent(
                                    childId: widget.id,
                                    teacherLocationModel: TeacherLocationModel(
                                      location: dropDownValue,
                                      Important_notes: Importan_notes.text,
                                    )));
                          },
                        );
                      } else if (state is ChildLocationLoadingState) {
                        return const CircularProgressIndicator();
                      } else {
                        return Custombutton(
                          text: 'submit',
                          onPressed: () {
                            //! put the method
                            context
                                .read<LocationTeacherBloc>()
                                .add(AddChildLocationEvent(
                                    childId: widget.id,
                                    teacherLocationModel: TeacherLocationModel(
                                      location: dropDownValue,
                                      Important_notes: Importan_notes.text,
                                    )));
                          },
                        );
                      }
                    },
                  ),
                  // ClipOval(
                  //     child: Image.asset(
                  //   AppImageAsset.train,
                  //   height: 150,
                  //   width: 150,
                  // )),
                ],
              ),
            ),
          ),
        ));
  }
}
