// ignore: file_names
import 'dart:developer';
import 'package:connections/models/DateItem.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateController extends GetxController {
  RxList<DateItem> dates = <DateItem>[].obs;
  RxInt page = 1.obs;
  RxBool isLoading = false.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    _fetchDates();
  }

  void _scrollListener() {
    final threshold = scrollController.position.maxScrollExtent * 0.8;
    if (!isLoading.value && scrollController.position.pixels >= threshold) {
      _fetchDates();
    }
  }

  void _fetchDates() async {
    if (!isLoading.value) {
      isLoading.value = true;
      try {
        final response = await Dio().get('https://randomuser.me/api/',
            queryParameters: {'page': page, 'results': 10});
        if (response.statusCode == 200) {
          final data = response.data['results'] as List<dynamic>;
          final newDates = data
              .map((item) => DateItem(
                    name: '${item['name']['first']} ${item['name']['last']}',
                    age: item['dob']['age'],
                    email: item['email'],
                    phone: item['phone'],
                    date: item['registered']['date'],
                    location:
                        '${item['location']['city']}, ${item['location']['country']}',
                    postcode: '${item['location']['postcode']}',
                    imageUrl: item['picture']['medium'],
                  ))
              .toList();
          dates.addAll(newDates);
          page.value++;
        }
      } catch (e) {
        log('Error fetching dates: $e');
      } finally {
        isLoading.value = false;
      }
    }
  }

}
