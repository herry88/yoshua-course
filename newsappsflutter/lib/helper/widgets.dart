import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String? imgUrl, title, desc, content, postUrl;
  NewsTile(
      {Key? key,
      this.imgUrl,
      this.title,
      this.desc,
      this.content,
      this.postUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 24.0,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(6.0),
            bottomLeft: Radius.circular(6.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.network(
                imgUrl.toString(),
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              title.toString(),
              style:const TextStyle(
                color: Colors.black87,
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
