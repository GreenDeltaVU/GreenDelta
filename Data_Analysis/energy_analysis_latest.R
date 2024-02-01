library(tidyverse)
library(tidyr)
library(writexl)
library(rstatix)
library(car)
library(dplyr)

#loading energy_data
energy_data <- read.csv("all_energy_consumption_latest.csv", colClasses = rep("numeric", 25))
view(energy_data)


############################## ALL CAMERA OFF usage ########################
camera_off <- c("Attempts", "zoom_camera_off_total_power", "skype_camera_off_total_power",
                "element_camera_off_total_power","rocket_camera_off_total_power")
camera_off_all_apps <- energy_data[camera_off]
#view(camera_off_all_apps)
ggplot(camera_off_all_apps, aes(x = Attempts)) +
  geom_line(aes(y = skype_camera_off_total_power, color = "skype_camera_off"), linetype = "solid") +
  geom_line(aes(y = zoom_camera_off_total_power, color = "zoom_camera_off"), linetype = "solid") +
  geom_line(aes(y = element_camera_off_total_power, color = "element_camera_off"), linetype = "solid") +
  geom_line(aes(y = rocket_camera_off_total_power, color = "rocket_camera_off"), linetype = "solid") +
  labs(
    x = "Attempts",
    y = "Camera OFF Energy Consumption (J)",
    color = "Variable",
    title = "Camera OFF energy consumption (J)"
  )

############################## ALL CAMERA ON usage ########################
camera_on <- c("Attempts", "zoom_camera_on_total_power", "skype_camera_on_total_power",
               "element_camera_on_total_power","rocket_camera_on_total_power")
camera_on_all_apps <- energy_data[camera_on]
#view(camera_on_all_apps)
ggplot(camera_on_all_apps, aes(x = Attempts)) +
  geom_line(aes(y = skype_camera_on_total_power, color = "skype_camera_on"), linetype = "solid") +
  geom_line(aes(y = zoom_camera_on_total_power, color = "zoom_camera_on"), linetype = "solid") +
  geom_line(aes(y = element_camera_on_total_power, color = "element_camera_on"), linetype = "solid") +
  geom_line(aes(y = rocket_camera_on_total_power, color = "rocket_camera_on"), linetype = "solid") +
  labs(
    x = "Attempts",
    y = "Camera ON Energy Consumption (J)",
    color = "Variable",
    title = "Camera ON energy consumption (J)"
  )

###################### SKYPE USAGE ################################
selected_columns_for_skype <- c("Attempts", "skype_zip_total_power", "skype_message_total_power", 
                                "skype_image_total_power", "skype_camera_on_total_power",
                                "skype_pdf_total_power", "skype_camera_off_total_power")


skype_table <- energy_data[selected_columns_for_skype]
#view(skype_table)

ggplot(skype_table, aes(x = Attempts)) +
  geom_line(aes(y = skype_zip_total_power, color = "skype_zip_total_power"), linetype = "solid") +
  geom_line(aes(y = skype_message_total_power, color = "skype_message_total_power"), linetype = "solid") +
  geom_line(aes(y = skype_image_total_power, color = "skype_image_total_power"), linetype = "solid") +
  geom_line(aes(y = skype_camera_on_total_power, color = "skype_camera_on_total_power"), linetype = "solid") +
  geom_line(aes(y = skype_pdf_total_power, color = "skype_pdf_total_power"), linetype = "solid") +
  geom_line(aes(y = skype_camera_off_total_power, color = "skype_camera_off_total_power"), linetype = "solid") +
  labs(
    x = "Attempts",
    y = "Energy Consumption (J)",
    color = "Variable",
    title = "Skype energy consumption",
    subtitle = "Energy consumption for all skype usage_scenario (J)"  
  ) 


##################################Zoom USAGE ###################################

selected_columns_for_zoom <- c("Attempts", "zoom_zip_total_power", "zoom_message_total_power",
                               "zoom_image_total_power", "zoom_camera_on_total_power",
                               "zoom_pdf_total_power", "zoom_camera_off_total_power")
