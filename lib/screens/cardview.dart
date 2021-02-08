import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:polls/polls.dart';

class Cardview extends StatefulWidget {
  @override
  _CardviewState createState() => _CardviewState();
}

class _CardviewState extends State<Cardview> {
  double option1 = 51.0;
  double option2 = 49.0;

  String user = "king@mail.com";
  Map usersWhoVoted = {
    'sam@mail.com': 3,
    'mike@mail.com': 4,
    'john@mail.com': 1,
    'kenny@mail.com': 1
  };
  String creator = "eddy@mail.com";
  bool hasVoted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Test 2'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage("lib/images/Large.png"),
              fit: BoxFit.cover,
            ),
          ),
          height: 400.0,
          width: MediaQuery.of(context).size.width - 18,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Center(
                  child: Polls(
                      children: [
                        Polls.options(title: 'Reading', value: option1),
                        Polls.options(title: 'Lutton Town', value: option2),
                      ],
                      question: Text(
                        '   Which of our potential Carabao Cup \n   third-round opponents do you prefer?',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      currentUser: this.user,
                      creatorID: this.creator,
                      voteData: usersWhoVoted,
                      userChoice: usersWhoVoted[this.user],
                      onVoteBackgroundColor: Colors.red,
                      leadingBackgroundColor: Colors.grey,
                      backgroundColor: Colors.grey,
                      onVote: (choice) {
                        print(choice);
                        setState(() {
                          hasVoted = true;
                        });
                        setState(() {
                          this.usersWhoVoted[this.user] = choice;
                        });
                        if (choice == 1) {
                          setState(() {
                            option1 += 1.0;
                          });
                        }
                        if (choice == 2) {
                          setState(() {
                            option2 += 1.0;
                          });
                        }
                      }),
                ),
                SizedBox(
                  height: 20.0,
                ),
                hasVoted
                    ? Text(
                        'They meet in the second round at 18.00 BST.',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
