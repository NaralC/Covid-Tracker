import 'package:flutter/material.dart';
import '../utility/constants.dart';

class reusableCard extends StatelessWidget {
  reusableCard(this.imageURL, this.cardTitle, this.cardDescription);

  String imageURL = '';
  String cardTitle = '';
  String cardDescription = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 3,
            ),
          ]),
      child: Row(
        children: [
          Image.asset(
            imageURL,
            height: 75,
            width: 75,
          ),
          SizedBox(width: 20),
          Container(
            child: RichText(
              text: TextSpan(
                style: kSubTextStyle.copyWith(fontSize: 13),
                children: [
                  TextSpan(
                    text: cardTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                        fontSize: 18),
                  ),
                  TextSpan(text: cardDescription)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
