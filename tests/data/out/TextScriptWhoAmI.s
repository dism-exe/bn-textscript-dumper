	text_archive_start

	def_text_script TextScript0_unk0
	ts_mugshot_show mugshot=0x3C
	ts_msg_open
	.string "I CAN'T REMEMBER...\n"
	.string "WHAT I AM..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "BUT,I DO REMEMBER\n"
	.string "HAVING A\n"
	.string "STUBBY TAIL..."
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk10_id

	def_text_script TextScript0_unk1
	ts_mugshot_show mugshot=0x3C
	ts_msg_open
	.string "WHAT AM I AGAIN...?"
	ts_key_wait any=0x0
	ts_clear_msg
	.string "HMM... I KNOW I\n"
	.string "DON'T LIKE\n"
	.string "COLD WATER..."
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk10_id

	def_text_script TextScript0_unk2
	ts_mugshot_show mugshot=0x3C
	ts_msg_open
	.string "MAN,I WISH I KNEW\n"
	.string "WHAT I WAS..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "ALL I REMEMBER\n"
	.string "IS EATING A WHOLE\n"
	.string "COW ONCE..."
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk10_id

	def_text_script TextScript0_unk3
	ts_mugshot_show mugshot=0x3C
	ts_msg_open
	.string "AH,MONSIEUR! I CAN\n"
	.string "NOT REMEMBER..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "IN MY MEMORY,I SEE\n"
	.string "SOMETHING FROM LONG\n"
	.string "AGO..."
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk10_id

	def_text_script TextScript0_unk4
	ts_mugshot_show mugshot=0x3C
	ts_msg_open
	.string "HMM,I SEEM TO HAVE\n"
	.string "FORGOTTEN\n"
	.string "WHAT I AM,BUT..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "I REMEMBER SOME NO-\n"
	.string "BODY SAID I'M A BIT\n"
	.string "SNOBBY. HOW RUDE!"
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk10_id

	def_text_script TextScript0_unk5
	ts_mugshot_show mugshot=0x3C
	ts_msg_open
	.string "MY MEMORY IS A BIT\n"
	.string "FUZZY..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "BUT I'M SURE I'M\n"
	.string "STEADY AS A ROCK."
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk10_id

	def_text_script TextScript0_unk6
	ts_mugshot_show mugshot=0x3C
	ts_msg_open
	.string "I DON'T REMEMBER\n"
	.string "MUCH,YOU KNOW..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "BUT I REMEMBER MY\n"
	.string "LIZARD FRIENDS,\n"
	.string "LIKE SNAP..."
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk10_id

	def_text_script TextScript0_unk7
	ts_mugshot_show mugshot=0x3C
	ts_msg_open
	.string "I'M A WHALE..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "I GOT THAT WRONG,\n"
	.string "DIDN'T I...?"
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk10_id

	def_text_script TextScript0_unk8
	ts_mugshot_show mugshot=0x3C
	ts_msg_open
	.string "IT'S STRANGE THAT\n"
	.string "I'D FORGET,BUT..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "HMM,THE ONE THING\n"
	.string "I DO REMEMBER IS..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "... MY NOSE??"
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk10_id

	def_text_script TextScript0_unk9
	ts_mugshot_show mugshot=0x3C
	ts_msg_open
	.string "I CAN FLY\n"
	.string "HIGH IN THE SKY!\n"
	.string "REALLY!!"
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk10_id

	def_text_script TextScript0_unk10
	ts_mugshot_show mugshot=0x37
	ts_msg_open
	.string "Bring this Program?\n"
	ts_position_option_horizontal width=0x7
	ts_option [
		brackets: 0x0,
		right: 0x1,
		left: 0x1,
		down: 0x0,
		up: 0x0,
	]
	ts_space count=0x1
	.string " Yes  "
	ts_option [
		brackets: 0x0,
		right: 0x0,
		left: 0x0,
		down: 0x1,
		up: 0x1,
	]
	ts_space count=0x1
	.string " No"
	ts_select 0x6, 0x80, 0xFF, 0xFF, 0xFF
	ts_end

	def_text_script TextScript0_unk11
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Sunfish CompTank\""
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk12
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Tropical Fish\n"
	.string " CompTank\""
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk13
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Piranha CompTank\""
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk14
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Nautilus CompTank\""
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk15
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"King Crab CompTank\""
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk16
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Turtle CompTank\""
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk17
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Alligator CompTank\""
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk18
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Dolphin CompTank\""
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk19
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Elephant Seal\n"
	.string " CompTank\""
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk20
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Penguin CompTank\""
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk21
	ts_msg_open
	.string "... OH! I REMEMBER!"
	ts_key_wait any=0x0
	ts_clear_msg
	.string "I'M REALLY A..."
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk22
	ts_msg_open
	.string "... A... I FORGET..."
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk23
	ts_msg_open
	ts_sound_disable_text_sfx
	.string "*BEEP!*"
	ts_wait frames=0x3C
	.string " *BEEP!*"
	ts_wait frames=0x3C
	ts_key_wait any=0x0
	ts_clear_msg
	ts_sound_enable_text_sfx
	.string "ANIMAL MISMATCH!"
	ts_key_wait any=0x0
	ts_clear_msg
	.string "BEGIN DELETION!"
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk24
	ts_flag_set flag=0x5F5
	ts_msg_open
	.string "A SUNFISH! YES,\n"
	.string "THAT'S ME!"
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk25
	ts_flag_set flag=0x5F6
	ts_msg_open
	.string "A TROPICAL FISH!\n"
	.string "BLOOP,BLOOP!"
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk26
	ts_flag_set flag=0x5F7
	ts_msg_open
	.string "A PIRANHA! MAN,\n"
	.string "I CAN'T BELIEVE\n"
	.string "I FORGOT!"
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk27
	ts_flag_set flag=0x5F8
	ts_msg_open
	.string "A NAUTILUS! OUI,OUI!"
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk28
	ts_flag_set flag=0x5F9
	ts_msg_open
	.string "A KING CRAB! THANK\n"
	.string "YOU FOR HELPING,\n"
	.string "PEASANT."
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk29
	ts_flag_set flag=0x5FA
	ts_msg_open
	.string "A TURTLE! AH,MY\n"
	.string "MEMORY IS SLOWLY\n"
	.string "COMING BACK."
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk30
	ts_flag_set flag=0x5FB
	ts_msg_open
	.string "OH,SNAP,\n"
	.string "AN ALLIGATOR!"
	ts_key_wait any=0x0
	ts_clear_msg
	.string "I'M A REPTILE,SO\n"
	.string "THAT'S WHY LIZARDS\n"
	.string "DIG ME!"
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk31
	ts_flag_set flag=0x5FC
	ts_msg_open
	.string "A DOLPHIN!\n"
	.string "*SQUEEK!*"
	ts_key_wait any=0x0
	ts_clear_msg
	.string "... GUESS I'M NOT A\n"
	.string "WHALE,TEE,HEE!"
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk32
	ts_flag_set flag=0x5FD
	ts_msg_open
	.string "AN ELEPHANT SEAL!\n"
	.string "AND ELEPHANTS NEVER\n"
	.string "FORGET... HMPH!"
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk33
	ts_flag_set flag=0x5FE
	ts_msg_open
	.string "A PENGUIN!\n"
	.string "A PENGUIN,I SAY!"
	ts_key_wait any=0x0
	ts_clear_msg
	.string "... OH,THAT MEANS I\n"
	.string "CAN'T REALLY FLY IN\n"
	.string "THE SKY,HUH?"
	ts_key_wait any=0x0
	ts_clear_msg
	.string "*BLUSH*"
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk34
	ts_mugshot_show mugshot=0x3C
	ts_msg_open
	.string "IS THIS MY COMPTANK?\n"
	ts_position_option_horizontal width=0x7
	ts_option [
		brackets: 0x0,
		right: 0x1,
		left: 0x1,
		down: 0x0,
		up: 0x0,
	]
	ts_space count=0x1
	.string " Yes  "
	ts_option [
		brackets: 0x0,
		right: 0x0,
		left: 0x0,
		down: 0x1,
		up: 0x1,
	]
	ts_space count=0x1
	.string " No"
	ts_select 0x6, 0x80, 0xFF, 0xFF, 0xFF
	ts_end

	def_text_script TextScript0_unk35
	ts_check_global [
		variable: 0x0,
		value: 0x0,
		jumpIfEqual: TextScript0_unk11_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x1,
		jumpIfEqual: TextScript0_unk12_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x2,
		jumpIfEqual: TextScript0_unk13_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x3,
		jumpIfEqual: TextScript0_unk14_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x4,
		jumpIfEqual: TextScript0_unk15_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x5,
		jumpIfEqual: TextScript0_unk16_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x6,
		jumpIfEqual: TextScript0_unk17_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x7,
		jumpIfEqual: TextScript0_unk18_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x8,
		jumpIfEqual: TextScript0_unk19_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x9,
		jumpIfEqual: TextScript0_unk20_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0xA,
		jumpIfEqual: TextScript0_unk53_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0xB,
		jumpIfEqual: TextScript0_unk54_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0xC,
		jumpIfEqual: TextScript0_unk55_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_end

	def_text_script TextScript0_unk36
	ts_check_global [
		variable: 0x0,
		value: 0x0,
		jumpIfEqual: TextScript0_unk24_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x1,
		jumpIfEqual: TextScript0_unk25_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x2,
		jumpIfEqual: TextScript0_unk26_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x3,
		jumpIfEqual: TextScript0_unk27_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x4,
		jumpIfEqual: TextScript0_unk28_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x5,
		jumpIfEqual: TextScript0_unk29_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x6,
		jumpIfEqual: TextScript0_unk30_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x7,
		jumpIfEqual: TextScript0_unk31_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x8,
		jumpIfEqual: TextScript0_unk32_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x9,
		jumpIfEqual: TextScript0_unk33_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0xA,
		jumpIfEqual: TextScript0_unk59_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0xB,
		jumpIfEqual: TextScript0_unk60_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0xC,
		jumpIfEqual: TextScript0_unk61_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_end

	def_text_script TextScript0_unk37
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Sunfish CompTank\""
	ts_key_wait any=0x0
	ts_clear_msg
	ts_mugshot_show mugshot=0x3C
	.string "IS THIS MY COMPTANK?\n"
	ts_position_option_horizontal width=0x7
	ts_option [
		brackets: 0x0,
		right: 0x1,
		left: 0x1,
		down: 0x0,
		up: 0x0,
	]
	ts_space count=0x1
	.string " Yes  "
	ts_option [
		brackets: 0x0,
		right: 0x0,
		left: 0x0,
		down: 0x1,
		up: 0x1,
	]
	ts_space count=0x1
	.string " No"
	ts_select 0x6, 0x80, 0xFF, 0xFF, 0xFF
	ts_end

	def_text_script TextScript0_unk38
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Tropical Fish\n"
	.string " CompTank\""
	ts_key_wait any=0x0
	ts_clear_msg
	ts_mugshot_show mugshot=0x3C
	.string "IS THIS MY COMPTANK?\n"
	ts_position_option_horizontal width=0x7
	ts_option [
		brackets: 0x0,
		right: 0x1,
		left: 0x1,
		down: 0x0,
		up: 0x0,
	]
	ts_space count=0x1
	.string " Yes  "
	ts_option [
		brackets: 0x0,
		right: 0x0,
		left: 0x0,
		down: 0x1,
		up: 0x1,
	]
	ts_space count=0x1
	.string " No"
	ts_select 0x6, 0x80, 0xFF, 0xFF, 0xFF
	ts_end

	def_text_script TextScript0_unk39
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Piranha CompTank\""
	ts_key_wait any=0x0
	ts_clear_msg
	ts_mugshot_show mugshot=0x3C
	.string "IS THIS MY COMPTANK?\n"
	ts_position_option_horizontal width=0x7
	ts_option [
		brackets: 0x0,
		right: 0x1,
		left: 0x1,
		down: 0x0,
		up: 0x0,
	]
	ts_space count=0x1
	.string " Yes  "
	ts_option [
		brackets: 0x0,
		right: 0x0,
		left: 0x0,
		down: 0x1,
		up: 0x1,
	]
	ts_space count=0x1
	.string " No"
	ts_select 0x6, 0x80, 0xFF, 0xFF, 0xFF
	ts_end

	def_text_script TextScript0_unk40
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Nautilus CompTank\""
	ts_key_wait any=0x0
	ts_clear_msg
	ts_mugshot_show mugshot=0x3C
	.string "IS THIS MY COMPTANK?\n"
	ts_position_option_horizontal width=0x7
	ts_option [
		brackets: 0x0,
		right: 0x1,
		left: 0x1,
		down: 0x0,
		up: 0x0,
	]
	ts_space count=0x1
	.string " Yes  "
	ts_option [
		brackets: 0x0,
		right: 0x0,
		left: 0x0,
		down: 0x1,
		up: 0x1,
	]
	ts_space count=0x1
	.string " No"
	ts_select 0x6, 0x80, 0xFF, 0xFF, 0xFF
	ts_end

	def_text_script TextScript0_unk41
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"King Crab CompTank\""
	ts_key_wait any=0x0
	ts_clear_msg
	ts_mugshot_show mugshot=0x3C
	.string "IS THIS MY COMPTANK?\n"
	ts_position_option_horizontal width=0x7
	ts_option [
		brackets: 0x0,
		right: 0x1,
		left: 0x1,
		down: 0x0,
		up: 0x0,
	]
	ts_space count=0x1
	.string " Yes  "
	ts_option [
		brackets: 0x0,
		right: 0x0,
		left: 0x0,
		down: 0x1,
		up: 0x1,
	]
	ts_space count=0x1
	.string " No"
	ts_select 0x6, 0x80, 0xFF, 0xFF, 0xFF
	ts_end

	def_text_script TextScript0_unk42
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Turtle CompTank\""
	ts_key_wait any=0x0
	ts_clear_msg
	ts_mugshot_show mugshot=0x3C
	.string "IS THIS MY COMPTANK?\n"
	ts_position_option_horizontal width=0x7
	ts_option [
		brackets: 0x0,
		right: 0x1,
		left: 0x1,
		down: 0x0,
		up: 0x0,
	]
	ts_space count=0x1
	.string " Yes  "
	ts_option [
		brackets: 0x0,
		right: 0x0,
		left: 0x0,
		down: 0x1,
		up: 0x1,
	]
	ts_space count=0x1
	.string " No"
	ts_select 0x6, 0x80, 0xFF, 0xFF, 0xFF
	ts_end

	def_text_script TextScript0_unk43
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Alligator CompTank\""
	ts_key_wait any=0x0
	ts_clear_msg
	ts_mugshot_show mugshot=0x3C
	.string "IS THIS MY COMPTANK?\n"
	ts_position_option_horizontal width=0x7
	ts_option [
		brackets: 0x0,
		right: 0x1,
		left: 0x1,
		down: 0x0,
		up: 0x0,
	]
	ts_space count=0x1
	.string " Yes  "
	ts_option [
		brackets: 0x0,
		right: 0x0,
		left: 0x0,
		down: 0x1,
		up: 0x1,
	]
	ts_space count=0x1
	.string " No"
	ts_select 0x6, 0x80, 0xFF, 0xFF, 0xFF
	ts_end

	def_text_script TextScript0_unk44
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Dolphin CompTank\""
	ts_key_wait any=0x0
	ts_clear_msg
	ts_mugshot_show mugshot=0x3C
	.string "IS THIS MY COMPTANK?\n"
	ts_position_option_horizontal width=0x7
	ts_option [
		brackets: 0x0,
		right: 0x1,
		left: 0x1,
		down: 0x0,
		up: 0x0,
	]
	ts_space count=0x1
	.string " Yes  "
	ts_option [
		brackets: 0x0,
		right: 0x0,
		left: 0x0,
		down: 0x1,
		up: 0x1,
	]
	ts_space count=0x1
	.string " No"
	ts_select 0x6, 0x80, 0xFF, 0xFF, 0xFF
	ts_end

	def_text_script TextScript0_unk45
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Elephant Seal\n"
	.string " CompTank\""
	ts_key_wait any=0x0
	ts_clear_msg
	ts_mugshot_show mugshot=0x3C
	.string "IS THIS MY COMPTANK?\n"
	ts_position_option_horizontal width=0x7
	ts_option [
		brackets: 0x0,
		right: 0x1,
		left: 0x1,
		down: 0x0,
		up: 0x0,
	]
	ts_space count=0x1
	.string " Yes  "
	ts_option [
		brackets: 0x0,
		right: 0x0,
		left: 0x0,
		down: 0x1,
		up: 0x1,
	]
	ts_space count=0x1
	.string " No"
	ts_select 0x6, 0x80, 0xFF, 0xFF, 0xFF
	ts_end

	def_text_script TextScript0_unk46
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Penguin CompTank\""
	ts_key_wait any=0x0
	ts_clear_msg
	ts_mugshot_show mugshot=0x3C
	.string "IS THIS MY COMPTANK?\n"
	ts_position_option_horizontal width=0x7
	ts_option [
		brackets: 0x0,
		right: 0x1,
		left: 0x1,
		down: 0x0,
		up: 0x0,
	]
	ts_space count=0x1
	.string " Yes  "
	ts_option [
		brackets: 0x0,
		right: 0x0,
		left: 0x0,
		down: 0x1,
		up: 0x1,
	]
	ts_space count=0x1
	.string " No"
	ts_select 0x6, 0x80, 0xFF, 0xFF, 0xFF
	ts_end

	def_text_script TextScript0_unk47
	ts_msg_open
	ts_mugshot_show mugshot=0x3C
	.string "WAAAAAH!"
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk48
	ts_msg_open
	ts_mugshot_show mugshot=0x3C
	.string "N-NOOOOOOO!"
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk49
	ts_msg_open
	ts_mugshot_show mugshot=0x3C
	.string "EEEEEEEE!"
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk50
	ts_mugshot_show mugshot=0x3C
	ts_msg_open
	.string "GOLLY,I WISH I\n"
	.string "COULD REMEMBER\n"
	.string "WHAT I AM..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "HMM..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "I THINK I OWE\n"
	.string "SOMETHING TO A\n"
	.string "SEA ANEMONE..."
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk10_id

	def_text_script TextScript0_unk51
	ts_mugshot_show mugshot=0x3C
	ts_msg_open
	.string "HEY...\n"
	.string "DON'T REMEMBER\n"
	.string "MUCH,BUT..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "HMM... IF ONLY\n"
	.string "I HAD A CLUE..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "DON'T REALLY KNOW\n"
	.string "ANYTHING ABOUT ME\n"
	.string "THAT STANDS OUT..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "OH,WHAT TO DO,\n"
	.string "WHAT TO DO..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "...... *CHOMP*"
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk10_id

	def_text_script TextScript0_unk52
	ts_mugshot_show mugshot=0x3C
	ts_msg_open
	.string "OH DEAR,OH MY...\n"
	.string "MY MEMORY IS REALLY\n"
	.string "GOING... AND YET..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "I KNOW ALL ABOUT\n"
	.string "THE SEASIDE TOWN\n"
	.string "AQUARIUM... STRANGE."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "WHAT IN THE WORLD\n"
	.string "AM I...?"
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk10_id

	def_text_script TextScript0_unk53
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Clown Fish\n"
	.string " CompTank\""
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk54
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Shark CompTank\""
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk55
	ts_msg_open
	.string "The nameplate is\n"
	.string "broken..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "You can't tell what\n"
	.string "animal's CompTank\n"
	.string "this is..."
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk56
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Clown Fish\n"
	.string " CompTank\""
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk34_id
	ts_end

	def_text_script TextScript0_unk57
	ts_msg_open
	.string "It's labeled:\n"
	.string "\"Shark CompTank\""
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk34_id
	ts_end

	def_text_script TextScript0_unk58
	ts_msg_open
	.string "The nameplate is\n"
	.string "broken..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "You can't tell what\n"
	.string "animal's CompTank\n"
	.string "this is..."
	ts_key_wait any=0x0
	ts_clear_msg
	ts_jump target=TextScript0_unk34_id
	ts_end

	def_text_script TextScript0_unk59
	ts_msg_open
	ts_flag_set flag=0xFC2
	.string "A CLOWN FISH!\n"
	.string "I'M A FAVORITE\n"
	.string "WITH THE KIDS!"
	ts_key_wait any=0x0
	ts_clear_msg
	.string "SHUCKS,I'M JUST A\n"
	.string "SHY,LITTLE FISH THAT\n"
	.string "HIDES IN AN ANEMONE!"
	ts_key_wait any=0x0
	ts_clear_msg
	.string "I FEEL SO MUCH\n"
	.string "BETTER!"
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk60
	ts_msg_open
	ts_flag_set flag=0xFC3
	.string "A SHARK! MMMM..."
	ts_key_wait any=0x0
	ts_clear_msg
	.string "NO WONDER I HAVE\n"
	.string "AN UNSTOPPABLE URGE\n"
	.string "TO EAT EVERYTHING!"
	ts_key_wait any=0x0
	ts_clear_msg
	.string "*CH-CHOMP!*"
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk61
	ts_msg_open
	ts_flag_set flag=0xFC4
	.string "AN AQUARIUM\n"
	.string "DIRECTOR!"
	ts_key_wait any=0x0
	ts_clear_msg
	.string "I'M THE AQUARIUM\n"
	.string "DIRECTOR MADE INTO\n"
	.string "A JOKE PROGRAM!"
	ts_key_wait any=0x0
	ts_clear_msg
	.string "I GUESS THAT'S WHY I\n"
	.string "KNOW SO MUCH ABOUT\n"
	.string "THE AQUARIUM!"
	ts_key_wait any=0x0
	ts_clear_msg
	.string "... WHICH MEANS I'M\n"
	.string "NOT REALLY A FISH\n"
	.string "AT ALL,HUH...?"
	ts_key_wait any=0x0
	ts_end

	def_text_script TextScript0_unk62
	ts_check_global [
		variable: 0x0,
		value: 0x0,
		jumpIfEqual: TextScript0_unk37_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x1,
		jumpIfEqual: TextScript0_unk38_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x2,
		jumpIfEqual: TextScript0_unk39_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x3,
		jumpIfEqual: TextScript0_unk40_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x4,
		jumpIfEqual: TextScript0_unk41_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x5,
		jumpIfEqual: TextScript0_unk42_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x6,
		jumpIfEqual: TextScript0_unk43_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x7,
		jumpIfEqual: TextScript0_unk44_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x8,
		jumpIfEqual: TextScript0_unk45_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0x9,
		jumpIfEqual: TextScript0_unk46_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0xA,
		jumpIfEqual: TextScript0_unk56_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0xB,
		jumpIfEqual: TextScript0_unk57_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_check_global [
		variable: 0x0,
		value: 0xC,
		jumpIfEqual: TextScript0_unk58_id,
		jumpIfNotEqual: TS_CONTINUE,
	]
	ts_end

	def_text_script TextScript0_unk63
	ts_end

	.balign 4, 0
0x1208