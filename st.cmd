require stream

drvAsynIPPortConfigure("DEVICE", "$ADDRESS", 0, 0, 1)

dbLoadTemplate("$(E3_CMD_TOP)/default.sub", "PORT=DEVICE")
