require stream

drvAsynIPPortConfigure("DEVICE", "$(DEVICE_ADDRESS):${DEVICE_PORT}", 0, 0, 1)

dbLoadTemplate("$(E3_CMD_TOP)/default.sub", "PORT=DEVICE")

