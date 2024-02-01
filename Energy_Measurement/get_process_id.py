import psutil
import time

# Get the PID of the app process with the highest resource usage
def get_pid_with_highest_resource_usage(app_name):
    if app_name == "skype":
        app_name = "skypeforlinux"
    if app_name == "zoom-client":
        app_name = "zoom"
    processes = []
    # time.sleep(5)
    # Iterate through all running processes
    for process in psutil.process_iter(attrs=["pid", "name", "memory_percent"]):
        if app_name in process.info["name"].lower():
            processes.append(process)

    if not processes:
        return None
    # Filter the process with the highest Memo
    # ry usage(by logic cpu usage is also high)
    highest_memory_usage_process = max(processes, key=lambda process: process.info["memory_percent"])

    return highest_memory_usage_process.info["pid"]