import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lla_app/business.dart';
import 'package:lla_app/entity.dart';
import 'package:lla_app/presentation.dart';
import 'package:redux/redux.dart';

class LearningItemsScreen<T extends AppState> extends StatefulWidget {
  const LearningItemsScreen({Key? key}) : super(key: key);

  @override
  State<LearningItemsScreen> createState() => _LearningItemsScreenState<T>();
}

class _LearningItemsScreenState<T extends AppState>
    extends State<LearningItemsScreen> {
  final _imagePicker = ImagePicker();

  late Store<T> _store;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _store = StoreProvider.of<T>(context);

    onRefreshData();
  }

  void onRefreshData() {
    // Get all topcis
    _store.dispatch(GetAllTopicsAction());

    // Get all LI items
    final action = GetLIItemsAction();
    _store.dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: buildSearchBarContainer(),
              ),
              const SizedBox(width: 16),
              buildCaptureImageButton(),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: buildLearningItemsContainer(),
        ),
      ],
    );
  }

  Widget buildLearningItemsContainer() {
    return RefreshIndicator(
      onRefresh: () async {
        onRefreshData();
      },
      child: StoreConnector<AppState, BuiltList<LearningItemEntity>>(
        builder: (context, liItems) => ListView.builder(
          itemCount: liItems.length,
          itemBuilder: (context, index) {
            return buildLIItemWidget(
              index,
              context,
              liItems[index],
            );
          },
        ),
        converter: (store) {
          return store.state.liState.learningItems.values.toBuiltList();
        },
      ),
    );
  }

  InkWell buildLIItemWidget(
    int index,
    BuildContext context,
    LearningItemEntity learningItem,
  ) {
    return InkWell(
      onTap: () => navigateToLearningItemDetailScreen(
        learningItem.id,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          children: [
            Hero(
              tag: "learning_item_${learningItem.id}",
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 4),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    learningItem.imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    learningItem.englishWord,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: AppColors.primary,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    learningItem.vietnameseWord,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCaptureImageButton() {
    return ElevatedButton(
      onPressed: () {
        onCaptureImage();
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        elevation: 0,
      ),
      child: const Icon(
        Icons.add_a_photo_rounded,
        color: Colors.white,
      ),
    );
  }

  Widget buildSearchBarContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // Filter icon button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
          ),
        ],
      ),
    );
  }

  void navigateToLearningItemDetailScreen(String LearningItemId) {
    context.pushNamed(
      AppRoutes.learningItemDetailScreen,
      queryParameters: {
        ParamKeys.learningItemId: LearningItemId,
      },
    );
  }

  void onCaptureImage() async {
    final imageFile = await showModalBottomSheet<XFile?>(
      context: context,
      builder: (context) => const PickImageBottomSheet(),
      backgroundColor: Colors.transparent,
    );
    if (imageFile == null) {
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UploadLIScreen(
          imageFile: imageFile,
        ),
      ),
    );
  }

  Future<XFile?> _getImage() async {
    final imageFile = await _imagePicker.pickImage(
      imageQuality: 100,
      preferredCameraDevice: CameraDevice.rear,
      source: ImageSource.gallery,
    );

    return imageFile;
  }
}
