import 'package:flutter/material.dart';

class DetailCard extends StatefulWidget {
  final String title;
  final String lastWorkDate;
  final String consumption;
  final String tags;
  final String group;
  final String storage;
  final VoidCallback onDelete;
  final ImageProvider image;

  const DetailCard({
    super.key,
    required this.title,
    required this.lastWorkDate,
    required this.consumption,
    required this.tags,
    required this.group,
    required this.storage,
    required this.onDelete,
    required this.image,
  });

  @override
  DetailCardState createState() => DetailCardState();
}

class DetailCardState extends State<DetailCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 8,
        shadowColor: Colors.black.withOpacity(0.2),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              // Левая часть с изображением (40%)
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: widget.image,
                  backgroundColor: Colors.grey[200],
                ),
              ),
              SizedBox(width: 16),
              // Правая часть с информацией (60%)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_outline,
                              color: Colors.red[300]),
                          onPressed: widget.onDelete,
                          iconSize: 20,
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.lastWorkDate,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Расход: ${widget.consumption}',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.tags,
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),

                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Chip(
                          label: Text(
                            widget.group,
                            style: TextStyle(fontSize: 12),
                          ),
                          backgroundColor: Colors.blue[50],
                        ),
                        SizedBox(width: 8),
                        Chip(
                          label: Text(
                            widget.storage,
                            style: TextStyle(fontSize: 12),
                          ),
                          backgroundColor: Colors.green[50],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}