zoom_table <- energy_data[selected_columns_for_zoom]
#view(zoom_table)

ggplot(zoom_table, aes(x = Attempts)) +
  geom_line(aes(y = zoom_zip_total_power, color = "zoom_zip_total_power"), linetype = "solid") +
  geom_line(aes(y = zoom_message_total_power, color = "zoom_message_total_power"), linetype = "solid") +
  geom_line(aes(y = zoom_image_total_power, color = "zoom_image_total_power"), linetype = "solid") +
  geom_line(aes(y = zoom_camera_on_total_power, color = "zoom_camera_on_total_power"), linetype = "solid") +
  geom_line(aes(y = zoom_pdf_total_power, color = "zoom_pdf_total_power"), linetype = "solid") +
  geom_line(aes(y = zoom_camera_off_total_power, color = "zoom_camera_off_total_power"), linetype = "solid") +
  labs(
    x = "Attempts",
    y = "Energy Consumption (J)",
    color = "Variable",
    title = "Zoom energy consumption",
    subtitle = "Energy consumption for all zoom usage_scenario (J)"  
  ) 

#################################### ROCKET USAGE ############################

selected_columns_for_rocket <- c("Attempts", "rocket_zip_total_power", "rocket_message_total_power",
                                 "rocket_image_total_power", "rocket_camera_on_total_power", 
                                 "rocket_pdf_total_power", "rocket_camera_off_total_power")
rocket_table <- energy_data[selected_columns_for_rocket]
#view(rocket_table)

ggplot(rocket_table, aes(x = Attempts)) +
  geom_line(aes(y = rocket_zip_total_power, color = "rocket_zip_total_power"), linetype = "solid") +
  geom_line(aes(y = rocket_message_total_power, color = "rocket_message_total_power"), linetype = "solid") +
  geom_line(aes(y = rocket_image_total_power, color = "rocket_image_total_power"), linetype = "solid") +
  geom_line(aes(y = rocket_camera_on_total_power, color = "rocket_camera_on_total_power"), linetype = "solid") +
  geom_line(aes(y = rocket_pdf_total_power, color = "rocket_pdf_total_power"), linetype = "solid") +
  geom_line(aes(y = rocket_camera_off_total_power, color = "rocket_camera_off_total_power"), linetype = "solid") +
  labs(
    x = "Attempts",
    y = "Energy Consumption (J)",
    color = "Variable",
    title = "Rocket.chat energy consumption",
    subtitle = "Energy consumption for all rocket.chat usage_scenario (J)"  
  ) 

########################### Element USAGE #####################
selected_columns_for_element <- c("Attempts", "element_zip_total_power", "element_message_total_power",
                                  "element_image_total_power", "element_camera_on_total_power",
                                  "element_pdf_total_power", "element_camera_off_total_power")

element_table <- energy_data[selected_columns_for_element]
#view(zoom_table)

ggplot(element_table, aes(x = Attempts)) +
  geom_line(aes(y = element_zip_total_power, color = "element_zip_total_power"), linetype = "solid") +
  geom_line(aes(y = element_message_total_power, color = "element_message_total_power"), linetype = "solid") +
  geom_line(aes(y = element_image_total_power, color = "element_image_total_power"), linetype = "solid") +
  geom_line(aes(y = element_camera_on_total_power, color = "element_camera_on_total_power"), linetype = "solid") +
  geom_line(aes(y = element_pdf_total_power, color = "element_pdf_total_power"), linetype = "solid") +
  geom_line(aes(y = element_camera_off_total_power, color = "element_camera_off_total_power"), linetype = "solid") +
  labs(
    x = "Attempts",
    y = "Energy Consumption (J)",
    color = "Variable",
    title = "Element energy consumption",
    subtitle = "Energy consumption for all element usage_scenario (J)"  
  ) 

#Exploring distribution across usage scenario
pdfs_across_apps <- c("Attempts", "skype_pdf_total_power", "zoom_pdf_total_power", "element_pdf_total_power", "rocket_pdf_total_power")

