import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_childhood/blocs/mother_blocs/mother_view_reportbloc/viewreport_bloc.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/core/constant/imageasset.dart';
import 'package:flutter_childhood/view/screen/mother_app/reportdetail.dart';

class ReportsPage extends StatelessWidget {
  // const ReportsPage({super.key});
  final int id;
  final String name;
  final String age;
  final String gender;
  const ReportsPage({
    Key? key,
    required this.name,
    required this.id,
    required this.age,
    required this.gender,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
     double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) =>
          ViewreportBloc()..add(GetAllMyKidsReportsEvent(childId: id)),
      child: Scaffold(
          // backgroundColor: AppColor.backgroundColor,
          appBar: AppBar(
              backgroundColor: AppColor.terqaz,
              centerTitle: true,
              title: Text( " $name 's reports",style: const TextStyle(color: AppColor.fairuz),),
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
          body: BlocBuilder<ViewreportBloc, ViewreportState>(
            builder: (context, state) {
              if (state is MyKidsReportNoAddedState) {
                return Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        // Image.asset(
                        //   AppImageAsset.magic,
                        //   // height: 200,
                        //   height: screenheight/5,
                        // ),
                         SizedBox(
                          // height: 50,
                          height: screenheight/15,
                        ),
                        const Center(
                          child: Text(
                            '   Hi !  ',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: AppColor.terqaz),
                          ),
                        ),
                         SizedBox(
                          // height: 50,
                          height: screenheight/50,
                        ),
                        const Center(
                          child: Text(
                            '    No reports added yet ',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: AppColor.terqaz),
                          ),
                        ),
                         SizedBox(
                          // height: 200,
                          height: screenheight/5,
                        ),
                         Image.asset(
                          AppImageAsset.magic,
                          // height: 200,
                          height: screenheight/5,
                        ),
                        
                        // SizedBox(
                        //   width: 300,
                        //   child: MaterialButton(
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(100)),
                        //     color: AppColor.terqaz,
                        //     textColor: AppColor.fairuz,
                        //     onPressed: () {
                        //       //! back to the previous page
                        //       Navigator.pop(context);
                        //     },
                        //     child: const Text('Back'),
                        //   ),
                        // )
                      ],
                    ));
              } else if (state is GetAllMyKidsReportsFailureState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else if (state is GetAllMyKidsReportsSuccessState) {
                return Container(
                  color: Colors.white,
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      // Text(
                      //   " $name 's reports",
                      //   style: const TextStyle(
                      //     fontSize: 25,
                      //     fontWeight: FontWeight.w500,
                      //     color: AppColor.terqaz,
                      //   ),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: AppColor.terqaz,
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        height: 50,
                        width: 400,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Date',
                              style: TextStyle(
                                  color: AppColor.fairuz, fontSize: 22),
                            ),
                            Text(
                              'Report',
                              style: TextStyle(
                                  color: AppColor.fairuz, fontSize: 22),
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
                        height: 300,
                        padding: const EdgeInsets.all(18),
                        child: ListView.builder(
                          itemCount: state.reportMyKids.length,
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

                                // ! put reportdate here
                                title: Text(
                                    ' ${DateTime.parse(state.reportMyKids[index].created).day}-${DateTime.parse(state.reportMyKids[index].created).month}-${DateTime.parse(state.reportMyKids[index].created).year}'),
                                trailing: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ReportDetail(
                                                    viewReportModel: state
                                                        .reportMyKids[index],
                                                    name: name,
                                                    age: age,
                                                    gender: gender,
                                                  )));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 4),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: AppColor.terqaz,
                                      ),
                                      height: 30,
                                      width: 70,
                                      child: const Text(
                                        'view',
                                        style: TextStyle(
                                            color: AppColor.fairuz,
                                            fontSize: 15),
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
                        height: screenheight/200,
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
                        AppImageAsset.hand,
                        // height: 170,
                        height: screenheight/5,
                        width: 170,
                      )),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )

          //             if(true) {Container(
          //              // color: AppColor.backgroundColor,
          //               color: Colors.white,
          //               padding:const  EdgeInsets.all(15),
          //             margin: const EdgeInsets.all(10),
          //               child: Column(

          //                 children: [
          //                    Image.asset(
          //                   AppImageAsset.magic,
          //                   height: 200,

          //                 ),
          //                  const SizedBox(height: 50,),
          // const Center(
          //                   child: Text('   Hi !  ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: AppColor.terqaz),),),

          //                 const   SizedBox(height: 50,),
          //                    const Center(
          //                   child: Text('    No reports added yet ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: AppColor.terqaz),),
          //                 ),
          //                const  SizedBox(height: 200,),
          //                 SizedBox(width: 300,
          //                    child: MaterialButton(
          //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          //                         color: AppColor.terqaz,
          //                         textColor: AppColor.fairuz,
          //                         onPressed: (){

          //                         },

          //                         child:const Text('Back'),
          //                       ),
          //                  )
          //                 ],
          //               )
          //             )
          //   }
          //   else{
          // Container(
          //         //color: AppColor.backgroundColor,
          //         color: Colors.white,
          //          margin: const EdgeInsets.only(top: 50),
          //          child: Column(
          //             children: [

          //          const  Text('The reports',style:TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: AppColor.grey) ,),

          //              Container(
          //               color: Colors.white,
          //               margin: const EdgeInsets.all(5),
          //              height: 500,
          //               padding: const EdgeInsets.all(15),
          //               child:
          //                  ListView.builder(
          //                 itemCount:10,
          //                 itemBuilder: (context, i){
          //               return Card(
          //                 margin:const EdgeInsets.only(top: 15,),
          //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(150),side:const  BorderSide(color: AppColor.terqaz)),
          //                 child: ListTile(
          //                   onTap: () {
          //                 },

          //                 // ! put reportname here
          //               title:  Text('report name'),

          //             ),
          //             );

          //              },

          //                  ),
          //              ),

          //              const SizedBox(height: 50,),
          //           SizedBox(width: 300,
          //                    child: MaterialButton(
          //                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          //                         color: AppColor.terqaz,
          //                         textColor: AppColor.fairuz,
          //                         onPressed: (){

          //                         },

          //                         child:const Text('Back'),
          //                       ),
          //                  )

          //            ],
          //          ),
          //     );}
          ),
    );
  }
}
