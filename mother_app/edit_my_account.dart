// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_childhood/blocs/mother_blocs/my_account_bloc/mother_my_account_bloc.dart';
// import 'package:flutter_childhood/core/constant/color.dart';
// import 'package:flutter_childhood/model/mother_app_model/update_mother_info.dart';
// import 'package:flutter_childhood/view/widget/customcarttextfield.dart';

// class MotherEdittingMyAccount extends StatefulWidget {
//   MotherEdittingMyAccount({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MotherEdittingMyAccount> createState() =>
//       _MotherEdittingMyAccountState();
// }

// class _MotherEdittingMyAccountState extends State<MotherEdittingMyAccount> {
//   TextEditingController name = TextEditingController();

//   TextEditingController username = TextEditingController();

//   TextEditingController phone = TextEditingController();

//   TextEditingController email = TextEditingController();

//   TextEditingController address = TextEditingController();

//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocProvider(
//         create: (context) => MotherMyAccountBloc()..add(GetMotherEvent(
//             //token:getIt.get<SharedPreferences>().getString('token').toString()
//             )),
//         child: BlocBuilder<MotherMyAccountBloc, MotherMyAccountState>(
//           builder: (context, state) {
//             if (state is GetMotherAccountSuccessState) {
//               return SingleChildScrollView(
//                 child: Form(
//                   key: formKey,
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 200,
//                         width: 600,
//                         color: AppColor.terqaz,
//                         child: const Icon(
//                           Icons.person,
//                           size: 200,
//                           color: AppColor.fairuz,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       CustomCartTextField(
//                           //!put the previous username
//                           hintText: state.motherMyAccountModel.username,
//                           iconData: Icons.person_3_outlined,
//                           mycontroller: username,
//                           valid: (val) {
//                             if (val!.isEmpty) {
//                               return "Please this field is required";
//                             }
//                             return null;
//                           }),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       CustomCartTextField(
//                           //!put the previous email
//                           hintText: state.motherMyAccountModel.email,
//                           iconData: Icons.email,
//                           mycontroller: email,
//                           valid: (val) {
//                             if (val!.isEmpty) {
//                               return "Please this field is required";
//                             }
//                             return null;
//                           }),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       CustomCartTextField(
//                           //!put the previous phone
//                           hintText: state.motherMyAccountModel.phone,
//                           iconData: Icons.phone,
//                           mycontroller: phone,
//                           valid: (val) {
//                             if (val!.isEmpty) {
//                               return "Please this field is required";
//                             }
//                             return null;
//                           }),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       CustomCartTextField(
//                           //!put the previous address
//                           hintText: state.motherMyAccountModel.address,
//                           iconData: Icons.home,
//                           mycontroller: address,
//                           valid: (val) {
//                             if (val!.isEmpty) {
//                               return "Please this field is required";
//                             }
//                             return null;
//                           }),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       MaterialButton(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(100)),
//                         color: AppColor.terqaz,
//                         textColor: AppColor.fairuz,
//                         onPressed: () {
//                           if (formKey.currentState!.validate()) {
//                             context.read<MotherMyAccountBloc>().add(
//                                   SendMotherInfoEdittingEvent(
//                                       updateMotherInfoModel:
//                                           UpdateMotherInfoModel(
//                                               username: username.text,
//                                               email: email.text,
//                                               phone: phone.text,
//                                               address: address.text)),
//                                 );
                                
//                                  ScaffoldMessenger.of(context)
//                     .showSnackBar(const SnackBar(content: Text("the information has been successfully modified")));
//                     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const MyAccount()));
//                     Navigator.pop(context);
//                           }
//                         },
//                         child: const Text('Edit'),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             } else if(state is GetMotherAccountFailureState) {
//               return Center(
//                 child: Text(state.errorMessage),
//               );
//              } 
//             else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//            }
//           },
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_childhood/blocs/mother_blocs/my_account_bloc/mother_my_account_bloc.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/model/mother_app_model/update_mother_info.dart';
import 'package:flutter_childhood/view/widget/customcarttextfield.dart';

class MotherEdittingMyAccount extends StatefulWidget {
  MotherEdittingMyAccount({Key? key}) : super(key: key);

  @override
  State<MotherEdittingMyAccount> createState() => _MotherEdittingMyAccountState();
}

class _MotherEdittingMyAccountState extends State<MotherEdittingMyAccount> {
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('edit my account',style: TextStyle(color: AppColor.fairuz),),
            backgroundColor: AppColor.terqaz,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back,color: AppColor.fairuz,),
            )),
      body: BlocProvider(
        create: (context) => MotherMyAccountBloc()..add(GetMotherEvent()),
        child: BlocBuilder<MotherMyAccountBloc, MotherMyAccountState>(
          builder: (context, state) {
            if (state is GetMotherAccountSuccessState) {
              return SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        const CircleAvatar(
                          radius: 60,
                          backgroundColor: AppColor.terqaz,
                          child: Icon(Icons.person, size: 100, color: AppColor.fairuz),
                        ),
                        const SizedBox(height: 20),
                        CustomCartTextField(
                          hintText: state.motherMyAccountModel.username,
                          iconData: Icons.person_3_outlined,
                          mycontroller: username,
                          valid: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your username";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomCartTextField(
                          hintText: state.motherMyAccountModel.email,
                          iconData: Icons.email,
                          mycontroller: email,
                          valid: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your email";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomCartTextField(
                          hintText: state.motherMyAccountModel.phone,
                          iconData: Icons.phone,
                          mycontroller: phone,
                          valid: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your phone number";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomCartTextField(
                          hintText: state.motherMyAccountModel.address,
                          iconData: Icons.home,
                          mycontroller: address,
                          valid: (val) {
                            if (val!.isEmpty) {
                              return "Please enter your address";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: AppColor.terqaz,
                          textColor: AppColor.fairuz,
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<MotherMyAccountBloc>().add(
                                SendMotherInfoEdittingEvent(
                                  updateMotherInfoModel: UpdateMotherInfoModel(
                                    username: username.text,
                                    email: email.text,
                                    phone: phone.text,
                                    address: address.text,
                                  ),
                                ),
                              );

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Information successfully modified")),
                              );
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Save Changes', style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is GetMotherAccountFailureState) {
              return Center(child: Text(state.errorMessage));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

