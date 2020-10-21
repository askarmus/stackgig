import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imageName;
  final String title;
  final String totalQuestion;
  final Function press;
  const CategoryCard({
    Key key,
    this.imageName,
    this.title,
    this.totalQuestion,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Material(
          color: Color(0xFF404068),
          child: GestureDetector(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                leading: CachedNetworkImage(
                  width: 40,
                  height: 40,
                  imageUrl: "https://stackgig.com$imageName",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                title: Text(title,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                subtitle: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF28b3f1),
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(10),
                            right: Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(totalQuestion,
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2d2d51))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("  Questions",
                        style: TextStyle(fontSize: 13, color: Colors.white)),
                  ],
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
