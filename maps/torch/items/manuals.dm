/obj/item/book/manual/solgov_law
	name = "Sol Central Government Law"
	desc = "A brief overview of SolGov Law."
	icon_state = "bookSolGovLaw"
	author = "The Sol Central Government"
	title = "Sol Central Government Law"

/obj/item/book/manual/solgov_law/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wiki_url]/index.php?title=Sol_Central_Government_Law" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}


/obj/item/book/manual/military_law
	name = "The Sol Code of Military Justice"
	desc = "A brief overview of military law."
	icon_state = "bookSolGovLaw"
	author = "The Sol Central Government"
	title = "The Sol Code of Military Justice"

/obj/item/book/manual/military_law/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wiki_url]/index.php?title=Sol_Code_of_Uniform_Justice" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/book/manual/sol_sop
	name = "Standard Operating Procedure"
	desc = "SOP aboard the UGN Titen."
	icon_state = "booksolregs"
	author = "The Rocknall Corporation"
	title = "Standard Operating Procedure"

/obj/item/book/manual/sol_sop/Initialize()
	. = ..()
	dat = {"

		<html><head>
		</head>

		<body>
		<iframe width='100%' height='97%' src="[config.wiki_url]/index.php?title=Standard_Operating_Procedure" frameborder="0" id="main_frame"></iframe>
		</body>

		</html>

		"}

/obj/item/material/folder/nt/rd

/obj/item/material/folder/envelope/preset/captain
	desc = "A thick envelope. The UGN crest is stamped in the corner, along with 'TOP SECRET - TITEN GAMMA'."

/obj/item/material/folder/envelope/preset/captain/Initialize()
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/item/material/folder/envelope/preset/captain/LateInitialize(mapload)
	var/obj/overmap/visitable/torch = map_sectors["[z]"]
	var/memo = {"
	<tt><center><b>[SPAN_COLOR("red", "SECRET - CODE WORDS: TORCH")]</b>
	<h3>UNITED GALACTIC NATIONS COMMAND</h3>
	<img src = sollogo.png>
	</center>
	<b>FROM:</b> ADM Clark Nexov<br>
	<b>TO:</b> Commanding Officer of UGN Titen<br>
	<b>SUBJECT:</b> Standing Orders<br>
	<hr>
	Captain.<br>
	Your orders are to visit the following star systems. Keep in mind that your supplies are limited; ration exploration time accordingly.
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[GLOB.using_map.system_name]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<li>[generate_system_name()]</li>
	<br>
	Priority targets are artifacts of uncontacted alien species and signal sources of unknown origin.<br>
	None of these systems are claimed by any entity recognized by the SCG, so you have full salvage rights on any derelicts discovered.<br>
	Investigate and mark any prospective colony worlds as per usual procedures.<br>
	There is no UGN presence in that area. In case of distress calls, you will be the only vessel available; do not ignore them. We cannot afford any more PR backlash.<br>
	The current docking code is: [torch.docking_codes]<br>
	Report all findings via bluespace comm buoys during inter-system jumps.<br>

	<i>ADM Nexov.</i></tt>
	<i>This paper has been stamped with the stamp of UGN Expeditionary Command.</i>
	"}
	new/obj/item/paper(src, memo, "Standing Orders")
	new/obj/item/paper/umbra(src)

/obj/item/material/folder/envelope/preset/rep
	desc = "A thick envelope. The UGN crest is stamped in the corner, along with 'TOP SECRET - TITEN GAMMA'."
	seal_stamp = "General Secretary rubber stamp"

/obj/item/material/folder/envelope/preset/rep/Initialize()
	. = ..()
	new/obj/item/paper/umbra(src)

/obj/item/paper/umbra
	name = "GAMMA Protocol"
	info = {"
	<tt><center><b><span style='color: red'>TOP SECRET READ ONLY IN EMERGENCY - CODE WORDS: TITEN GAMMA</span></b>
	<h3>OFFICE OF THE SECRETARY OF INFORMATION SAFETY</h3>
	<img src = sollogo.png>
	</center>
	<b>FROM:</b> Edward Cooran, Secretary of Information Safety<br>
	<b>TO:</b> Commanding Officer of the SEV Torch<br>
	<b>CC:</b> Special Representative aboard the SEV Torch<br>
	<b>SUBJECT:</b> GAMMA protocol<br>
	<hr>
	In the event you are reading this the Titen is in peril. This is a contingency procedure to ensure classified data stays safe. This may seem quite unconventinal but our data cannot be allowed to fall into
	the Union's hands.
	<li>Firstly after reading this, DESTROY ALL DOCUMENTATION, including this paper.
	<li>Secondly, prime self destruct systems using the provided nuclear disk
	<li>Thirdly, deploy an emergency distress beacon
	<li>Finally, guide all personeel to safe bunkers across the ship, stay put and make sure to set the self destruct to at least 20 minutes to allow ample time for the crew to board a rescue boat.
	I do understand that you may not want to lose the Titen, but the Galactic Nations safety is more important than a ship.
	This contingency protocol will be activated when a UGN representative says so.
	Violators of this protocol may and should be shot on sight by peacekeepers.
	If this code is initiated immedietly change the alert level to Delta by contacting your nearest UGN representative.
	The UGN takes information safety VERY seriously, any confidental information will be your responsibility to contain and destroy.
	Finally, do NOT share this document with anyone else, and ensure the crew have no knowledge of the initiation of Protocol GAMMA.
	If staff attempt to leak this information, terminate them immedietly.


	<i>Regards, Edward.</i></tt>
	<i>This paper has been stamped with the stamp of Department of Information Safety.</i>
	"}

/obj/item/paper/newrust
	name = "note - RUST Wiring Updates (Mandatory Reading)"
	info = {"
	<div style="text-align: center;">
<h1>RUST Wiring Updates</h1>
</div>
<h2></h2>
<p>Boys at the Observatory decided to upgrade the wiring of our fusion engine room. To adapt, we will need to adjust our normal procedures.</p>
<ul>
<li>You do NOT need to bypass the SMES in this antechamber. It is no longer irrelevant, it is the only thing separating RUST output from the main power grid.</li>
<li>If you are running a standard setup, you SHOULD NOT run the gyrotron after the Hydrogen to Helium reaction starts. This was always a bad idea, as it isn't necessary and the gyrotron will eat 1.25 MW of power at the highest settings, but now it is on a subgrid that will struggle if that much power is being drained constantly.</li>
</ul>
<p><i>Chief Petty Officer Meng Jiao</i></p>
"}
/obj/item/material/folder/envelope/preset/rep
	desc = "A thick envelope. The UGN crest is stamped in the corner, along with 'TOP SECRET- URC PROTOCOL'."
	seal_stamp = "General Secretary rubber stamp"

/obj/item/paper/united_rocknall_procedure
	name = "United Rocknall Procedure"
	info = {"
	<tt><center><b><span style='color: red'>TOP SECRET- URC EMERGENCY CODE</span></b></tt>
	<h3>UNITED ROCKNALL ADMINISTRATIVE AFFAIRS DEPARTMENT</h3>
	<img src = sollogo.png>
	</center>
	<b>FROM:</b> Henry Forn, Chief of Administrative Affairs<br>
	<b>TO:</b> Sci-Med Officer<br>
	<b>CC:</b> Medical Administrator's Office<br>
	<b>SUBJECT:</b> United Rocknall Operating and Emergency procedure<br>
	<hr>
	Good Day Administrator,
	This is quite a large piece of documentation so please take your time to read through it.
	You are an Administrator of the United Rocknall Corporation, correct?
	If not, burn this document and halt reading.
	If so, continue reading.
	I am Henry Forn, Chief of Administrative Affairs of the United Rocknall Corporation.
	This is the standard operating procedure for the United Rocknall Corporation's administrative staff.
	<li>Ensure xenobiological life stays at the bottom of the URC command chain.
	<li>Always stay in uniform, violations of this rule may be on the grounds of a demotion
	<li>Act presentable, please know what you are doing
	Once you have read those, you are ready for the emergency procedure.
	In the event of a terrible accident onboard the ship, please secure all data before it is destroyed.
	In this case, you MAY acquire a weapon from security, please refrence the Standard Operating Procedure if they do not comply.
	DO NOT let the data fall into any hands other than your own or the other administrator's.
	In the case individuals of the URC or any other department take data, you are given authorization to terminate their lives.
	Make your way to the nearest URC owned shuttle, xenos last to board, and take off to the stars.
	Remember: This is only to be used in situations where code delta has been invoked.
	If members of the URC do not comply, show them this document, and they will.
	With the exception of xenos of course.
	See attached document for further information of the United Rocknall Code
	<i>Regards, Forn.</i></tt>
	<i>This paper has been stamped with the stamp of The United Rocknall Corporation.</i>
	"}
