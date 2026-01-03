===============
  TITLE
===============

The document describes how to support Realtek Bluetooth USB driver in Linux system.

===============
  REQUIREMENT
===============

The supported kernel version is 2.6.32 - 5.7.1

=============================
  QUICKLY INSTALL AUTOMATICALLY
=============================

  $ sudo make install

===============
  FOR USB I/F
===============

-Installation

  1. Build and install USB driver, change to the driver direcotory
   $ cd usb
   $ sudo make install

  2. Copy the right FW file and config file to the correct path.
   $ sudo cp rtkbt-firmware/lib/firmware/rtl8xxxxx_fw /lib/firmware/
   $ sudo cp rtkbt-firmware/lib/firmware/rtl8xxxxx_config /lib/firmware/

   NOTE: PLEASE REFER THE FORWARD SECTION OF FILENAME LIST TO CORRESPONDE THE FW FILENAME AND THE CONFIG FILENAME WITH THE CHIP.
	   
  3. Insert Realtek Bluetooth dongle
    Check LMP subversion by the following command
    $ hciconfig -a

    Now RTK chip can be recognized by the system and bluetooth function can be used.

-Uninstallation
   $ sudo make uninstall

===============	
  FILENAME LIST
===============

Note: Only USB interface chips are listed. UART variants have been removed.
	
Chip		I/F 		FW/Config Path		FW Filename		Config Filename
		for
		BT driver
------------------------------------------------------------------------------------------------
RTL8761AUV	USB		/lib/firmware/		rtl8761au_fw		rtl8761a_config

RTL8761AW 	USB		/lib/firmware/		rtl8761aw_fw		rtl8761aw_config
(RTL8761AW 
+RTL8192EU)	

RTL8761AUV      USB		/lib/firmware/		rtl8761au8192ee_fw	rtl8761a_config
+RTL8192EE
 
RTL8761AUV	USB		/lib/firmware/		rtl8761au8192ee_fw	rtl8761a_config
+RTL8812AE
 
-----------------------------------------------------------------------------------------------

RTL8761BUV	USB		/lib/firmware/		rtl8761bu_fw		rtl8761bu_config

-----------------------------------------------------------------------------------------------

RTL8725AU	USB		/lib/firmware/		rtl8725au_fw		rtl8725au_config

-----------------------------------------------------------------------------------------------

RTL8723BU	USB		/lib/firmware/		rtl8723b_fw		rtl8723b_config
RTL8723BE

-----------------------------------------------------------------------------------------------

RTL8821AU	USB		/lib/firmware/		rtl8821a_fw		rtl8821a_config
RTL8821AE

-----------------------------------------------------------------------------------------------

RTL8822BU	USB		/lib/firmware/		rtl8822bu_fw		rtl8822bu_config
RTL8822BE

-----------------------------------------------------------------------------------------------

RTL8723DU	USB		/lib/firmware/		rtl8723du_fw		rtl8723du_config
RTL8723DE

-----------------------------------------------------------------------------------------------

RTL8821CU	USB		/lib/firmware/		rtl8821cu_fw		rtl8821cu_config
RTL8821CE

-----------------------------------------------------------------------------------------------

RTL8822CU	USB		/lib/firmware/		rtl8822cu_fw		rtl8822cu_config
RTL8822CE

-----------------------------------------------------------------------------------------------

RTL8723FU	USB		/lib/firmware/		rtl8723fu_fw		rtl8723fu_config
RTL8723FE

-----------------------------------------------------------------------------------------------

RTL8852AU	USB		/lib/firmware/		rtl8852au_fw		rtl8852au_config
RTL8852AE

-----------------------------------------------------------------------------------------------