pdfs_across <- energy_data[pdfs_across_apps]
#view(pdfs_across_apps)

ggplot(pdfs_across, aes(x = Attempts)) +
  geom_line(aes(y = skype_pdf_total_power, color = "skype_pdf_total_power"), linetype = "solid") +
  geom_line(aes(y = zoom_pdf_total_power, color = "zoom_pdf_total_power"), linetype = "solid") +
  geom_line(aes(y = element_pdf_total_power, color = "element_pdf_total_power"), linetype = "solid") +
  geom_line(aes(y = rocket_pdf_total_power, color = "rocket_pdf_total_power"), linetype = "solid") +
  labs(
    x = "Attempts",
    y = "Energy Consumption (J)",
    color = "Variable",
    title = "PDF_consumption",
    subtitle = "PDF files energy consumption accross collaborative software application (J)"  
  )

########################### ZIP###########################
zip_across_apps <- c("Attempts", "skype_zip_total_power", "zoom_zip_total_power", "element_zip_total_power", "rocket_zip_total_power")

zip_across <- energy_data[zip_across_apps]
#view(pdfs_across_apps)

ggplot(zip_across, aes(x = Attempts)) +
  geom_line(aes(y = skype_zip_total_power, color = "skype_zip_total_power"), linetype = "solid") +
  geom_line(aes(y = zoom_zip_total_power, color = "zoom_zip_total_power"), linetype = "solid") +
  geom_line(aes(y = element_zip_total_power, color = "element_zip_total_power"), linetype = "solid") +
  geom_line(aes(y = rocket_zip_total_power, color = "rocket_zip_total_power"), linetype = "solid") +
  labs(
    x = "Attempts",
    y = "Energy Consumption (J)",
    color = "Variable",
    title = "Zip_consumption",
    subtitle = "ZIP energy consumption accross collaborative software applications (J)"  
  ) 

############################# IMAGE usage ####################
images_across_apps <- c("Attempts", "skype_image_total_power", "zoom_image_total_power", 
                        "element_image_total_power", "rocket_image_total_power")
image_across <- energy_data[images_across_apps]
#view(images_across_apps)

ggplot(image_across, aes(x = Attempts)) +
  geom_line(aes(y = skype_image_total_power, color = "skype_image_total_power"), linetype = "solid") +
  geom_line(aes(y = zoom_image_total_power, color = "zoom_image_total_power"), linetype = "solid") +
  geom_line(aes(y = element_image_total_power, color = "element_image_total_power"), linetype = "solid") +
  geom_line(aes(y = rocket_image_total_power, color = "rocket_image_total_power"), linetype = "solid") +
  labs(
    x = "Attempts",
    y = "Energy Consumption (J)",
    color = "Variable",
    title = "Images_consumption",
    subtitle = "Image energy consumption accross collaborative software applications (J)"  
  ) 

messages_across_apps <- c("Attempts", "skype_message_total_power", "zoom_message_total_power",
                          "element_message_total_power", "rocket_message_total_power")
message_across <- energy_data[messages_across_apps]
#view(messages_across_apps)

ggplot(message_across, aes(x = Attempts)) +
  geom_line(aes(y = skype_message_total_power, color = "skype_message_total_power"), linetype = "solid") +
  geom_line(aes(y = zoom_message_total_power, color = "zoom_messsage_total_power"), linetype = "solid") +
  geom_line(aes(y = element_message_total_power, color = "element_message_total_power"), linetype = "solid") +
  geom_line(aes(y = rocket_message_total_power, color = "rocket_message_total_power"), linetype = "solid") +
  labs(
    x = "Attempts",
    y = "Energy Consumption (J)",
    color = "Variable",
    title = "Messages_consumption",
    subtitle = "Messages energy consumption accross collaborative software applications (J)"  
  )

############################## Descriptive statistics###############
#pivoting to allow for statistical test.
all_energy_data <- energy_data %>%
  pivot_longer(
    cols = contains("total_power"),
    names_to = "usage_scenario",
    values_to = "energy_consumed"
  )
