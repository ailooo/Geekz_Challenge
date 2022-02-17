import 'package:flutter/material.dart';
import 'package:geekz_challenge/src/colors.dart';
import 'package:geekz_challenge/src/dimens.dart';
import 'package:intl/intl.dart';

import 'models/all_news_response.dart';

class DetailNews extends StatefulWidget {
  DetailNews({Key? key, this.detailNews}) : super(key: key);
  final Articles? detailNews;

  @override
  _DetailNewsState createState() {
    return _DetailNewsState();
  }
}

class _DetailNewsState extends State<DetailNews> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 1,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: widthInPercent(8,context),),
              onPressed: () => Navigator.pop(context)
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: cGreen,
          title: const Text(
            "Detail News",
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),
          ),

      ),
      body: SizedBox(
          height: double.maxFinite,
          width: double.maxFinite,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: widthInPercent(5,context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: heightInPercent(2, context),),
                Row(
                  children: [
                    Text(
                      widget.detailNews != null && widget.detailNews!.author != null ?
                      widget.detailNews!.author.toString() :  "No Author",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.red
                      ),
                    ),
                    Text(
                      widget.detailNews != null && widget.detailNews!.publishedAt != null ?
                      '- ${DateFormat('MMMM, dd yyyy').format(DateTime.parse(widget.detailNews!.publishedAt.toString()))}':  "-",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: heightInPercent(2,context)
                  ),
                  height: heightInPercent(25,context),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.detailNews != null && widget.detailNews!.urlToImage != null ?  widget.detailNews!.urlToImage.toString() :  ""),
                      )
                  ),
                ),
                SizedBox(height: heightInPercent(2, context),),
                Text(
                  widget.detailNews != null && widget.detailNews!.title != null ?  widget.detailNews!.title.toString() :  "No Title",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: heightInPercent(2, context),),

                Text(
                  widget.detailNews != null && widget.detailNews!.description != null ?  widget.detailNews!.description.toString() :  "No description",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                ),

              ],
            ),
          ),
      ),
    );
  }
}