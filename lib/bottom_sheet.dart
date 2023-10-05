import 'package:flutter/material.dart';


//한 줄 평론 Modal Bottom Sheet 커스텀 위젯
class BuildSheet extends StatelessWidget {
  const BuildSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Bottom Sheet 상단 '댓글', 닫힘 버튼
        Container(
          padding: EdgeInsets.fromLTRB(25,20,25,0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('댓글', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.close))
            ],
          ),
        ),
        SizedBox(height: 30),
        //한 줄 평론 ListView 목록
        Expanded(
          child: Container(
            height: 400,
            padding: EdgeInsets.fromLTRB(25,0,25,0),
            child: ListView.builder(
                itemCount: 7,
                itemBuilder: (context, index){
                  return Container(
                    height: 120,
                    padding: EdgeInsets.all(6),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset('profile.png', width: 30, height: 30, fit: BoxFit.cover,),
                            ),
                          ],
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('@minsung_key'),
                                  SizedBox(width: 10),
                                  Text('1개월 전')
                                ],
                              ),
                              SizedBox(height: 10),
                              Expanded(
                                child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean sodales efficitur pulvinar. Duis ut ex cursus, ultrices risus ut, vestibulum metus. Nam non nulla auctor, tempus sem vitae, semper dui. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', maxLines: 2, softWrap: false, overflow: TextOverflow.ellipsis,)
                              ),
                                  
                              Row(
                                children: [
                                  //좋아요 버튼
                                  IconButton(
                                    onPressed: (){}, 
                                    icon: Icon(Icons.favorite_border)
                                  ),
                                  //좋아요 개수
                                  Text('1')
                                ],
                              )
                            ],
                          ),
                        ),
            
                      ],
                    ),
                  );
                }
              ),
          ),
        ),
        Container(
          color: Color.fromARGB(255, 234, 234, 234),
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('profile.png', width: 30, height: 30, fit: BoxFit.cover,),
              ),
              SizedBox(width: 15),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '나의 한 줄 평론 입력',
                    isDense: true,
                    contentPadding: EdgeInsets.all(12)
                  ),
                ),
              ),
              SizedBox(width: 15),
              IconButton(
                onPressed: (){
          
                }, 
                icon: Icon(Icons.send))
            ],
          ),
        )
      ]
    );
  }
}