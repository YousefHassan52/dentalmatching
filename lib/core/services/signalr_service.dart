import 'package:dentalmatching/core/shared/dialogue_without_buttons.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:get/get.dart';

class SignalRService extends GetxService {
  late final HubConnection _hubConnection;

  @override
  void onInit() {
    super.onInit();
    _hubConnection = HubConnectionBuilder()
        .withUrl('https://dentamatchbackend.smartwaveeg.com/notificationHub')
        .withAutomaticReconnect()
        .build();

    _hubConnection.on('ReceiveNotification', _handleReceiveNotification);

    _hubConnection.onreconnecting((exception) {
      print(
          'Connection lost due to error: ${exception.toString()}. Reconnecting...');
    });

    _hubConnection.onreconnected((connectionId) {
      print(
          'Connection successfully reestablished. Connected with connectionId $connectionId.');
    });

    _hubConnection.onclose((exception) {
      print('Connection closed due to error: ${exception.toString()}');
      _startConnection();
    });

    _startConnection();
  }

  void _startConnection() async {
    try {
      await _hubConnection.start();
      print('Connection started successfully');
    } catch (e) {
      print('Error while starting connection: ${e.toString()}');
      Future.delayed(Duration(seconds: 5), () => _startConnection());
    }
  }

  void _handleReceiveNotification(List<Object?>? parameters) {
    final message = parameters?[0] as String?;
    if (message != null) {
      customDialoge(title: "notififca", middleText: message);
    }
  }

  @override
  void onClose() {
    _hubConnection.stop();
    super.onClose();
  }
}
