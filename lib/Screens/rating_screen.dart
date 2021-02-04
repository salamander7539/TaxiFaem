import 'package:flutter/material.dart';
import 'package:flutter_faem_app/Get/get_my_orders.dart';
import 'package:flutter_faem_app/Post/rating_order.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int ratingValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ),
            Text('Поставте оценку, плииииз'),
            Divider(color: Colors.white,),
            RatingBar.builder(
              initialRating: 0,
              minRating: 0,
              direction: Axis.horizontal,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                ratingValue = rating.round();
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      await ratingOrder(myOrders[0].driver.uuid, myOrders[0].uuid, ratingValue);
                    }, child: Text("Подтвердить"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
