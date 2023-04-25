import 'package:events_attendance/data/api/model/api_device.dart';
import 'package:events_attendance/domain/model/device.dart';

class DeviceMapper {
  static Device fromApi(
    ApiDevice apiDevice,
  ) {
    return Device(
      id: apiDevice.deviceToken,
      name: apiDevice.deviceName,
      bindingDate: apiDevice.deviceBindingDate,
    );
  }
}