view(all_energy_data)

#summary statistics of all energy data
consumption_statistics <- all_energy_data %>% 
  group_by(usage_scenario) %>% 
  summarise(
    Total_usage = sum(energy_consumed, na.rm = TRUE),
    average_usage = mean(energy_consumed, 
                         na.rm = TRUE),
    std_dev = sd(energy_consumed, na.rm = TRUE),
    min = min(energy_consumed, na.rm = TRUE),
    quantile1 = quantile(energy_consumed,  0.25, na.rm = TRUE),
    median = median(energy_consumed, na.rm = TRUE),
    quantile3 = quantile(energy_consumed,  0.75, na.rm = TRUE),
    max = max(energy_consumed, na.rm = TRUE)
  ) 
view(consumption_statistics)

file_path <- "cons_statistic.xlsx"
write_xlsx(consumption_statistics, file_path)


####################### Normality checking using density plot###############
# distribution of consumption by usage_scenarios for all applications to check for normality and fitness of data, with density, qq_plot and confirmed by shaprio's test#############################

pdf_distribution <-  all_energy_data %>%
  filter(grepl("pdf", usage_scenario ))  

ggplot(pdf_distribution, aes(energy_consumed, color = usage_scenario))+
  geom_density()+
  labs(
    subtitle = "PDF Energy consumption for all measured applications (J)"  
  ) 
qqnorm(pdf_distribution$energy_consumed,
       main = "Pdf_distribution energy Consumed",
       xlab = "Theoretical Quantiles",
       ylab = "Sample Quantiles")
qqline(pdf_distribution$energy_consumed)

zip_distribution <-  all_energy_data %>%
  filter(grepl("zip", usage_scenario ))  

ggplot(zip_distribution, aes(energy_consumed, color = usage_scenario))+
  geom_density()+
  labs(
    subtitle = "ZIP Energy consumption for all measured applications (J)"  
  )
qqnorm(zip_distribution$energy_consumed,
       main = "zip distribution energy Consumed",
       xlab = "Theoretical Quantiles",
       ylab = "Sample Quantiles")
qqline(zip_distribution$energy_consumed)

image_distribution <-  all_energy_data %>%
  filter(grepl("image", usage_scenario ))  

ggplot(image_distribution, aes(energy_consumed, color = usage_scenario))+
  geom_density()+
  labs(
    subtitle = "Image Energy consumption for all measured applications (J)"  
  ) 
qqnorm(image_distribution$energy_consumed,
       main = "Image distribution energy Consumed",
       xlab = "Theoretical Quantiles",
       ylab = "Sample Quantiles")
qqline(image_distribution$energy_consumed)


messages_distribution <-  all_energy_data %>%
  filter(grepl("message", usage_scenario ))  

ggplot(messages_distribution, aes(energy_consumed, color = usage_scenario))+
  geom_density()+
  labs(
    subtitle = "Message energy consumption for all measured applications (J)"  
  ) 
qqnorm(messages_distribution$energy_consumed,
       main = "Messages distribution energy Consumed",
       xlab = "Theoretical Quantiles",
       ylab = "Sample Quantiles")
qqline(messages_distribution$energy_consumed)


camera_distribution <-  all_energy_data %>%
  filter(grepl("camera_on|camera_off", usage_scenario ))  

ggplot(camera_distribution, aes(energy_consumed, color = usage_scenario))+
  geom_density()+
  labs(
    subtitle = "energy consumption for all camera usage across measured applications (J)"  
  ) 
qqnorm(camera_distribution$energy_consumed,
       main = "camera distribution energy Consumption",
       xlab = "Theoretical Quantiles",
       ylab = "Sample Quantiles")
qqline(camera_distribution$energy_consumed)

camera_ON_distribution <-  all_energy_data %>%
  filter(grepl("camera_on", usage_scenario ))  

