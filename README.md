# de0nano_lcd
Simple FPGA driver for HD44780 2x16 LCD. 

![1664395390087](https://user-images.githubusercontent.com/110915050/192877981-39ead6aa-eb37-489c-92b3-289f8b7d12bd.jpg)


1. Connect UART module to your USB Port (you can check pins in Quartus Pin Planner).

2. Connect LCD to FPGA (you can check pins in Quartus Pin Planner).

3. Open Matlab

4. Use function write_to_lcd(COM,data). As COM type "COMx" where "x" stands for number of your USB UART Port. As data type message that you want to display on

   LCD. Maximum length of message is 32 characters. You can use following characters:
   
   ![Untitled](https://user-images.githubusercontent.com/110915050/192877569-c5bfb293-a725-4f55-bec2-21dc8755bd1c.png)

