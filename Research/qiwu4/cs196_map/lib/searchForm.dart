// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, file_names, unnecessary_new

import 'package:flutter/material.dart';

///搜素框
class SearchFormWidget extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // ignore: avoid_unnecessary_containers
      return new Container(
        child: new Form(
          child: GestureDetector(
            onTap: (){       //
            },
            child: Container(
                margin: EdgeInsets.only(left: 50, top: 10,right: 50),
                //设置 child 居中
                alignment: Alignment(0, 0),
                height: 40,
                width: 350,
                //边框设置
                decoration: new BoxDecoration(
                  //背景
                  color: Colors.white.withOpacity(0.96),
                  //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                  borderRadius: BorderRadius.all(Radius.circular(25.0),),
                  //设置四周边框
                  border: new Border.all(width: 1, color: Colors.white60, ),  
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0.8,0.8),
                      spreadRadius: 1,
                      blurRadius: 1
                    )
                  ]
                
                           
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          alignment:Alignment.centerLeft,
                          icon: Icon(Icons.search),
                          color: Colors.black38,
                          iconSize: 25,
                          onPressed: () {
                            //跳转搜索页面
                            //showSearch(context: context, delegate: SearchBarDelegate());
                          }
                      ),
                      Text(
                        "Click to search",
                        textAlign: TextAlign.right,
                        style: new TextStyle(
                          color: Colors.black38,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      
                      ),
                    ],
                  ),
                )
            ),
          ),
        ),
      );
    }
  }
