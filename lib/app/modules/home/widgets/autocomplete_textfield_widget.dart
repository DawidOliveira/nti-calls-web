import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nti_calls_web/app/core/core.dart';
import 'package:nti_calls_web/app/modules/home/home_controller.dart';

class AutoCompleteTextFieldWidget extends StatelessWidget {
  const AutoCompleteTextFieldWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        controller: controller.searchController,
        onChanged: controller.setFilteredTasks,
        style: GoogleFonts.notoSans(),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              FocusScope.of(context).unfocus();
            },
          ),
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          fillColor: AppColors.GREY,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: 'Digite o nome de algum chamado...',
          hintStyle: GoogleFonts.notoSans(),
        ),
      ),
      noItemsFoundBuilder: (context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Text(
          'Nenhum chamado encontrado!',
          textAlign: TextAlign.center,
          style: GoogleFonts.notoSans(
            color: Theme.of(context).disabledColor,
            fontSize: 16.0,
          ),
        ),
      ),
      getImmediateSuggestions: true,
      debounceDuration: Duration(seconds: 0),
      suggestionsCallback: (pattern) {
        if (pattern.isEmpty) return Iterable.empty();
        return controller.suggestionList.where(
            (element) => element.toLowerCase().contains(pattern.toLowerCase()));
      },
      itemBuilder: (context, itemData) => ListTile(
        title: Text(
          itemData.toString(),
          style: GoogleFonts.notoSans(),
        ),
      ),
      onSuggestionSelected: (suggestion) {
        controller.searchController.text = suggestion.toString();
        controller.setFilteredTasks(suggestion.toString());
      },
    );
  }
}
