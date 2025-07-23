import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/domain/entities/push_message.dart';
import 'package:push_app/presentation/blocs/notifications/notifications_bloc.dart';

class PushMessageScreen extends StatelessWidget {
  final String messageId;
  
  const PushMessageScreen({super.key, required this.messageId});

  @override
  Widget build(BuildContext context) {
    final PushMessage? message = context.watch<NotificationsBloc>().getMessageById(
      messageId);
    final textStyles = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Push Message'),
      ),
      body: (message != null)
          ? _PushMessageView(message: message)
          : Center(child: Text('Message not found', style: textStyles.titleMedium),
      )
    );
  }
}

class _PushMessageView extends StatelessWidget {
  final PushMessage message;

  const _PushMessageView({required this.message});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          if (message.imageUrl != null)
            Image.network(message.imageUrl!),
          
          const SizedBox(height: 30),
          Text(message.title, style: textStyles.titleMedium),
          const SizedBox(height: 10),
          Text(message.body),
          const Divider(),
          Text(message.data.toString()),
        ],
      )
    );
  }
}