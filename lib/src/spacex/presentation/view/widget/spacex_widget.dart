import 'package:flutter/material.dart';
import 'package:spacex_app/core/common/widget/customer_text.dart';
import 'package:spacex_app/core/utils/data_function.dart';
import 'package:spacex_app/src/spacex/domain/entities/spacex.dart';

class SpacexWidget extends StatefulWidget {
  const SpacexWidget({super.key, required this.spaceXEntity, this.onTap});

  final SpaceXEntity? spaceXEntity;
  final VoidCallback? onTap;

  @override
  State<SpacexWidget> createState() => _SpacexWidgetState();
}

class _SpacexWidgetState extends State<SpacexWidget> {
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              if (widget.spaceXEntity?.links.smallPatch != null && widget.spaceXEntity!.links.smallPatch!.isNotEmpty)
                Image.network(
                  widget.spaceXEntity!.links.smallPatch.toString(),
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 100),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: widget.spaceXEntity!.name,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      CustomText(
                        text: formatDate(widget.spaceXEntity!.dateUtc),
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      const SizedBox(height: 5),
                      CustomText(
                        text: widget.spaceXEntity?.success == true ? 'Success' : 'Failure',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: widget.spaceXEntity?.success == true ? Colors.green : Colors.red,
                      ),
                      const SizedBox(height: 10),
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
