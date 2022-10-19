
  import 'package:flutter/material.dart';

SliverAppBar SAppBar() {
    return SliverAppBar(
                  leadingWidth: 0,
                  automaticallyImplyLeading: false,
                  pinned: false,
                  floating: true,
                  snap: true,
                  title: Center(
                    child: Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(31, 180, 177, 177),
                          borderRadius: BorderRadius.circular(40)),
                      child: Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(left: 6),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white54,
                                  ))),
                          const SizedBox(
                            width: 180,
                            child: Text(
                              'Search by music',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
  }