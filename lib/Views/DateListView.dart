import 'package:cached_network_image/cached_network_image.dart';
import 'package:connections/controllers/DateController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateListView extends GetView<DateController> {
  const DateListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        controller: controller.scrollController,
        itemCount: controller.dates.length + 1,
        itemBuilder: (context, index) {
          if (index == controller.dates.length) {
            return controller.isLoading.value
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox.shrink();
          }

          final date = controller.dates[index];
          
          final parsedDate = DateTime.parse(date.date);
          final formattedDate = DateFormat('d MMMM, yyyy').format(parsedDate);
          final formattedTime = DateFormat('hh:mm a').format(parsedDate);

          return KeepAliveWidget(
            child: Card(
              color: Colors.blueGrey[50],
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(date.imageUrl),
                      radius: 20,
                    ),
                    title: Text('${date.name} (${date.age})', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    subtitle: Text(date.email,  style: const TextStyle( fontSize: 12)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.call, color: Colors.blue,),
                          onPressed: () {}
                        ),
                        IconButton(
                          icon: const Icon(Icons.message, color: Colors.blue,),
                          onPressed: () {}
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start  ,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Date',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,)),
                              Text(formattedDate, style: TextStyle(fontSize: 14),),
                              Text(formattedTime, style: TextStyle(fontSize: 14),),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Location',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                              Text(date.location, style: TextStyle(fontSize: 14)),
                              Text('${date.postcode}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          );
        },
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 16.0),
      );
    });
  }
}


class KeepAliveWidget extends StatefulWidget {
  final Widget child;

  const KeepAliveWidget({super.key, required this.child});

  @override
  // ignore: library_private_types_in_public_api
  _KeepAliveWidgetState createState() => _KeepAliveWidgetState();
}

class _KeepAliveWidgetState extends State<KeepAliveWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
