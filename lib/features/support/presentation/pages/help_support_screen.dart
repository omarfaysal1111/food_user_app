import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

enum SupportMessageType { text, image, video }

class SupportChatMessage {
  const SupportChatMessage({
    required this.id,
    required this.type,
    required this.isMine,
    required this.createdAt,
    this.text,
    this.file,
  });

  final String id;
  final SupportMessageType type;
  final String? text;
  final XFile? file;
  final bool isMine;
  final DateTime createdAt;
}

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  static const _headerContentHeight = 68.0;
  static const _composerTopPadding = 20.0;
  static const _composerHorizontalPadding = 16.0;
  static const _composerBottomPadding = 20.0;
  static const _messageHorizontalPadding = 16.0;

  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final _picker = ImagePicker();
  late List<SupportChatMessage> _messages;

  @override
  void initState() {
    super.initState();
    _messages = _initialMessages();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  List<SupportChatMessage> _initialMessages() {
    final fixedTime = DateTime(2026, 1, 1, 14, 20);

    return [
      SupportChatMessage(
        id: 'support-good-evening',
        type: SupportMessageType.text,
        text: 'supportGoodEvening',
        isMine: false,
        createdAt: fixedTime,
      ),
      SupportChatMessage(
        id: 'support-how-help',
        type: SupportMessageType.text,
        text: 'supportHowCanWeHelp',
        isMine: false,
        createdAt: fixedTime,
      ),
      SupportChatMessage(
        id: 'user-sample-issue',
        type: SupportMessageType.text,
        text: 'supportSampleUserIssue',
        isMine: true,
        createdAt: fixedTime,
      ),
    ];
  }

  void _appendMessage(SupportChatMessage message) {
    setState(() {
      _messages = [..._messages, message];
    });
    _scrollToBottom();
  }

  void _sendText() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    // TODO: Replace local append with support chat send-message API.
    _appendMessage(
      SupportChatMessage(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        type: SupportMessageType.text,
        text: text,
        isMine: true,
        createdAt: DateTime.now(),
      ),
    );
    _controller.clear();
  }

  Future<void> _pickImage() async {
    FocusManager.instance.primaryFocus?.unfocus();

    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (!mounted || file == null) return;

    // TODO: Upload selected image through the support attachment API.
    _appendMessage(
      SupportChatMessage(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        type: SupportMessageType.image,
        file: file,
        isMine: true,
        createdAt: DateTime.now(),
      ),
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground(context),
        body: Column(
          children: [
            _SupportChatHeader(title: l10n.supportChatTitle),
            Expanded(
              child: ListView(
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsetsDirectional.fromSTEB(
                  _messageHorizontalPadding,
                  20,
                  _messageHorizontalPadding,
                  24,
                ),
                children: [
                  _DateSeparator(label: l10n.supportToday),
                  const SizedBox(height: 20),
                  _SupportMessageGroup(
                    messages: _messages.where((m) => !m.isMine).toList(),
                    resolveText: _resolveMessageText,
                  ),
                  const SizedBox(height: 12),
                  for (final message in _messages.where((m) => m.isMine))
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _ChatMessageBubble(
                        message: message,
                        text: _resolveMessageText(message),
                      ),
                    ),
                ],
              ),
            ),
            _SupportComposer(
              controller: _controller,
              onSend: _sendText,
              onAttach: _pickImage,
            ),
          ],
        ),
      ),
    );
  }

  String _resolveMessageText(SupportChatMessage message) {
    final l10n = AppLocalizations.of(context)!;

    return switch (message.text) {
      'supportGoodEvening' => l10n.supportGoodEvening,
      'supportHowCanWeHelp' => l10n.supportHowCanWeHelp,
      'supportSampleUserIssue' => l10n.supportSampleUserIssue,
      final text? => text,
      null => '',
    };
  }
}

class _SupportChatHeader extends StatelessWidget {
  const _SupportChatHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final topSafe = MediaQuery.of(context).padding.top;

