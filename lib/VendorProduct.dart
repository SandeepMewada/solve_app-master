import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'ProductDeatilPage.dart';
import 'VendorProductDetailPage.dart';

class VendorProduct extends StatefulWidget {
  VendorProduct(List vendorProduct,FirebaseAuth auth)
  {
    _VendorProductState.vendorProduct=vendorProduct;
    _VendorProductState.auth=auth;
  }
  @override
  _VendorProductState createState() => _VendorProductState();
}

class _VendorProductState extends State<VendorProduct> {
static List vendorProduct;
static FirebaseAuth auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Product('+vendorProduct.length.toString()+' items)'),
      ),
        body:Container(

    child: vendorProduct.length == 0
    ? new Text("no product available")
        : new ListView.builder(
    itemCount: vendorProduct.length,
    itemBuilder: (_, index) {
    return ProductPost(vendorProduct[index].description,
    vendorProduct[index].imageUrl, vendorProduct[index].price,
        vendorProduct[index].productId,
        vendorProduct[index].shortInfo, vendorProduct[index].title);
    }),
    ),
    );
  }

Widget ProductPost(String description, String image, String price,String productId, String shortInfo, String title){
  return FittedBox(
    child: Card(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => VendorProductDetailPage(description,image,price,productId,shortInfo,title,auth)));
        },
        child: Row(
          children: [
            // itemCake(),
            Container(
              width: 90,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image(
                  fit: BoxFit.contain,
                  alignment: Alignment.topRight,
                  image: NetworkImage(image),
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.redAccent),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    shortInfo,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 9.5,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: <Widget>[
                      // Icon(
                      //   Icons.shopping_cart,
                      //   size: 15,
                      // ),
                      SizedBox(width: 5),
                      Container(
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "₹"+price,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 9.5,
                              color: Colors.red),
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "\$34",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 9.5,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Rating',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 7,
                            color: Colors.grey),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.star, size: 10, color: Colors.orangeAccent),
                      Icon(Icons.star, size: 10, color: Colors.orangeAccent),
                      Icon(Icons.star, size: 10, color: Colors.orangeAccent),
                      Icon(Icons.star, size: 10, color: Colors.orangeAccent),
                      Icon(Icons.star, size: 10, color: Colors.orangeAccent),
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    ),
  );
}

}