ggplot(camera_ON_distribution, aes(energy_consumed, color = usage_scenario))+
  geom_density()+
  labs(
    subtitle = "energy consumption for all camera usage across measured applications (J)"  
  ) 
qqnorm(camera_ON_distribution$energy_consumed,
       main = "camera distribution energy Consumption",
       xlab = "Theoretical Quantiles",
       ylab = "Sample Quantiles")
qqline(camera_ON_distribution$energy_consumed)

camera_OFF_distribution <-  all_energy_data %>%
  filter(grepl("camera_off", usage_scenario ))  

ggplot(camera_OFF_distribution, aes(energy_consumed, color = usage_scenario))+
  geom_density()+
  labs(
    subtitle = "energy consumption for all camera usage across measured applications (J)"  
  ) 
qqnorm(camera_OFF_distribution$energy_consumed,
       main = "camera distribution energy Consumption",
       xlab = "Theoretical Quantiles",
       ylab = "Sample Quantiles")
qqline(camera_OFF_distribution$energy_consumed)


###############confirmation of normality test with shapiro test########################

# normality test with shapiro test to check if energy consumption data is normally distributed
#value of the Shapiro-Wilk Test greater than 0.05, the data is normal. 
#If it is below 0.05, the data significantly deviate from a normal distribution.

camera_on_data <- consumption_statistics %>%
  filter(grepl("camera_on", usage_scenario))
shapiro_cam_on_result <- shapiro.test(camera_on_data$Total_usage)
view(shapiro_cam_on_result)

camera_off_data <- consumption_statistics %>%
  filter(grepl("camera_off", usage_scenario))
shapiro_cam_off_result <- shapiro.test(camera_off_data$Total_usage)
view(shapiro_cam_off_result)

pdfs_data <- consumption_statistics %>%
  filter(grepl("pdf", usage_scenario))
shapiro_pdf_result <- shapiro.test(pdfs_data$Total_usage)
view(shapiro_pdf_result)

zip_data <- consumption_statistics %>%
  filter(grepl("zip", usage_scenario))
shapiro_zip_result <- shapiro.test(zip_data$Total_usage)
view(shapiro_zip_result)

image_data <- consumption_statistics %>%
  filter(grepl("image", usage_scenario))
shapiro_image_result <- shapiro.test(image_data$Total_usage)
view(shapiro_image_result)

message_data <- consumption_statistics %>%
  filter(grepl("message", usage_scenario))
shapiro_message_result <- shapiro.test(message_data$Total_usage)
view(shapiro_message_result)


####################################
##################################### REALATIONSHIP between usage scenario#########################
#visualising relationship between usage scenario and energy consumed
ggplot(all_energy_data, aes(usage_scenario, energy_consumed)) +
  geom_boxplot()+
  labs(
    title = "Relationship between usage_scenario and energy consumption",
    subtitle = "All usage_scenario and their corresponding energy consumption"  
  ) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#Group barplot showing usage_scenario for all collaborative software application measured
group_bar_plot <- consumption_statistics %>%
  mutate(group = case_when(
    grepl("zoom", usage_scenario) ~ "zoom",
    grepl("skype", usage_scenario) ~ "skype",
    grepl("element", usage_scenario) ~ "element",
    grepl("rocket", usage_scenario) ~ "rocket"
  ))
#view(group_bar_plot)

group_bar <- ggplot(group_bar_plot, aes(x = usage_scenario, y = Total_usage, fill = group)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "All applications grouped Bar Plot", x = "applications & usage scenario", y = "Total_usage") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("group_barplot.png", group_bar, width = 6, height = 8, units = "in")

# testing hypothesis for sending messages in Foss and commerical software (foss_massage vs commercial_message)
messages_hyp <- all_energy_data %>%
  select(usage_scenario, energy_consumed) %>% 
  filter(grepl("zoom_message|skype_message|element_message|rocket_message", usage_scenario)) %>% 
  arrange(usage_scenario)
#view(messages_hyp)