    return SizedBox(
      height: topSafe + _HelpSupportScreenState._headerContentHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: AppColors.primary,
            child: Opacity(
              opacity: 0.60,
              child: Image.asset(
                AppAssets.supportHeaderPattern,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          PositionedDirectional(
            start: 16,
            end: 16,
            top: topSafe,
            bottom: 20,
            child: Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => context.pop(),
                    child: const SizedBox(
                      width: 28,
                      height: 28,
                      child: Icon(
                        Icons.chevron_left_rounded,
                        color: AppColors.text,
                        size: 28,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: AppTextStyles.primaryButtonLabel.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DateSeparator extends StatelessWidget {
  const _DateSeparator({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: AppTextStyles.caption(context).copyWith(
        color: AppColors.paragraph(context),
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.3,
      ),
    );
  }
}

class _SupportMessageGroup extends StatelessWidget {
  const _SupportMessageGroup({
    required this.messages,
    required this.resolveText,
  });

  final List<SupportChatMessage> messages;
  final String Function(SupportChatMessage message) resolveText;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) return const SizedBox.shrink();

    return Align(
      alignment: Alignment.centerLeft,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                AppAssets.supportAgentIcon,
                width: 16,
                height: 16,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final message in messages)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: _ChatMessageBubble(
                      message: message,
                      text: resolveText(message),
                    ),
                  ),
                _MessageTime(time: _formatTime(messages.last.createdAt)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatMessageBubble extends StatelessWidget {
  const _ChatMessageBubble({required this.message, required this.text});

  final SupportChatMessage message;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isMine = message.isMine;

    final bubble = Column(
      crossAxisAlignment: isMine
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: isMine
                ? AppColors.border(context).withValues(alpha: 0.35)
                : AppColors.error.withValues(alpha: 0.10),
            borderRadius: _bubbleRadius(isMine),
          ),
          child: _MessageContent(message: message, text: text),
        ),
        if (isMine) ...[
          const SizedBox(height: 4),
          _MessageTime(time: _formatTime(message.createdAt)),
        ],
      ],
    );

    if (isMine) {
      return Align(
        alignment: Alignment.centerRight,
        child: Directionality(textDirection: TextDirection.ltr, child: bubble),
      );
    }

    return bubble;
  }

  BorderRadius _bubbleRadius(bool isMine) {
    if (isMine) {
      return const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
        bottomLeft: Radius.circular(12),
      );
    }

    return const BorderRadius.only(
      topLeft: Radius.circular(12),
      topRight: Radius.circular(12),
      bottomRight: Radius.circular(12),
    );
  }
}

class _MessageContent extends StatelessWidget {
  const _MessageContent({required this.message, required this.text});

  final SupportChatMessage message;
  final String text;

  @override
  Widget build(BuildContext context) {
    return switch (message.type) {
      SupportMessageType.text => _TextMessageContent(text: text),
      SupportMessageType.image => _ImageMessageContent(file: message.file),
      SupportMessageType.video => _VideoMessageContent(message: message),
    };
  }
}

class _TextMessageContent extends StatelessWidget {
  const _TextMessageContent({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 220),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: AppTextStyles.caption(context).copyWith(
            color: AppColors.onSurface(context),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}

class _ImageMessageContent extends StatelessWidget {
  const _ImageMessageContent({required this.file});

  final XFile? file;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (file == null) {
      return _TextMessageContent(text: l10n.supportImageMessage);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.file(
        File(file!.path),
        width: 180,
        height: 140,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _VideoMessageContent extends StatelessWidget {
  const _VideoMessageContent({required this.message});

  final SupportChatMessage message;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final fileName = message.text ?? l10n.supportVideoMessage;

    return Container(
      width: 220,
      padding: const EdgeInsetsDirectional.all(12),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: AppColors.text,
              size: 24,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              fileName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: AppTextStyles.caption(context).copyWith(
                color: AppColors.onSurface(context),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageTime extends StatelessWidget {
  const _MessageTime({required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Text(
      time,
      style: AppTextStyles.caption(context).copyWith(
        color: AppColors.paragraph(context),
        fontSize: 8,
        fontWeight: FontWeight.w400,
        height: 1.25,
      ),
    );
  }
}

class _SupportComposer extends StatelessWidget {
  const _SupportComposer({
    required this.controller,
    required this.onSend,
    required this.onAttach,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final Future<void> Function() onAttach;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bottomSafe = MediaQuery.of(context).padding.bottom;

    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.fromSTEB(
        _HelpSupportScreenState._composerHorizontalPadding,
        _HelpSupportScreenState._composerTopPadding,
        _HelpSupportScreenState._composerHorizontalPadding,
        bottomSafe + _HelpSupportScreenState._composerBottomPadding,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2C2B2B).withValues(alpha: 0.08),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.ltr,
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextField(
                controller: controller,
                textAlign: TextAlign.start,
                cursorColor: AppColors.cursor(context),
                minLines: 1,
                maxLines: 1,
                style: AppTextStyles.inputText(
                  context,
                ).copyWith(fontSize: 12, height: 1.3),
                decoration: InputDecoration(
                  hintText: l10n.supportInputHint,
                  hintStyle: AppTextStyles.inputHint(context).copyWith(
                    color: AppColors.paragraph(context),
                    fontSize: 12,
                    height: 1.3,
                  ),
                  filled: true,
                  fillColor: AppColors.surfaceCard(context),
                  contentPadding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.border(context),
                      width: 0.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.border(context),
                      width: 0.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.fieldFocusBorder(context),
                      width: 0.5,
                    ),
                  ),
                ),
                onSubmitted: (_) => onSend(),
              ),
            ),
          ),
          const SizedBox(width: 16),
          _ComposerIconButton(
            onTap: onAttach,
            child: SvgPicture.asset(
              AppAssets.supportAttachmentIcon,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                AppColors.paragraph(context),
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 8),
          _ComposerIconButton(
            onTap: onSend,
            child: SvgPicture.asset(
              AppAssets.supportSendIcon,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class _ComposerIconButton extends StatelessWidget {
  const _ComposerIconButton({required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.surfaceCard(context),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.border(context), width: 0.5),
        ),
        child: child,
      ),
    );
  }
}

String _formatTime(DateTime time) {
  final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
  final minute = time.minute.toString().padLeft(2, '0');
  final suffix = time.hour >= 12 ? 'PM' : 'AM';
  return '${hour.toString().padLeft(2, '0')}:$minute$suffix';
}
