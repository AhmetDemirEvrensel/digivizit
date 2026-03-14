import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:flutter/material.dart';

class CustomSearchableDropdown extends StatefulWidget {
  final String title;
  final String? selectedItem;
  final List<String> items;
  final bool isExpanded;
  final VoidCallback onTap;
  final Function(String) onItemTap;
  final VoidCallback? onClear;
  final String placeholder;

  const CustomSearchableDropdown({
    super.key,
    required this.title,
    required this.items,
    required this.isExpanded,
    required this.onTap,
    required this.onItemTap,
    this.selectedItem,
    this.onClear,
    this.placeholder = 'Seçiniz',
  });

  @override
  State<CustomSearchableDropdown> createState() => _CustomSearchableDropdownState();
}

class _CustomSearchableDropdownState extends State<CustomSearchableDropdown> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomSearchableDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isExpanded && !widget.isExpanded) {
      _searchController.clear();
      _searchQuery = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isSelected = widget.selectedItem != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(widget.title, style: AppFonts.base2Semibold),
        Column(
          spacing: 12,
          children: [
            GestureDetector(
              onTap: widget.onTap,
              child: Container(
                width: double.infinity,
                padding: appSizer.paddingSymmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF3B82F6).withAlpha(30) : (isDarkMode ? const Color(0xFF2D3748) : const Color(0xCCF3F4F6)),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: isSelected ? const Color(0xFF3B82F6).withAlpha(70) : Colors.transparent, width: 1.19),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.selectedItem ?? widget.placeholder,
                        style: appSizer.style(
                          color: isSelected
                              ? (isDarkMode ? Colors.white : const Color(0xFF374151))
                              : (isDarkMode ? const Color(0xFF8B95A5) : const Color(0xFF99A1AE)),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.23,
                        ),
                      ),
                    ),
                    if (isSelected && widget.onClear != null)
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: widget.onClear,
                        child: Container(
                          padding: appSizer.paddingAll(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF3B82F6).withAlpha(30),
                          ),
                          child: const Icon(Icons.close, color: Color(0xFF155DFC), size: 20),
                        ),
                      )
                    else
                      AnimatedRotation(
                        turns: widget.isExpanded ? 0.5 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: Icon(Icons.keyboard_arrow_down_rounded, color: isDarkMode ? const Color(0xFF8B95A5) : const Color(0xFF99A1AE), size: 24),
                      ),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: widget.isExpanded
                  ? Container(
                      height: _calculateHeight(widget.items, _searchQuery),
                      decoration: BoxDecoration(
                        color: isDarkMode ? const Color(0xFF2D3748) : const Color(0x99F3F4F6),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: isDarkMode ? const Color(0xFF3D4A5C) : const Color(0xCCE5E7EB), width: 1.19),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Column(
                          children: [
                            if (widget.items.length > 5) _buildSearchBar(isDarkMode),
                            Expanded(child: _buildList(isDarkMode)),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar(bool isDarkMode) {
    return Container(
      padding: appSizer.paddingSymmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1E2736) : const Color(0xFFF9FAFB),
        border: Border(bottom: BorderSide(color: isDarkMode ? const Color(0xFF3D4A5C) : const Color(0xCCE5E7EB), width: 1.19)),
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) => setState(() => _searchQuery = value),
        style: appSizer.style(color: isDarkMode ? Colors.white : const Color(0xFF374151), fontSize: 14, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          hintStyle: appSizer.style(color: isDarkMode ? const Color(0xFF8B95A5) : const Color(0xFF99A1AE), fontSize: 14, fontWeight: FontWeight.w500),
          prefixIcon: Icon(Icons.search, color: isDarkMode ? const Color(0xFF8B95A5) : const Color(0xFF99A1AE), size: 20),
          suffixIcon: _searchQuery.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    _searchController.clear();
                    setState(() => _searchQuery = '');
                  },
                  child: Icon(Icons.close, color: isDarkMode ? const Color(0xFF8B95A5) : const Color(0xFF99A1AE), size: 18),
                )
              : null,
          isDense: true,
          contentPadding: appSizer.paddingSymmetric(horizontal: 12, vertical: 10),
          filled: true,
          fillColor: isDarkMode ? const Color(0xFF2D3748) : Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: isDarkMode ? const Color(0xFF3D4A5C) : const Color(0xCCE5E7EB), width: 1),
          ),
        ),
      ),
    );
  }

  Widget _buildList(bool isDarkMode) {
    final filteredItems = _searchQuery.isEmpty ? widget.items : widget.items.where((item) => item.toLowerCase().contains(_searchQuery.toLowerCase())).toList();

    if (filteredItems.isEmpty) {
      return Center(
        child: Padding(
          padding: appSizer.paddingAll(16),
          child: Text('Bir Hata Oluştu', style: AppFonts.baseSemibold.copyWith(color: AppColors.baseBlack)),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: filteredItems.length,
      separatorBuilder: (context, index) => Divider(height: 1, thickness: 1.19, color: isDarkMode ? const Color(0xFF3D4A5C) : const Color(0x7FE5E7EB)),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => widget.onItemTap(filteredItems[index]),
          child: Container(
            padding: appSizer.paddingSymmetric(horizontal: 16, vertical: 14),
            child: Text(
              filteredItems[index],
              style: appSizer.style(color: isDarkMode ? Colors.white : const Color(0xFF374151), fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        );
      },
    );
  }

  double _calculateHeight(List<String> items, String query) {
    final filteredCount = query.isEmpty ? items.length : items.where((i) => i.toLowerCase().contains(query.toLowerCase())).length;
    if (filteredCount == 0) return 80;

    double height = (filteredCount * 47.0) + ((filteredCount - 1) * 1.19);
    if (items.length > 5) height += 56;

    return height > 280 ? 280 : height;
  }
}