# Creating a new grouping variable
msg_hyp <- messages_hyp %>%
  mutate(msg_Group = case_when(
    grepl("zoom_message|skype_message", usage_scenario) ~ "msg_ZoomSkype",
    grepl("element_message|rocket_message", usage_scenario) ~ "msg_ElementRocket"
  )
  )
#view(msg_hyp)

# Perform Welch's t-test
welch_t_test_result <- t.test(
  energy_consumed ~ msg_Group, 
  data = msg_hyp,
  var.equal = FALSE
)
view(welch_t_test_result)

# Extract means and standard deviations
mean_zoomSKype <- mean(
  msg_hyp$energy_consumed
  [msg_hyp$msg_Group == "msg_ZoomSkype"]
)
mean_elementRocket <- mean(
  msg_hyp$energy_consumed
  [msg_hyp$msg_Group == "msg_ElementRocket"]
)

sd_ZoomSkype <- sd(
  msg_hyp$energy_consumed
  [msg_hyp$msg_Group == "msg_ZoomSkype"]
)
sd_ElementRocket <- sd(
  msg_hyp$energy_consumed
  [msg_hyp$msg_Group == "msg_ElementRocket"]
)

# Calculating Cohen's d to asess effect size estimation
pooled_sd <- sqrt((sd_ZoomSkype^2 + sd_ElementRocket^2) / 2)
cohen_d <- (mean_zoomSKype - mean_elementRocket) / pooled_sd

view(cohen_d)

# testing hypothesis for sending images in Foss and commerical software (foss_massage vs commercial_message)
images_hyp <- all_energy_data %>%
  select(usage_scenario, energy_consumed) %>% 
  filter(grepl("zoom_image|skype_image|element_image|rocket_image", usage_scenario)) %>% 
  arrange(usage_scenario)
#view(images_hyp)

# Creating a new grouping variable
images_hyp <- images_hyp %>%
  mutate(img_Group = case_when(
    grepl("zoom_image|skype_image", usage_scenario) ~ "img_ZoomSkype",
    grepl("element_image|rocket_image", usage_scenario) ~ "img_ElementRocket"
  )
  )
#view(images_hyp)

# Performing Welch's t-test
welch_t_test_result <- t.test(
  energy_consumed ~ img_Group, 
  data = images_hyp,
  var.equal = FALSE
)
view(welch_t_test_result)

# Extract means and standard deviations
mean_img_zoomSKype <- mean(
  images_hyp$energy_consumed
  [images_hyp$img_Group == "img_ZoomSkype"]
)

mean_img_elementRocket <- mean(
  images_hyp$energy_consumed
  [images_hyp$img_Group == "img_ElementRocket"]
)

sd_img_ZoomSkype <- sd(
  images_hyp$energy_consumed
  [images_hyp$img_Group == "img_ZoomSkype"]
)
sd_img_ElementRocket <- sd(
  images_hyp$energy_consumed
  [images_hyp$img_Group == "img_ElementRocket"]
)

img_pooled_sd <- sqrt((sd_img_ZoomSkype^2 + sd_img_ElementRocket^2) / 2)
img_cohen_d <- (mean_img_zoomSKype - mean_img_elementRocket) / img_pooled_sd

view(img_cohen_d)


# testing hypothesis for sending ZIP  in FOSS/commerical collaborative software (zip)
zip <- all_energy_data %>%
  select(usage_scenario, energy_consumed) %>% 
  filter(grepl("element_zip|zoom_zip|rocket_zip|skype_zip", usage_scenario)) %>% 
  arrange(usage_scenario)
#view(zip)

# Creating a new grouping variable
zip <- zip %>%
  mutate(zip_Group = case_when(
    grepl("zoom_zip|skype_zip", usage_scenario) ~ "zip_ZoomSkype",
    grepl("element_zip|rocket_zip", usage_scenario) ~ "zip_ElementRocket"
  )
  )
#view(zip)

# Performing Welch's t-test
welch_t_test_result <- t.test(
  energy_consumed ~ zip_Group, 
  data = zip,
  var.equal = FALSE
)
view(welch_t_test_result)

