import 'package:flutter/material.dart';

void main() {
  runApp(MoneyBotApp());
}

class MoneyBotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoneyBot 💸',
      home: ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String text) {
    setState(() {
      _messages.add("You: $text");
      _messages.add("Bot: ${_getBotResponse(text)}");
      _controller.clear();
    });
  }

  String _getBotResponse(String input) {
    input = input.toLowerCase();
    if (input.contains("budget")) {
      return "📝 Tip: Use the 50/30/20 rule to manage your budget.";
    } else if (input.contains("save")) {
      return "💡 Set auto-transfers to savings after payday.";
    } else if (input.contains("spend")) {
      return "👀 Watch your expenses! Cut one unnecessary item.";
    } else if (input.contains("tip")) {
      return "✅ Check your subscriptions for savings!";
    } else {
      return "🤖 I didn't understand that. Try: budget, save, spend, or tip.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MoneyBot 💸')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) => Text(_messages[index]),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: _sendMessage,
                    decoration: InputDecoration(
                      hintText: 'Ask MoneyBot...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _sendMessage(_controller.text),
                  child: Text('Send'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
