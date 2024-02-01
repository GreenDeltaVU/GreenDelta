# import subprocess
# import time
# import os
# import pandas as pd

# # # measure the energy consumption of a process for the files sent
# # def powerjoular_measurement_function(p_id):
# #     global measurement_running
# #     powerjoular_command = f'echo " " | sudo -S -k powerjoular -l -p {p_id} -f zoom_send_pdf_energy.csv'
# #     powerjoular_process = subprocess.Popen(powerjoular_command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
# #     print('Measurement started')

# #     # Monitor the shared variable to stop the measurement
# #     while measurement_running:
# #         time.sleep(1)

# #     # Terminate the powerjoular process
# #     powerjoular_process.terminate()



# measurement_running = False
# def powerjoular_measurement_function(p_id,app_name,action):
#     global measurement_running
#     temp_filename = f'temp_{p_id}_{app_name}_{action}_energy.csv'
#     powerjoular_command = f'echo " " | sudo -S -k powerjoular -l -p {p_id} -f {temp_filename}'
#     powerjoular_process = subprocess.Popen(powerjoular_command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
#     print('Measurement started')


#    # Wait for the powerjoular command to finish
#     powerjoular_process.wait()


#     while measurement_running:
#         time.sleep(1)

#     # Terminate the powerjoular process
#     powerjoular_process.terminate()
#     print('Measurement stopped')

#     # Calculate the average power consumption
#     df = pd.read_csv(temp_filename)
#     average_total_power = df['Total Power'].mean()
#     average_cpu_power = df['CPU Power'].mean()
#     average_gpu_power = df['GPU Power'].mean()

#     # Write the average power consumption to the final CSV file
#     with open(f'{p_id}_{app_name}_{action}_energy.csv', 'a') as f:
#         f.write(f'{average_total_power},{average_cpu_power},{average_gpu_power}\n')

#     print(f'Average Total Power consumption: {average_total_power} W')
#     print(f'Average CPU Power consumption: {average_cpu_power} W')
#     print(f'Average GPU Power consumption: {average_gpu_power} W')

#     # Delete the temporary CSV file
#     os.remove(temp_filename)
import subprocess
import time
import os
import pandas as pd
from threading import Event

def powerjoular_measurement_function(p_id, app_name, action, stop_measurement_event):
    temp_filename = f'temp_{p_id}_{app_name}_{action}_energy.csv'
    powerjoular_command = f'echo " " | sudo -S -k powerjoular -l -p {p_id} -f {temp_filename}'
    powerjoular_process = subprocess.Popen(powerjoular_command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    print('Measurement started')

    # Wait for the powerjoular command to finish
    powerjoular_process.wait()

    while not stop_measurement_event.is_set():
        time.sleep(1)

    # Terminate the powerjoular process
    powerjoular_process.terminate()
    print('Measurement stopped')

    # Calculate the average power consumption
    df = pd.read_csv(temp_filename)
    average_total_power = df['Total Power'].mean()
    average_cpu_power = df['CPU Power'].mean()
    average_gpu_power = df['GPU Power'].mean()

    # Write the average power consumption to the final CSV file
    with open(f'{p_id}_{app_name}_{action}_energy.csv', 'a') as f:
        f.write(f'{average_total_power},{average_cpu_power},{average_gpu_power}\n')

    print(f'Average Total Power consumption: {average_total_power} W')
    print(f'Average CPU Power consumption: {average_cpu_power} W')
    print(f'Average GPU Power consumption: {average_gpu_power} W')

    # Delete the temporary CSV file
    os.remove(temp_filename)