# Extract means and standard deviations
mean_zip_zoomSKype <- mean(
  zip$energy_consumed
  [
    zip$zip_Group == "zip_ZoomSkype"
  ]
)

mean_zip_elementRocket <- mean(
  zip$energy_consumed
  [
    zip$zip_Group == "zip_ElementRocket"
  ]
)

sd_zip_ZoomSkype <- sd(
  zip$energy_consumed
  [
    zip$zip_Group == "zip_ZoomSkype"
  ]
)
sd_zip_ElementRocket <- sd(
  zip$energy_consumed
  [
    zip$zip_Group == "zip_ElementRocket"
  ]
)

zip_pooled_sd <- sqrt((sd_zip_ZoomSkype^2 + sd_zip_ElementRocket^2) / 2)
zip_cohen_d <- (mean_zip_zoomSKype - mean_zip_elementRocket) / zip_pooled_sd

view(zip_cohen_d)

# testing hypothesis for sending PDF in FOSS and commerical collaborative software applications
pdf <- all_energy_data %>%
  select(usage_scenario, energy_consumed) %>% 
  filter(grepl("zoom_pdf|skype_pdf|element_pdf|rocket_pdf", usage_scenario)) %>% 
  arrange(usage_scenario)
#view(pdf)

# Create a new grouping variable
pdf <- pdf %>%
  mutate(pdf_Group = case_when(
    grepl("zoom_pdf|skype_pdf", usage_scenario) ~ "pdf_ZoomSkype",
    grepl("element_pdf|rocket_pdf", usage_scenario) ~ "pdf_ElementRocket"
  )
  )
#view(pdf)

# Performing Welch's t-test
welch_t_test_result <- t.test(
  energy_consumed ~ pdf_Group, 
  data = pdf,
  var.equal = FALSE
)
(welch_t_test_result)

# Extract means and standard deviations
mean_pdf_zoomSKype <- mean(
  pdf$energy_consumed
  [
    pdf$pdf_Group == "pdf_ZoomSkype"
  ]
)

mean_pdf_elementRocket <- mean(
  pdf$energy_consumed
  [
    pdf$pdf_Group == "pdf_ElementRocket"
  ]
)

sd_pdf_ZoomSkype <- sd(
  pdf$energy_consumed
  [
    pdf$pdf_Group == "pdf_ZoomSkype"
  ]
)
sd_pdf_ElementRocket <- sd(
  pdf$energy_consumed
  [
    pdf$pdf_Group == "pdf_ElementRocket"
  ]
)

pdf_pooled_sd <- sqrt((sd_pdf_ZoomSkype^2 + sd_pdf_ElementRocket^2) / 2)
pdf_cohen_d <- (mean_pdf_zoomSKype - mean_pdf_elementRocket) / pdf_pooled_sd


view(pdf_cohen_d)

# testing hypothesis for sending PDF vs ZIP in FOSS and commerical collaborative software applications
zip_pdf <- all_energy_data %>%
  select(usage_scenario, energy_consumed) %>% 
  filter(grepl("pdf|zip", usage_scenario)) %>% 
  arrange(usage_scenario)
#view(pdf)

# Create a new grouping variable
zip_pdf <- zip_pdf %>%
  mutate(zip_pdf_Group = case_when(
    grepl("zip", usage_scenario) ~ "zip",
    grepl("pdf", usage_scenario) ~ "pdf"
  )
  )
#view(zip_pdf)

# Performing Welch's t-test
welch_t_test_result <- t.test(
  energy_consumed ~ zip_pdf_Group, 
  data = zip_pdf,
  var.equal = FALSE
)
view(welch_t_test_result)

# Extract means and standard deviations
mean_zip <- mean(
  zip_pdf$energy_consumed
  [zip_pdf$zip_pdf_Group == "zip"]
)

mean_pdf <- mean(
  zip_pdf$energy_consumed
  [zip_pdf$zip_pdf_Group == "pdf"]
)

