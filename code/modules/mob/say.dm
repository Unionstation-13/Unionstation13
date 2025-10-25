// Global variables
var/global/say_disabled = 0
var/global/whisper_range = 1
var/global/list/speak_emote = list("says")

/mob/verb/say_verb(message as text)
    set name = "Say"
    set category = "IC"

    if(say_disabled)
        usr << "Speech is currently admin-disabled."
        return

    message = sanitize(message)
    if (!message)
        return

    if(usr && message)
        usr.say(message)

/mob/verb/me_verb(message as text)
    set name = "Me"
    set category = "IC"
    message = sanitize(message)
    if (!message)
        return
    if(use_me)
        usr.emote("me",usr.emote_type,message)
    else
        usr.emote(message)

/mob/verb/whisper_verb(message as text)
    set name = "Whisper"
    set category = "IC"

    if(say_disabled)
        usr << "Speech is currently admin-disabled."
        return

    message = sanitize(message)
    if (!message)
        return

    if(usr && message)
        usr.whisper(message)

/mob/proc/say(message, datum/language/speaking = null, verb="says", alt_name=null, whispering=0)
    if(!message)
        return

    var/rendered = say_quote(message, speaking)
    for(var/mob/M in hearers(7, src))
        M << "[src.name] [rendered], \"[message]\""

/mob/proc/whisper(message, datum/language/speaking = null)
    if(!message)
        return

    var/range = whisper_range
    for(var/mob/M in hearers(range, src))
        M << "[src.name] whispers, \"[message]\""

/mob/proc/say_dead(message)
    communicate(/singleton/communication_channel/dsay, client, message)

/mob/proc/say_understands(mob/other, datum/language/speaking = null)
    if (src.stat == 2)
        return 1

    else if(src.universal_speak || src.universal_understand)
        return 1

    if (!speaking)
        if(!other)
            return 1
        if(other.universal_speak)
            return 1
        if(isAI(src) && ispAI(other))
            return 1
        if (istype(other, src.type) || istype(src, other.type))
            return 1
        return 0

    if(speaking.flags & INNATE)
        return 1

    for(var/datum/language/L in src.languages)
        if(speaking.name == L.name)
            return 1

    return 0

/mob/proc/say_quote(input, datum/language/speaking = null)
    var/ending = copytext(input, length(input))
    if(speaking)
        return speaking.get_spoken_verb(ending)

    var/verb = pick(speak_emote)
    if(verb == "says")
        if(ending == "!")
            verb = pick("exclaims","shouts","yells")
        else if(ending == "?")
            verb ="asks"
    return verb

/mob/proc/say_test(text)
    var/regex/R = regex(@"[^a-zA-Z0-9\s\.\?\!\,\-\']")
    return R.Find(text) == 0

/mob/proc/get_ear()
    return get_turf(src)

/mob/proc/parse_message_mode(message, standard_mode="headset")
    if(length(message) >= 1 && copytext_char(message,1,2) == get_prefix_key(/singleton/prefix/radio_main_channel))
        return standard_mode

    if(length(message) >= 2)
        var/channel_prefix = copytext_char(message, 1 ,3)
        return department_radio_keys[channel_prefix]

    return null

/mob/proc/parse_language(message)
    var/prefix = copytext_char(message,1,2)
    if(length(message) >= 1 && prefix == get_prefix_key(/singleton/prefix/audible_emote))
        return all_languages["Noise"]

    if(length(message) >= 2 && is_language_prefix(prefix))
        var/language_prefix = lowertext(copytext_char(message, 2 ,3))
        var/datum/language/L = language_keys[language_prefix]
        if (can_speak(L))
            return L

    return null
