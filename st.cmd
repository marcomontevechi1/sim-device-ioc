require stream

drvAsynIPPortConfigure("DEVICE", "$ADDRESS", 0, 0, 1)

dbLoadRecords("$(E3_CMD_TOP)/default.db", "PORT=DEVICE")
