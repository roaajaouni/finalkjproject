import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_childhood/config/get_it.dart';
import 'package:flutter_childhood/core/constant/color.dart';
import 'package:flutter_childhood/core/constant/imageasset.dart';
import 'package:flutter_childhood/view/screen/mother_app/message.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';
class MotherChatBot extends StatefulWidget {
  const MotherChatBot({super.key});

  @override
  State<MotherChatBot> createState() => _MotherChatBotState();
}

class _MotherChatBotState extends State<MotherChatBot> {
 Dio dio = Dio();
 String aiUrl='http://192.168.43.93:8000/api/query/';
  TextEditingController userInput=TextEditingController();
  // final String apikey="AIzaSyB7sK8dCC0AV2jHaTvc8UfB60tQVpSnbV4";

  final List<Message> _messages=[];

  Future <void> talkWithAI() async{
    
    // final model=await GenerativeModel(model: 'gemini-pro', apiKey: apikey);

    // final msg='hello';
    // final content=Content.text(msg);
    // final response= await model.generateContent([content]);
    // print ("gemini ${response.text}");

    final userMsg=userInput.text;
     
    final response = await dio.post(aiUrl,data:{'query': userMsg},
      
      options: Options(
        headers: {
        'Authorization': 'Bearer ${getIt.get<SharedPreferences>().getString('token')}',
      },
      )
      
    );

    if (response.statusCode == 200) {
      final data = response.data;
      final aiResponse = data['answer'];

      setState(() {
        _messages.add(Message(message: userMsg, isUser: true, date: DateTime.now()));
        _messages.add(Message(message: aiResponse, isUser: false, date: DateTime.now()));
      });
     userInput.clear();
    
    } else {
      print('Failed to connect to the backend');
    }
    // setState(() {
    //   _messages.add(Message(message: userMsg,isUser: true,date: DateTime.now()));
    // });
// !communicaton with generateModel
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:AssetImage(AppImageAsset.ai),
          fit: BoxFit.cover
          ),
          
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(itemCount: _messages.length,itemBuilder: (context,index){
                final message=_messages[index];
                return Messages(isUser: message.isUser, message: message.message, date: DateTime.now());
              
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(flex: 15,
                    child: TextFormField(maxLines:null ,
style:const TextStyle(color: Colors.black) ,
controller: userInput,
decoration: InputDecoration(
  
  border: OutlineInputBorder(
    
    borderRadius: BorderRadius.circular(15),
     borderSide: const BorderSide(
      color: AppColor.terqaz, 
    ),
  ),
  label:const Text("Enter Your Message",style: TextStyle(color: AppColor.terqaz),)
),

                    )),
                   const Spacer(),
                    IconButton(
                      padding:const EdgeInsets.all(12),
                      iconSize: 30,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColor.terqaz),
                        foregroundColor: MaterialStateProperty.all(AppColor.fairuz),
                        shape: MaterialStateProperty.all(const CircleBorder())
                      ),
                      onPressed: (){
// ! create function call api
talkWithAI();
                      },
                      icon: const Icon(Icons.send),
                    )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}