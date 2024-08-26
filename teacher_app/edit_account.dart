import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/teacher_blocs/account_bloc/teacher_account_bloc.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/model/teacher_app_model/update_teacher_model.dart';
import 'package:flutter_childhood/view/widget/customcarttextfield.dart';

class TeacherAccountEdittingPage extends StatelessWidget {
  TeacherAccountEdittingPage({super.key});
    TextEditingController name = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController phone = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController address = TextEditingController();
final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TeacherAccountBloc()..add(GetTeacherPreviousInfoEvent (
           
            )),
        child: BlocBuilder<TeacherAccountBloc, TeacherAccountState>(
          builder: (context, state) {
            if (state is GetTeacherAccountSuccessState) {
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: 600,
                        color: AppColor.terqaz,
                        child: const Icon(
                          Icons.person,
                          size: 200,
                          color: AppColor.fairuz,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomCartTextField(
                          //!put the previous username
                          hintText: state.teacherAccountPreviousModel.username,
                          iconData: Icons.person_3_outlined,
                          mycontroller: username,
                          valid: (val) {
                            if (val!.isEmpty) {
                              return "Please this field is required";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomCartTextField(
                          //!put the previous email
                          hintText: state.teacherAccountPreviousModel.email,
                          iconData: Icons.email,
                          mycontroller: email,
                          valid: (val) {
                            if (val!.isEmpty) {
                              return "Please this field is required";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomCartTextField(
                          //!put the previous phone
                          hintText: state.teacherAccountPreviousModel.phone,
                          iconData: Icons.phone,
                          mycontroller: phone,
                          valid: (val) {
                            if (val!.isEmpty) {
                              return "Please this field is required";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomCartTextField(
                          //!put the previous address
                          hintText: state.teacherAccountPreviousModel.address,
                          iconData: Icons.home,
                          mycontroller: address,
                          valid: (val) {
                            if (val!.isEmpty) {
                              return "Please this field is required";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        color: AppColor.terqaz,
                        textColor: AppColor.fairuz,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<TeacherAccountBloc>().add(
                                  SendTeacherInfoEdittingEvent(
                                      updateTeacherInfoModel:
                                           UpdateTeacherInfoModel(
                                              username: username.text,
                                              email: email.text,
                                              phone: phone.text,
                                              address: address.text)),
                                );
                                
                                 ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("the information has been successfully modified")));
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MyAccount()));
                    Navigator.pop(context);
                          }
                        },
                        child: const Text('Edit'),
                      )
                    ],
                  ),
                ),
              );
            } else if(state is GetTeacherAccountFailureState) {
              return Center(
                child: Text(state.errorMessage),
              );
             } 
            else {
              return const Center(
                child: CircularProgressIndicator(),
              );
           }
          },
        ),
      ),
    );
  }
}