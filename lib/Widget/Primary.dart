import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/Mail.dart';

class PrimaryWidget extends StatelessWidget {
  PrimaryWidget({ this.mail}) ;
   Mail? mail;
  @override
  Widget build(BuildContext context) {
    return PrimaryWidgetPage(mail: mail!, title: 'titleeeee',);
  }
}

class PrimaryWidgetPage extends StatefulWidget {
  PrimaryWidgetPage({required this.title, this.mail}) ;

  final String title;
  Mail? mail;

  @override
  _PrimaryWidgetState createState() => _PrimaryWidgetState();
}

class _PrimaryWidgetState extends State<PrimaryWidgetPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10,right: 10, top: 15),
          child: Row(
            children: <Widget>[
              widget.mail!.useravatar!=null?
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(widget.mail!.useravatar),
                    ),
                )
                  :
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  backgroundColor: colorDecider(widget.mail!.username[0]),
                  radius: 25.0,
                 child: Text(widget.mail!.username[0], style: TextStyle(fontSize: 27, color: Colors.white,),),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          widget.mail!.username!=null?widget.mail!.username:"Unknow user",
                          // style: Theme.of(context).textTheme!.display1.copyWith(
                          //   fontSize: 16.0,
                          //   color: Colors.grey[800],
                          //   fontWeight: widget.mail!.seen?FontWeight.normal:FontWeight.bold
                          // ),
                        ),
                      ),
                      Container(
                        child: Text(
                          widget.mail!.subject,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14.0,
                            fontWeight: widget.mail!.seen?FontWeight.normal:FontWeight.bold,
                            color: widget.mail!.seen?Colors.grey:Colors.grey[800],
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          widget.mail!.body,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      widget.mail!.file?
                          Container(
                            width: 150,
                            height: 30,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                              border: Border.all(color: Colors.grey)
                            ),
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.image, size: 16,color: Color(0XFFFF0000),),
                                  SizedBox(width: 10,),
                                  Text(widget.mail!.filename, maxLines: 1, style: TextStyle(color: Colors.grey[700]), overflow: TextOverflow.ellipsis,)
                                ],
                              ),
                            ),
                          )
                          :
                      SizedBox.shrink()
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(widget.mail!.timeago,style: TextStyle( fontWeight: widget.mail!.seen?FontWeight.normal:FontWeight.bold),),
                  IconButton(
                    icon: widget.mail!.starred?Icon(Icons.star, color: Colors.amber):Icon(Icons.star_border), onPressed: () {  },
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}


colorDecider(String name){
    if(name == "R"){
      return Colors.yellow;
    }else if(name == "L"){
      return Colors.redAccent;
    }else if(name == "I"){
      return Colors.orangeAccent;
    }else if(name == "F"){
      return Colors.greenAccent;
    }else {
      return Colors.blueAccent;
    }
}