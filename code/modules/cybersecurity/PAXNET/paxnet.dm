/datum/paxnet
	var/connected_devices = list()
	var/nodes = list()
	var/device_num = 1


/datum/paxnet/register(userid, encryptionType)
	connected_devices["device[device_num]"] = encryptionType
	// Is... that it?

/datum/paxnet/setupNODES()
	// IDK. Send a signal or something that all nodes listen to... and then they'll get registered?