sd_zip <- sd(
  zip_pdf$energy_consumed
  [zip_pdf$zip_pdf_Group == "zip"]
)


sd_pdf <- sd(
  zip_pdf$energy_consumed
  [zip_pdf$zip_pdf_Group == "pdf"]
)

zip_pdf_pooled_sd <- sqrt((sd_zip^2 + sd_pdf^2) / 2)
zip_pdf_cohen_d <- (mean_zip - mean_pdf) / zip_pdf_pooled_sd

view(zip_pdf_cohen_d)



# testing hypothesis for sending PDF vs IMG in FOSS and commerical collaborative software applications
pdf_IMG <- all_energy_data %>%
  select(usage_scenario, energy_consumed) %>% 
  filter(grepl("pdf|image", usage_scenario)) %>% 
  arrange(usage_scenario)
#view(pdf)

# Create a new grouping variable
pdf_IMG <- pdf_IMG %>%
  mutate(pdf_img_Group = case_when(
    grepl("pdf", usage_scenario) ~ "pdf",
    grepl("image", usage_scenario) ~ "image"
  )
  )
#view(pdf_IMG)

# Performing Welch's t-test
welch_t_test_result <- t.test(
  energy_consumed ~ pdf_img_Group, 
  data = pdf_IMG,
  var.equal = FALSE
)
view(welch_t_test_result)

# Extract means and standard deviations
mean_Pdf <- mean(
  pdf_IMG$energy_consumed
  [
    pdf_IMG$pdf_img_Group == "pdf"
  ]
)

mean_img <- mean(
  pdf_IMG$energy_consumed
  [
    pdf_IMG$pdf_img_Group == "image"
  ]
)

sd_Pdf <- sd(
  pdf_IMG$energy_consumed
  [
    pdf_IMG$pdf_img_Group == "pdf"
  ]
)


sd_img <- sd(
  pdf_IMG$energy_consumed
  [
    pdf_IMG$pdf_img_Group == "image"
  ]
)

pdf_img_pooled_sd <- sqrt((sd_Pdf^2 + sd_img^2) / 2)
pdf_img_cohen_d <- (mean_Pdf - mean_img) / pdf_img_pooled_sd

view(pdf_img_cohen_d)


#testing hypothesis for camera ON and OFF  in commercial & FOSS collaborative software 
cam_on_off <- all_energy_data %>%
  select(usage_scenario, energy_consumed) %>% 
  filter(grepl("camera_on|camera_off", usage_scenario)) %>% 
  arrange(usage_scenario)
#view(cam_on_off)



# Create a new grouping variable
cam_on_off <- cam_on_off %>%
  mutate(cam_on_off_Group = case_when(
    grepl("camera_on", usage_scenario) ~ "camera_on",
    grepl("camera_off", usage_scenario) ~ "camera_off"
  )
  )
#view(cam_on_off)

# Perform Welch's t-test
welch_t_test_result <- t.test(
  energy_consumed ~ cam_on_off_Group, 
  data = cam_on_off,
  var.equal = FALSE
)
view(welch_t_test_result)

# Extract means and standard deviations
mean_cam_on <- mean(
  cam_on_off$energy_consumed
  [
    cam_on_off$cam_on_off_Group == "camera_on"
  ]
)

mean_cam_off <- mean(
  cam_on_off$energy_consumed
  [
    cam_on_off$cam_on_off_Group == "camera_off"
  ]
)

sd_cam_on <- sd(
  cam_on_off$energy_consumed
  [
    cam_on_off$cam_on_off_Group == "camera_on"
  ]
)


sd_cam_off <- sd(
  cam_on_off$energy_consumed
  [
    cam_on_off$cam_on_off_Group == "camera_off"
  ]
)

cam_on_off_pooled_sd <- sqrt((sd_cam_on^2 + sd_cam_off^2) / 2)
cam_on_off_cohen_d <- (mean_cam_on - mean_cam_off) / cam_on_off_pooled_sd

view(cam_on_off_cohen_d)




