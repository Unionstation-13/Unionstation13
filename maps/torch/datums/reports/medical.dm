/datum/computer_file/report/recipient/medical
	logo = "\[solcrest\]"
	form_name = "SCG-MED-00"

/datum/computer_file/report/recipient/medical/incidentreport
	form_name = "SCG-MED-04"
	title = "Medical Incident Report"
	available_on_ntnet = TRUE

/datum/computer_file/report/recipient/medical/incidentreport/generate_fields()
	..()
	add_field(/datum/report_field/simple_text, "Vessel", GLOB.using_map.station_name)
	add_field(/datum/report_field/date, "Date of Incident")
	add_field(/datum/report_field/time, "Time of Incident")
	add_field(/datum/report_field/people/from_manifest, "Patient")
	add_field(/datum/report_field/people/from_manifest, "Attending Physician")
	add_field(/datum/report_field/pencode_text, "Details of Injuries")
	add_field(/datum/report_field/pencode_text, "Details of Treatment")
	add_field(/datum/report_field/pencode_text, "Other Notes")
	add_field(/datum/report_field/text_label/instruction, "By signing below, I affirm that all of the above is factually correct to the best of my knowledge.")
	add_field(/datum/report_field/signature, "Attending Physician's Signature")
	set_access(access_surgery)

/datum/computer_file/report/recipient/medical/checkup
	form_name = "SCG-MED-013b"
	title = "Regular Health Checkup Checklist"
	available_on_ntnet = TRUE

/datum/computer_file/report/recipient/medical/checkup/generate_fields()
	..()
	add_field(/datum/report_field/text_label/instruction, "You would need following equipment for this: stethoscope, health analyzer, penlight.")
	add_field(/datum/report_field/people/from_manifest, "Patient")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/time, "Time")
	add_field(/datum/report_field/simple_text, "Take pulse", "NOT CHECKED")
	add_field(/datum/report_field/simple_text, "Check blood pressure", "NOT CHECKED")
	add_field(/datum/report_field/simple_text, "Listen for heart noises", "NOT CHECKED")
	add_field(/datum/report_field/simple_text, "Listen for lung noises", "NOT CHECKED")
	add_field(/datum/report_field/simple_text, "Ask if they exercise", "NOT CHECKED")
	add_field(/datum/report_field/simple_text, "Ask if they smoke, and how much per day", "NOT CHECKED")
	add_field(/datum/report_field/simple_text, "Check eye reaction to penlight", "NOT CHECKED")
	add_field(/datum/report_field/simple_text, "Ask about any recent radiation exposure", "NOT CHECKED")
	add_field(/datum/report_field/simple_text, "Ask about any recent sickness", "NOT CHECKED")
	add_field(/datum/report_field/pencode_text, "Other Notes")
	add_field(/datum/report_field/signature, "Doctor's Signature")
	set_access(access_edit = access_medical_equip)

/datum/computer_file/report/recipient/medical/autopsy
	form_name = "SCG-MED-015"
	title = "Autopsy Report"
	available_on_ntnet = TRUE

/datum/computer_file/report/recipient/medical/autopsy/generate_fields()
	..()
	add_field(/datum/report_field/simple_text, "Vessel", GLOB.using_map.station_name)
	add_field(/datum/report_field/simple_text, "Patient Name")
	add_field(/datum/report_field/text_label/header, "Death Information")
	add_field(/datum/report_field/date, "Date of Death")
	add_field(/datum/report_field/time, "Time of Death")
	add_field(/datum/report_field/text_label/instruction, "Check yes if the time of death is estimated, no if it is exact.")
	add_field(/datum/report_field/options/yes_no, "Estimated")
	add_field(/datum/report_field/simple_text, "Cause(s) of Death")
	add_field(/datum/report_field/text_label/instruction, "Describe how the patient died.")
	add_field(/datum/report_field/pencode_text, "Death Narrative")
	add_field(/datum/report_field/text_label/instruction, "Describe postmortem handling of the body.")
	add_field(/datum/report_field/pencode_text, "Postmortem Narrative")
	add_field(/datum/report_field/text_label/header, "Doctor Information")
	add_field(/datum/report_field/text_label/instruction, "By signing below, I affirm that all of the above is factually correct to the best of my knowledge.")
	add_field(/datum/report_field/people/from_manifest, "Doctor")
	add_field(/datum/report_field/signature, "Doctor's Signature")
	set_access(access_morgue, access_surgery)

	add_field(/datum/report_field/text_label/instruction, "By signing below, I affirm that I have reviewed all of the above and affirm it is factually correct to the best of my knowledge. If there is no Chief Medical Officer available, this signature may be skipped.")
	var/datum/report_field/cmofield = add_field(/datum/report_field/people/from_manifest, "Chief Medical Officer")
	cmofield.set_access(access_morgue, access_cmo)
	cmofield = add_field(/datum/report_field/signature, "Chief Medical Officer's Signature")
	cmofield.set_access(access_morgue, access_cmo)

