require dcbreaker,0.1.0
 
#Specify the TCP endpoint and give your 'bus' an arbitrary name eg. "asynstream1".
#drvAsynIPPortConfigure 'port name' 'host:port [protocol]' priority 'disable auto-connect' noProcessEos

drvAsynIPPortConfigure("PORT1","192.168.10.42:502",0,0,1)
#drvAsynIPPortConfigure("PORT1","192.168.1.103:502",0,0,1)

#modbusInterposeConfig(portName, 
#                      linkType,
#                      timeoutMsec,
#                      writeDelayMsec)

modbusInterposeConfig("PORT1",0,2000,0)

#drvModbusAsynConfigure	 'Port name'
#			 'Octet port name' 
#			 'Modbus slave address' 
#			 'Modbus function code' 
#			 'Modbus start address' 
#			 'Modbus length' 
#			 'Data type' 
#			 'Poll time (msec)' 
#			 'PLC type'

drvModbusAsynConfigure(PORT1_DATA, "PORT1", 1, 4, 0, 85, "INT16", 2000, "astrol")
drvModbusAsynConfigure(PORT1_DATA_PARAM, "PORT1", 1, 3, 16, 4, "INT16", 2000, "astrol")

#Load your database defining the EPICS records
dbLoadRecords("dcbreaker.db", "PORT_DATA=PORT1_DATA,PORT_PARAM=PORT1_DATA_PARAM,P=MAG-,DEV=EE-1:")

#asynSetTraceIOMask "PORT1",0,4   # Enable traceIOHex
#asynSetTraceMask "PORT1",0,0x1f     # Enable traceError and traceIODriver

iocInit()

