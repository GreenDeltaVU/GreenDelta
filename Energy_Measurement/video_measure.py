import subprocess
import time
import sys
import psutil
import pyautogui

from get_process_id import get_pid_with_highest_resource_usage

# Constants for sleep durations
SHORT_SLEEP = 2
MEDIUM_SLEEP = 5
LONG_SLEEP = 20


def start_app_meeting(app_name, meeting_id_or_url, passcode=None):
    """Start an app meeting and monitor its resource usage."""
    if app_name == "zoom":
        meeting_cmd = f"zoommtg://zoom.us/join?action=join&confno={meeting_id_or_url}"
    elif app_name == "skype":
        meeting_cmd = meeting_id_or_url
        subprocess.Popen([app_name])
    elif app_name == "rocketchat":
        meeting_cmd = meeting_id_or_url
        subprocess.Popen(["rocketchat-desktop"])
        time.sleep(3)
    else:
        print(f"Unsupported app: {app_name}")
        return

    subprocess.Popen(["xdg-open", meeting_cmd])
    time.sleep(MEDIUM_SLEEP)  # Wait for the app window to open

    # Simulate keyboard input to enter the passcode for Zoom
    if passcode:
        subprocess.run(["xdotool", "type", passcode])
        subprocess.run(["xdotool", "key", "Return"])

    try:
        time.sleep(LONG_SLEEP)  # Wait for the app window to open

        app_pid = get_pid_with_highest_resource_usage(app_name)
        if app_pid is not None:
            print(f"{app_name} meeting with the highest resource consumption is running with PID: {app_pid}")
        else:
            print(f"No {app_name} meeting is running.")
        time.sleep(SHORT_SLEEP)
        print(f"{app_name} process started with PID: {app_pid}")
    
        # Number of experiment iterations 
        for i in range(2):
            try:
                powerjoular_command = f'echo " " | sudo -S -k timeout 300 powerjoular -l -p {app_pid} -f {app_name}_video_energy.csv'
                subprocess.run(powerjoular_command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
            except subprocess.CalledProcessError:
                print("Finish measurement")
            except Exception as e:
                print(f"Subprocess returned a non-zero exit status: {e}")

            print("------")
            print(app_pid)
            time.sleep(SHORT_SLEEP)
            if i == 1:  # If it's in the last iteration
                if app_name == "rocketchat":
                    subprocess.Popen(["pkill", "firefox"])
                    time.sleep(3)
                print("last iteration")
                subprocess.Popen(["pkill", app_name])
                time.sleep(SHORT_SLEEP)
    except KeyboardInterrupt:
        print("Measurement interrupted.")


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python start_app_meeting.py APP_NAME MEETING_ID_OR_URL [PASSCODE]")
    else:
        start_app_meeting(sys.argv[1], sys.argv[2], sys.argv[3] if len(sys.argv) > 3 else None)