/datum/computer_file/report/recipient/medical/medicinerequest
	title = "Medicine Request Form"
	available_on_ntnet = TRUE

/datum/computer_file/report/recipient/medical/medicinerequest/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "Pharmaceutical Request Form")
	add_field(/datum/report_field/text_label/header, "Under Applicable law of the URC Corporation")
	add_field(/datum/report_field/text_label/header, "Questionnaire:")
	add_field(/datum/report_field/simple_text, "What is your name?")
	add_field(/datum/report_field/number, "What is your age?")
	add_field(/datum/report_field/simple_text, "What is your biological sex?")
	add_field(/datum/report_field/options/yes_no, "Are you alone?")
	add_field(/datum/report_field/options/yes_no, "Do you like the URC?")
	add_field(/datum/report_field/options/yes_no, "Are you a xeno?")
	add_field(/datum/report_field/simple_text, "If so, which species?")
	add_field(/datum/report_field/pencode_text, "List any medication allergies:")
	add_field(/datum/report_field/options/yes_no, "Do you have a criminal record against the URC or any of its partner companies?")
	add_field(/datum/report_field/pencode_text, "What medicine would you like?(Do not specify the exact dosage or type, only the objective of it)")
	add_field(/datum/report_field/text_label/header, "\"Remember! The URC takes your privacy very seriously\" -Corporate Review")
	add_field(/datum/report_field/text_label/instruction, "Corporate review is sponsored by the URC")
	add_field(/datum/report_field/signature, "Signature")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/text_label/instruction, "Upon submitting this form, you, the submitter, consent to unreasonable searches and confiscation of personal items if you are to be found using this pharmaceutical for any other reasons than that stated")
	add_field(/datum/report_field/text_label/instruction, "The URC reserves the right to sell, process, or use your data for advertising purposes for clandestine purposes. Your data may be sold to third parties or given to the UGN.")

/datum/computer_file/report/recipient/medical/routinecheckup
	title = "Routine Medical Checkup Form"
	available_on_ntnet = TRUE

/datum/computer_file/report/recipient/medical/routinecheckup/generate_fields()
	..()
	add_field(/datum/report_field/text_label/header, "Routine Medical Checkup Form")
	add_field(/datum/report_field/text_label/header, "Under Applicable law of the URC Corporation")
	add_field(/datum/report_field/text_label/header, "Questionnaire:")
	add_field(/datum/report_field/simple_text, "What is your name?")
	add_field(/datum/report_field/number, "What is your age?")
	add_field(/datum/report_field/simple_text, "What is your biological sex?")
	add_field(/datum/report_field/options/yes_no, "Are you alone?")
	add_field(/datum/report_field/options/yes_no, "Have you been feeling tired recently?")
	add_field(/datum/report_field/options/yes_no, "Do you feel <b>watched</b>?")
	add_field(/datum/report_field/options/yes_no, "Do you feel any continuous pain?")
	add_field(/datum/report_field/options/yes_no, "Have you ever consciously believed that you would be better off dead?")
	add_field(/datum/report_field/options/yes_no, "Have you ever attempted to kill yourself before informing your superiors?")
	add_field(/datum/report_field/options/yes_no, "Are you depressed?")
	add_field(/datum/report_field/options/yes_no, "Have you tried the mental health course? It's free!")
	add_field(/datum/report_field/options/yes_no, "Do you feel in danger (if so, report to the nearest security checkpoint and an officer will give you instructions)?")
	add_field(/datum/report_field/pencode_text, "Why do you believe you were meant to live?")
	add_field(/datum/report_field/options/yes_no, "Have you ever been in a romantic relationship?")
	add_field(/datum/report_field/pencode_text, "List their name(s):")
	add_field(/datum/report_field/options/yes_no, "Do you like the URC?")
	add_field(/datum/report_field/options/yes_no, "Are you a xeno?")
	add_field(/datum/report_field/simple_text, "If so, which species?")
	add_field(/datum/report_field/pencode_text, "List any medication allergies:")
	add_field(/datum/report_field/options/yes_no, "Do you have a criminal record against the URC or any of its partner companies?")
	add_field(/datum/report_field/pencode_text, "What is the purpose of your visit:")
	add_field(/datum/report_field/text_label/header, "\"Remember! The URC takes your privacy (especially your mental health) very seriously\" -Corporate Review")
	add_field(/datum/report_field/text_label/instruction, "Corporate review is sponsored by the URC")
	add_field(/datum/report_field/signature, "Signature")
	add_field(/datum/report_field/date, "Date")
	add_field(/datum/report_field/text_label/instruction, "Upon submitting this form, you, the submitter, consent to unreasonable searches and confiscation of personal items if you are to be found using this pharmaceutical for any other reasons than that stated")
	add_field(/datum/report_field/text_label/instruction, "The URC reserves the right to sell, process, or use your data for advertising purposes for clandestine purposes. Your data may be sold to third parties or given to the UGN.")
