import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:helmet/app/common/utils/app_colors.dart';
import 'package:helmet/app/common/utils/app_theme.dart';
import 'package:helmet/app/data/data.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  AppStyle _appStyle;
  double _dXOffset = 0.0;
  double _dYOffset = 0.0;
  double _scaleFactory = 1;
  bool _isDrawerOpen = false;
  int _categorySelected = 0;

  List<BoxShadow> shadowList = [
    BoxShadow(
      color: Colors.grey[300],
      blurRadius: 30,
      offset: Offset(0, 10),
    )
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _appStyle = AppStyle.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(_dXOffset, _dYOffset, 0)
        ..scale(_scaleFactory),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: _isDrawerOpen
            ? BorderRadius.circular(32)
            : BorderRadius.circular(0),
        color: AppColors.colorGreyF6,
      ),
      child: GestureDetector(
        onTap: () async {
          setState(() {
            if (_isDrawerOpen) {
              _dXOffset = 0.0;
              _dYOffset = 0.0;
              _scaleFactory = 1;
              _isDrawerOpen = false;
            }
          });
        },
        child: ClipRRect(
          borderRadius: _isDrawerOpen
              ? BorderRadius.circular(32)
              : BorderRadius.circular(0),
          child: Stack(
            children: [
              NestedScrollView(
                headerSliverBuilder: (context, isScroll) => [
                  _buildSliverAppBar(context),
                ],
                body: _buildPets(),
              ),
              _isDrawerOpen
                  ? Container(
                      color: Colors.transparent,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.colorGreyF6,
      expandedHeight: MediaQuery.of(context).size.height * 0.35,
      floating: true,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            _buildAppBar(),
            _buildSizedBox,
            _buildSearch(),
            _buildSizedBox,
            _buildCategory(),
          ],
        ),
      ),
    );
  }

  SizedBox _buildSizedBox = const SizedBox(
    height: 16,
  );

  Widget _buildAppBar() => Container(
        padding: EdgeInsets.only(
          left: 16,
          top: MediaQuery.of(context).padding.top + 8,
          right: 16,
          bottom: 8,
        ),
        color: AppColors.colorWhite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _isDrawerOpen
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.primaryColor,
                    ),
                    onPressed: () async {
                      setState(() {
                        _dXOffset = 0;
                        _dYOffset = 0;
                        _scaleFactory = 1;
                        _isDrawerOpen = false;
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: AppColors.colorGrey84,
                    ),
                    onPressed: () async {
                      setState(() {
                        _dXOffset = 230;
                        _dYOffset = 150;
                        _scaleFactory = 0.7;
                        _isDrawerOpen = true;
                      });
                    },
                  ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Location',
                  style: _appStyle.defaultTextStyle(
                    color: AppColors.colorGrey84,
                    size: 16,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesome.map_marker,
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Viet Nam',
                      style: _appStyle.defaultTextBoldStyle(
                        color: AppColors.colorGrey84,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.primaryColor,
            ),
          ],
        ),
      );

  Widget _buildSearch() {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: AppColors.colorWhite),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        decoration: InputDecoration(
          isDense: false,
          contentPadding: EdgeInsets.zero,
          suffixIcon: Icon(
            FontAwesome.sliders,
            color: AppColors.colorGrey84,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.colorGrey84,
          ),
          hintText: 'Search pet for adopt',
          hintStyle: _appStyle?.defaultTextStyle(
            color: AppColors.colorGrey84,
            size: 16,
          ),
          fillColor: AppColors.colorWhite,
          filled: true,
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          disabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
        ),
        style: _appStyle?.defaultTextStyle(
          color: AppColors.colorBlack13,
          size: 16,
        ),
      ),
    );
  }

  Widget _buildCategory() => Container(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final category = categories[index];
            return Column(
              children: [
                Card(
                  color: _categorySelected == index
                      ? AppColors.primaryColor
                      : AppColors.colorWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 5,
                  shadowColor: AppColors.colorBlack13,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.asset(
                      category.asset,
                      width: 30,
                      height: 30,
                      color: _categorySelected == index
                          ? AppColors.colorWhite
                          : AppColors.colorGrey84,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '${category.title}',
                  style: _appStyle.defaultTextStyle(
                    color: AppColors.colorBlack13,
                    size: 14,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 16,
          ),
          itemCount: categories.length,
        ),
      );

  Widget _buildPets() => ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final pet = pets[index];
          return Container(
            height: 200,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Row(
                  children: [
                    Container(
                      height: 180,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: pet.color,
                      ),
                    ),
                    _buildContents(pet),
                  ],
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 130,
                    height: 180,
                    child: Image.asset(
                      pet.asset,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
        itemCount: pets.length,
      );

  Widget _buildContents(Pet pet) => Expanded(
        child: Container(
          height: 160,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            color: AppColors.colorWhite,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${pet.name}',
                      style: _appStyle?.defaultTextBoldStyle(
                        color: AppColors.colorGrey84,
                        size: 24,
                      ),
                    ),
                  ),
                  pet.gender == 0
                      ? Icon(
                          FontAwesome.venus,
                          color: AppColors.colorGrey84,
                        )
                      : Icon(
                          FontAwesome.mars,
                          color: AppColors.colorGrey84,
                        ),
                ],
              ),
              Text(
                '${pet.description}',
                style: _appStyle?.defaultTextBoldStyle(
                  color: AppColors.colorGrey84,
                  size: 14,
                ),
              ),
              Text(
                '2 years old',
                style: _appStyle?.defaultTextStyle(
                  color: AppColors.colorGrey84,
                  size: 14,
                ),
              ),
              Row(
                children: [
                  Icon(
                    FontAwesome.map_marker,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      '${pet.address}',
                      style: _appStyle?.defaultTextStyle(
                        color: AppColors.colorGrey84,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
