import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/teacher_blocs/read_report_bloc/read_report_bloc.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/core/constant/imageasset.dart';
import 'package:flutter_childhood/view/screen/teacher_app/detail_report.dart';

class TeacherSavedReport extends StatelessWidget {
  final int id;
  final String name;
  final String age;
  final String gender;
  const TeacherSavedReport(
      {super.key,
      required this.id,
      required this.name,
      required this.age,
      required this.gender});

  @override
  Widget build(BuildContext context) {
     double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => ReadReportBloc()..add(TeacherReadReportEvent(childId: id)),
      child: Scaffold(
        appBar: AppBar(
           centerTitle: true,
          title: Text(" $name's  reports",
                          //name  ,                        
                           style:const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColor.fairuz),
                        ) ,
            backgroundColor: AppColor.terqaz,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColor.fairuz,
              ),
            )),
        backgroundColor: Colors.white,
        body: BlocBuilder<ReadReportBloc, ReadReportState>(
          builder: (context, state) {
            if (state is TeacherReadReportSuccessState) {
              return Container(
                color: Colors.white,
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    // Text(
                    //   " $name 's reports",
                    //   //" $name 's reports",
                    //   style: const TextStyle(
                    //     fontSize: 25,
                    //     fontWeight: FontWeight.w500,
                    //     color: AppColor.terqaz,
                    //   ),
                    // ),
                    SizedBox(
                      // height: 10,
                      height: screenheight/50,
                    ),
                    Container(
                      color: AppColor.terqaz,
                      margin: const EdgeInsets.all(12),
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      // height: 50,
                      height: screenheight/15,
                      // width: 400,
                      width: screenwidth/1,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date',
                            style:
                                TextStyle(color: AppColor.fairuz, fontSize: 22),
                          ),
                          Text(
                            'Report',
                            style:
                                TextStyle(color: AppColor.fairuz, fontSize: 22),
                          )
                        ],
                      ),
                    ),
                    //                      Text(
                    //                     'The reports',
                    //                     style: GoogleFonts.unkempt(
                    // textStyle: const TextStyle(color: Colors.amber, fontSize: 40)
                    //                   ),
                    // ),
                    Container(
                      color: Colors.white,
                      margin: const EdgeInsets.all(2),
                      // height: 300,
                      height: screenheight/2.5,
                      padding: const EdgeInsets.all(18),
                      child: ListView.builder(
                        itemCount: state.viewReportModel.length,
                        // state.reportMyKids.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            margin: const EdgeInsets.only(
                              top: 10,
                            ),
                            shape: const RoundedRectangleBorder(
                                // borderRadius: BorderRadius.circular(150),
                                // side: BorderSide(color: AppColor.terqaz)
                                ),
                            child: ListTile(
                              // onTap: () {
                              //   Navigator.push(context, MaterialPageRoute(builder: (context)=> ReportDetail(viewReportModel:state.reportMyKids[index] ,name: name,age: age,gender: gender,)));
                              // },

                              // ! put reportname here
                              title: Text(
                                  ' ${DateTime.parse(state.viewReportModel[index].created).day}-${DateTime.parse(state.viewReportModel[index].created).month}-${DateTime.parse(state.viewReportModel[index].created).year}'
                                  // ' ${state.reportMyKids[index].created}'
                                  ),
                              trailing: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TeacherDetailReportPage(
                                                  viewReportModel: state
                                                      .viewReportModel[index],
                                                  name: name,
                                                  age: age,
                                                  gender: gender,
                                                )
                                            // ReportDetail(
                                            //   viewReportModel: state
                                            //       .reportMyKids[index],
                                            //   name: name,
                                            //   age: age,
                                            //   gender: gender,
                                            // )
                                            ));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: AppColor.terqaz,
                                    ),
                                    // height: 30,
                                    height: screenheight/20,
                                    // width: 70,
                                    width: screenwidth/5,
                                    child: const Text(
                                      'view',
                                      style: TextStyle(
                                          color: AppColor.fairuz, fontSize: 15),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                          );
                        },
                      ),
                    ),
                     SizedBox(
                      // height: 10,
                      height: screenheight/15,
                    ),
                    // SizedBox(
                    //   width: 200,
                    //   child: MaterialButton(
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(100)),
                    //     color: AppColor.terqaz,
                    //     textColor: AppColor.fairuz,
                    //     onPressed: () {
                    //       Navigator.pop(context);
                    //     },
                    //     child: const Text('Back'),
                    //   ),
                    // ),
                    ClipOval(
                        child: Image.asset(
                      AppImageAsset.report,
                      // height: 170,
                      height: screenheight/5,
                      // width: 170,
                      width: screenheight/2,
                    )),
                  ],
                ),
              );
            } else if (state is TeacherReadReportFailureState) {
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
