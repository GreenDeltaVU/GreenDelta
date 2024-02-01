import sys

import time
import threading

from coordinates import actions
from send_files_measure import perform_sending_action_actions
from get_process_id import get_pid_with_highest_resource_usage
from messages import message

import subprocess

import os
import pandas as pd
import threading

import pyautogui

# use pyautogui to automate click actions
def perform_sending_action_actions(list_of_coordinates,action, messsage=None):
    global measurement_running
    time.sleep(5)
    """Perform a series of click actions."""
    for j, (x, y) in enumerate(list_of_coordinates):
        time.sleep(5)
        print(f"Going to click at coordinates ({x}, {y})")
        if action == "off_camera":
            if len(list_of_coordinates) - 1 == j and i % 2 == 0:
                pyautogui.click(x=1021, y=705)
                time.sleep(1)
        pyautogui.click(x=x, y=y)
        print("Clicked")

    if messsage != None:
        pyautogui.typewrite(messsage)
        time.sleep(3)
    # Send the message
    pyautogui.press("enter")
    if messsage == None:
        time.sleep(5)
        pyautogui.press("enter")
        if action == "zip":
            time.sleep(3)
        time.sleep(8)
    
    # # Signal the measurement thread to stop
    measurement_running = False
    
# measurement_running = False
def powerjoular_measurement_function(p_id,app_name,action):
    global measurement_running
    temp_filename = f'temp_{p_id}_{app_name}_{action}_energy.csv'
    powerjoular_command = f'echo " " | sudo -S -k powerjoular -l -p {p_id} -f {temp_filename}'
    powerjoular_process = subprocess.Popen(powerjoular_command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    print('Measurement started')


    while measurement_running:
        time.sleep(1)

    # Terminate the powerjoular process
    powerjoular_process.terminate()
    print('Measurement stopped')

    # Calculate the average power consumption
    df = pd.read_csv(temp_filename)
    average_total_power = df['Total Power'].sum()
    average_cpu_power = df['CPU Power'].sum()
    average_gpu_power = df['GPU Power'].sum()

    # Write the average power consumption to the final CSV file
    with open(f'{p_id}_{app_name}_{action}_energy.csv', 'a') as f:
        f.write(f'{average_total_power},{average_cpu_power},{average_gpu_power}\n')

    print(f'Average Total Power consumption: {average_total_power} W')
    print(f'Average CPU Power consumption: {average_cpu_power} W')
    print(f'Average GPU Power consumption: {average_gpu_power} W')

    # Delete the temporary CSV file
    os.remove(temp_filename)


if __name__ == "__main__":

    if len(sys.argv) != 3:
        
        print("Usage: python3 script.py <app_name> <action>")
        sys.exit(1)

    app_name = sys.argv[1]
    action = sys.argv[2]
    # global measurement_running
    for i in range(20):
        # Shared variable to signal the measurement thread to stop
        measurement_running = True
        
        # Open the application
        subprocess.Popen([app_name])
        print('opened: ')
        print(app_name)
        time.sleep(5)
        # Get the application PID and start powerjoular measurement
        p_id = get_pid_with_highest_resource_usage(app_name)

        if p_id is not None:
            print(f"{app_name} meeting with the highest resource consumption is running with PID: {p_id}")
            powerjoular_thread = threading.Thread(
                target=powerjoular_measurement_function, args=(p_id,app_name,action)
            )
            powerjoular_thread.start()
        else:
            print(f"No {app_name} meeting is running.")

        print(f"{app_name}_{action}")
        print(f"{app_name} process started with PID: {p_id}")
        if app_name == "zoom-client":
            app_name = "zoom"
        perform_sending_action_actions(actions[f"{app_name}_{action}"], action, message if action == "message" else None)
        
        print('closing.....')
        
       
        # Wait for the measurement thread to finish
        powerjoular_thread.join()
      
      
        
        if app_name == "rocketchat-desktop":
            pyautogui.click(x=1905, y=44)
            
        else: # Close the application
            time.sleep(120)
            if app_name == "element-desktop":
                pyautogui.click(x=1729, y=9)
                time.sleep(1)
                pyautogui.click(x=1774, y=94)
                print('closeddd')
            if app_name == "zoom-client":
                app_name = "zoom"
            subprocess.Popen([ "pkill", app_name])

        
        time.sleep(2)
      