import SwiftUI

struct ThirdView: View {
    
    @State private var batteryLevel: Float = UIDevice.current.batteryLevel
    @State private var batteryState: UIDevice.BatteryState = UIDevice.current.batteryState
    @State private var simulatedCycleCount: Int = 350
    @State private var cpuPercent: Float = 0
    @State private var isHot: Bool = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Device Dashboard")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            VStack(spacing: 15) {
                Text("Battery Level: \(Int(batteryLevel * 100))%")
                    .font(.title2)
                    .foregroundColor(.blue)
                
                Text("Battery State: \(batteryStateDescription(batteryState))")
                    .font(.title2)
                    .foregroundColor(.green)
                
                Text("Battery Cycle Count: \(simulatedCycleCount)")
                    .font(.title2)
                    .foregroundColor(.orange)
                
                Text(String(format: "CPU Usage: %.1f%%", cpuPercent))
                    .font(.title2)
                    .foregroundColor(.purple)
                
                Text("Device Temperature: \(isHot ? "High 🔥" : "Normal ✅")")
                    .font(.title2)
                    .foregroundColor(isHot ? .red : .green)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15)
        }
        .padding()
        .onAppear {
            UIDevice.current.isBatteryMonitoringEnabled = true
            
            NotificationCenter.default.addObserver(
                forName: UIDevice.batteryLevelDidChangeNotification,
                object: nil,
                queue: .main
            ) { _ in
                batteryLevel = UIDevice.current.batteryLevel
            }
            
            NotificationCenter.default.addObserver(
                forName: UIDevice.batteryStateDidChangeNotification,
                object: nil,
                queue: .main
            ) { _ in
                batteryState = UIDevice.current.batteryState
            }
            
            // Update CPU usage every second
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                cpuPercent = cpuUsage()
                isHot = cpuPercent > 80 || batteryLevel < 0.1 // simple estimate
            }
        }
    }
    
    func batteryStateDescription(_ state: UIDevice.BatteryState) -> String {
        switch state {
        case .unknown: return "Unknown"
        case .unplugged: return "Unplugged"
        case .charging: return "Charging"
        case .full: return "Full"
        @unknown default: return "Unknown"
        }
    }
}
import Foundation

func cpuUsage() -> Float {
    var kr: kern_return_t
    var task_info_count: mach_msg_type_number_t

    task_info_count = mach_msg_type_number_t(TASK_INFO_MAX)
    var tinfo = [integer_t](repeating: 0, count: Int(task_info_count))

    kr = task_info(mach_task_self_, task_flavor_t(TASK_BASIC_INFO), &tinfo, &task_info_count)
    if kr != KERN_SUCCESS {
        return -1
    }

    var thread_list: thread_act_array_t?
    var thread_count: mach_msg_type_number_t = 0
    defer {
        if let thread_list = thread_list {
            vm_deallocate(mach_task_self_, vm_address_t(bitPattern: thread_list), vm_size_t(thread_count))
        }
    }

    kr = task_threads(mach_task_self_, &thread_list, &thread_count)
    if kr != KERN_SUCCESS {
        return -1
    }

    var tot_cpu: Float = 0

    if let thread_list = thread_list {
        for i in 0..<Int(thread_count) {
            var thinfo = thread_basic_info()
            var thread_info_count = mach_msg_type_number_t(THREAD_INFO_MAX)
            let result = withUnsafeMutablePointer(to: &thinfo) {
                $0.withMemoryRebound(to: integer_t.self, capacity: Int(thread_info_count)) {
                    thread_info(thread_list[i], thread_flavor_t(THREAD_BASIC_INFO), $0, &thread_info_count)
                }
            }
            if result == KERN_SUCCESS {
                if (thinfo.flags & TH_FLAGS_IDLE) == 0 {
                    tot_cpu += Float(thinfo.cpu_usage) / Float(TH_USAGE_SCALE) * 100.0
                }
            }
        }
    }
    return tot_cpu
}
