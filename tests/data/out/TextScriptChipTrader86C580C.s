	text_archive_start

	def_text_script scr_0
	ts_msg_open
	.string "It's a Chip Trader.\n"
	.string "Insert 3 BtlChips?\n"
	ts_position_option_horizontal 0x7
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0x5, 0xFF
	ts_start_chip_trader 0x3, 0x1
	ts_key_wait 0x0
	ts_end

	def_text_script scr_1
	ts_check_flag 0x1D, 0x17, 0xFF, 0x14
	ts_check_navi_all 0xFF, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0x14, 0xFF
	ts_msg_open
	ts_mugshot_show 0x37
	.string "Lan,you have less\n"
	.string "than 3 chips in your\n"
	.string "Pack."
	ts_key_wait 0x0
	ts_end

	def_text_script scr_2
	ts_check_flag 0x1D, 0x17, 0xFF, 0x1E
	ts_check_navi_all 0xFF, 0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0x1E, 0xFF
	ts_msg_open
	ts_text_speed 0x0
	ts_mugshot_show 0x37
	.string "Add these 3?\n"
	ts_position_option_from_center 0x7
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0xFF, 0xFF
	ts_end

	def_text_script scr_3
	ts_msg_open
	.string "OK!\n"
	ts_sound_disable_text_sfx
	ts_sound_play00 0xD5, 0x0
	.string "Click-k-k-k...THUNK!"
	ts_sound_enable_text_sfx
	ts_key_wait 0x0
	ts_clear_msg
	ts_player_animate_scene 0x18
	ts_sound_play00 0x73, 0x0
	ts_flag_set 0xF5, 0x0
	ts_position_text 0x5B, 0x6C, 0x3
	ts_position_arrow 0xE2, 0x8D
	.string "Lan got:\n"
	.string "\""
	ts_print_chip1 0x0, 0x1
	.string " "
	ts_print_code 0x0, 0x2
	.string "\"!!!"
	ts_key_wait 0x0
	ts_player_finish
	ts_player_reset_scene
	ts_clear_msg
	ts_flag_clear 0xF5, 0x0
	ts_wait 0x6, 0x0
	ts_position_text 0x33, 0x6C, 0x3
	.string "Try again?\n"
	ts_position_option_horizontal 0x8
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0x5, 0xFF
	ts_start_chip_trader 0x3, 0x4
	ts_key_wait 0x0
	ts_end

	def_text_script scr_4
	ts_check_flag 0x1D, 0x17, 0xFF, 0x15
	ts_check_navi_all 0xFF, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0xFF
	ts_clear_msg
	ts_mugshot_show 0x37
	ts_msg_open
	.string "Too bad,Lan. You\n"
	.string "have less than 3\n"
	.string "chips in your Pack!"
	ts_key_wait 0x0
	ts_end

	def_text_script scr_5
	ts_end

	def_text_script scr_6
	ts_msg_open
	.string "Chip Trader Special!\n"
	.string "Insert 10 BtlChips?\n"
	ts_position_option_horizontal 0x7
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0xB, 0xFF
	ts_start_chip_trader 0xA, 0x7
	ts_key_wait 0x0
	ts_end

	def_text_script scr_7
	ts_check_flag 0x1D, 0x17, 0xFF, 0x16
	ts_check_navi_all 0xFF, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0x16, 0xFF
	ts_mugshot_show 0x37
	ts_msg_open
	.string "Lan,you have less\n"
	.string "than 10 chips\n"
	.string "in your Pack."
	ts_key_wait 0x0
	ts_end

	def_text_script scr_8
	ts_check_flag 0x1D, 0x17, 0xFF, 0x1F
	ts_check_navi_all 0xFF, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0x1F, 0xFF
	ts_msg_open
	ts_text_speed 0x0
	ts_mugshot_show 0x37
	.string "Add these 10?\n"
	ts_position_option_from_center 0x7
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0xFF, 0xFF
	ts_msg_close_quick
	ts_end

	def_text_script scr_9
	ts_msg_open
	.string "OK!\n"
	ts_sound_disable_text_sfx
	ts_sound_play00 0xD5, 0x0
	.string "Click-k-k-k...THUNK!"
	ts_sound_enable_text_sfx
	ts_key_wait 0x0
	ts_clear_msg
	ts_player_animate_scene 0x18
	ts_sound_play00 0x73, 0x0
	ts_flag_set 0xF5, 0x0
	ts_position_text 0x5B, 0x6C, 0x3
	ts_position_arrow 0xE2, 0x8D
	.string "Lan got:\n"
	.string "\""
	ts_print_chip1 0x0, 0x1
	.string " "
	ts_print_code 0x0, 0x2
	.string "\"!!!"
	ts_key_wait 0x0
	ts_player_finish
	ts_player_reset_scene
	ts_clear_msg
	ts_flag_clear 0xF5, 0x0
	ts_wait 0x6, 0x0
	ts_position_text 0x33, 0x6C, 0x3
	.string "Try again?\n"
	ts_position_option_horizontal 0x7
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0xB, 0xFF
	ts_start_chip_trader 0xA, 0xA
	ts_key_wait 0x0
	ts_end

	def_text_script scr_10
	ts_check_flag 0x1D, 0x17, 0xFF, 0x17
	ts_check_navi_all 0xFF, 0x17, 0x17, 0x17, 0x17, 0x17, 0x17, 0x17, 0x17, 0x17, 0x17, 0xFF
	ts_clear_msg
	ts_mugshot_show 0x37
	ts_msg_open
	.string "Too bad,Lan. You\n"
	.string "have less than 10\n"
	.string "chips in your Pack!"
	ts_key_wait 0x0
	ts_end

	def_text_script scr_11
	ts_end

	def_text_script scr_12
	ts_msg_open
	.string "A BugFrag Trader."
	ts_key_wait 0x0
	ts_clear_msg
	.string "Insert 10 BugFrags?\n"
	ts_position_option_horizontal 0x7
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0x11, 0xFF
	ts_start_chip_trader 0x1, 0xD
	ts_wait_hold 0x0, 0x0

	def_text_script scr_13
	ts_check_flag 0x1D, 0x17, 0xFF, 0x18
	ts_check_navi_all 0xFF, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0xFF
	ts_mugshot_show 0x37
	ts_msg_open
	.string "Lan,you don't have\n"
	.string "10 BugFrags!"
	ts_key_wait 0x0
	ts_end

	def_text_script scr_14

	def_text_script scr_15
	ts_msg_open_quick
	ts_print_current_navi_ow
	.string " handed over\n"
	.string "the BugFrags!"
	ts_key_wait 0x0
	ts_clear_msg
	ts_flag_set 0xF6, 0x0
	ts_wait 0x3C, 0x0
	.string "With a powerful howl\n"
	.string "the ChipData is\n"
	.string "revealed!"
	ts_key_wait 0x0
	ts_clear_msg
	ts_player_animate_scene 0x18
	ts_sound_play00 0x73, 0x0
	ts_flag_set 0xF5, 0x0
	ts_position_text 0x5B, 0x6C, 0x3
	ts_position_arrow 0xE2, 0x8D
	ts_print_current_navi_ow
	.string " got:\n"
	.string "\""
	ts_print_chip1 0x0, 0x1
	.string " "
	ts_print_code 0x0, 0x2
	.string "\"!!!"
	ts_key_wait 0x0
	ts_player_finish
	ts_player_reset_scene
	ts_clear_msg
	ts_flag_clear 0xF5, 0x0
	ts_wait 0x6, 0x0
	ts_position_text 0x33, 0x6C, 0x3
	.string "Try again?\n"
	ts_position_option_horizontal 0x7
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0x11, 0xFF
	ts_start_chip_trader 0x1, 0x10
	ts_wait_hold 0x0, 0x0

	def_text_script scr_16
	ts_check_flag 0x1D, 0x17, 0xFF, 0x19
	ts_check_navi_all 0xFF, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0x19, 0xFF
	ts_clear_msg
	ts_mugshot_show 0x37
	ts_msg_open
	.string "Too bad,Lan. We\n"
	.string "don't have 10\n"
	.string "BugFrags!"
	ts_key_wait 0x0
	ts_msg_close
	ts_wait_hold 0x0, 0x0

	def_text_script scr_17
	ts_msg_close
	ts_wait_hold 0x0, 0x0

	def_text_script scr_18

	def_text_script scr_19

	def_text_script scr_20
	ts_msg_open
	.string "You don't have 3\n"
	.string "chips in your Pack."
	ts_key_wait 0x0
	ts_end

	def_text_script scr_21
	ts_clear_msg
	ts_msg_open
	.string "You don't have 3\n"
	.string "chips in your Pack."
	ts_key_wait 0x0
	ts_end

	def_text_script scr_22
	ts_msg_open
	.string "You don't have 10\n"
	.string "chips in your Pack."
	ts_key_wait 0x0
	ts_end

	def_text_script scr_23
	ts_clear_msg
	ts_msg_open
	.string "You don't have 10\n"
	.string "chips in your Pack."
	ts_key_wait 0x0
	ts_end

	def_text_script scr_24
	ts_msg_open
	.string "We don't have 10\n"
	.string "BugFrags!"
	ts_key_wait 0x0
	ts_end

	def_text_script scr_25
	ts_clear_msg
	ts_msg_open
	.string "We don't have 10\n"
	.string "BugFrags!"
	ts_key_wait 0x0
	ts_wait_hold 0x0, 0x0

	def_text_script scr_26
	ts_msg_open
	.string "You don't have 3\n"
	.string "chips in your Pack."
	ts_key_wait 0x0
	ts_end

	def_text_script scr_27
	ts_msg_open
	.string "You don't have 3\n"
	.string "chips in your Pack."
	ts_key_wait 0x0
	ts_end

	def_text_script scr_28
	ts_msg_open
	.string "We don't have 10\n"
	.string "BugFrags!"
	ts_key_wait 0x0
	ts_end

	def_text_script scr_29
	ts_clear_msg
	ts_msg_open
	.string "We don't have 10\n"
	.string "BugFrags!"
	ts_key_wait 0x0
	ts_wait_hold 0x0, 0x0

	def_text_script scr_30
	ts_msg_open
	ts_text_speed 0x0
	.string "Add these 3?\n"
	ts_position_option_from_center 0x7
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0xFF, 0xFF
	ts_msg_close_quick
	ts_end

	def_text_script scr_31
	ts_msg_open
	ts_text_speed 0x0
	.string "Add these 10?\n"
	ts_position_option_from_center 0x7
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0xFF, 0xFF
	ts_msg_close_quick
	ts_end

	def_text_script scr_32
	ts_msg_open
	ts_text_speed 0x0
	.string "Add these 3?\n"
	ts_position_option_from_center 0x7
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0xFF, 0xFF
	ts_msg_close_quick
	ts_end

	def_text_script scr_33
	ts_msg_open
	ts_text_speed 0x0
	.string "Add these 3?\n"
	ts_position_option_from_center 0x7
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0xFF, 0xFF
	ts_msg_close_quick
	ts_end

	def_text_script scr_34
	ts_clear_msg
	ts_msg_open
	.string "Too bad,Lan. You\n"
	.string "don't have 3\n"
	.string "chips in your Pack."
	ts_key_wait 0x0
	ts_end

	def_text_script scr_35
	ts_clear_msg
	ts_msg_open
	.string "Too bad,Lan. You\n"
	.string "don't have 3\n"
	.string "chips in your Pack."
	ts_key_wait 0x0
	ts_end

	def_text_script scr_36
	ts_msg_open
	ts_text_speed 0x0
	.string "Add these 10?\n"
	ts_position_option_from_center 0x7
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0xFF, 0xFF
	ts_msg_close_quick
	ts_end

	def_text_script scr_37
	ts_msg_open
	ts_text_speed 0x0
	.string "Add these 10?\n"
	ts_position_option_from_center 0x7
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0xFF, 0xFF
	ts_msg_close_quick
	ts_end

	def_text_script scr_38
	ts_clear_msg
	ts_msg_open
	.string "Too bad,Lan. You\n"
	.string "don't have 10\n"
	.string "chips in your Pack."
	ts_key_wait 0x0
	ts_end

	def_text_script scr_39
	ts_clear_msg
	ts_msg_open
	.string "Too bad,Lan. You\n"
	.string "don't have 10\n"
	.string "chips in your Pack."
	ts_key_wait 0x0
	ts_end

	def_text_script scr_40
	ts_msg_open
	.string "We don't have 10\n"
	.string "BugFrags!"
	ts_key_wait 0x0
	ts_end

	def_text_script scr_41
	ts_msg_open
	.string "We don't have 10\n"
	.string "BugFrags!"
	ts_key_wait 0x0
	ts_end

	def_text_script scr_42
	ts_clear_msg
	ts_msg_open
	.string "We don't have 10\n"
	.string "BugFrags!"
	ts_key_wait 0x0
	ts_wait_hold 0x0, 0x0

	def_text_script scr_43
	ts_clear_msg
	ts_msg_open
	.string "We don't have 10\n"
	.string "BugFrags!"
	ts_key_wait 0x0
	ts_wait_hold 0x0, 0x0

	def_text_script scr_44
	ts_msg_open
	.string "You don't have 10\n"
	.string "chips in your Pack."
	ts_key_wait 0x0
	ts_end

	def_text_script scr_45
	ts_msg_open
	.string "You don't have 10\n"
	.string "chips in your Pack."
	ts_key_wait 0x0
	ts_end

	def_text_script scr_46

	def_text_script scr_47

	def_text_script scr_48

	def_text_script scr_49

	def_text_script scr_50
	ts_mugshot_show 0x35
	ts_msg_open
	.string "I am Otenko."
	ts_key_wait 0x0
	ts_clear_msg
	.string "I have traveled the\n"
	.string "depths of space."
	ts_key_wait 0x0
	ts_clear_msg
	.string "I have arrived to\n"
	.string "exchange your\n"
	.string "Crossover Points!"
	ts_key_wait 0x0
	ts_clear_msg
	.string "Add your points?\n"
	ts_position_option_horizontal 0x7
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0x34, 0xFF

	def_text_script scr_51
	ts_call_disable_mugshot_brighten
	ts_mugshot_show 0x35
	ts_msg_open_quick
	.string "Add your points?\n"
	ts_space 0x8
	ts_option 0x1, 0x0, 0x0
	ts_space 0x1
	ts_menu_option_crossover_trader 0x0
	.string "1"
	ts_space_px 0x1
	ts_menu_option_crossover_trader 0x1
	.string "0\n"
	.string "(U/D:Change points)"
	ts_flag_set 0x25, 0x17
	ts_menu_select_crossover_trader
	ts_wait_hold 0x0, 0x0

	def_text_script scr_52
	ts_call_disable_mugshot_brighten
	ts_mugshot_show 0x35
	ts_msg_open_quick
	.string "Very well.\n"
	.string "Come again!"
	ts_key_wait 0x0
	ts_clear_msg
	.string "The Sun will rise\n"
	.string "tomorrow!"
	ts_key_wait 0x0
	ts_wait_hold 0x0, 0x0

	def_text_script scr_53
	ts_call_disable_mugshot_brighten
	ts_mugshot_show 0x35
	ts_msg_open_quick
	ts_print_buffer03 0x82, 0x1
	.string " points?\n"
	ts_position_option_horizontal 0x7
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0x34, 0xFF
	ts_wait_hold 0x0, 0x0

	def_text_script scr_54
	ts_call_disable_mugshot_brighten
	ts_mugshot_show 0x35
	ts_msg_open_quick
	.string "You don't have\n"
	.string "enough points!"
	ts_key_wait 0x0
	ts_end

	def_text_script scr_55
	ts_msg_open_quick
	ts_flag_set 0xF6, 0x0
	ts_control_lock
	ts_wait 0x3C, 0x0
	ts_control_unlock
	ts_player_animate_scene 0x18
	ts_sound_play00 0x73, 0x0
	ts_flag_set 0xF5, 0x0
	ts_position_text 0x5B, 0x6C, 0x3
	ts_position_arrow 0xE2, 0x8D
	ts_print_current_navi_ow
	.string " got:\n"
	.string "\""
	ts_print_chip1 0x0, 0x1
	.string " "
	ts_print_code 0x0, 0x2
	.string "\"!!!"
	ts_key_wait 0x0
	ts_player_finish
	ts_player_reset_scene
	ts_clear_msg
	ts_flag_clear 0xF5, 0x0
	ts_wait 0x6, 0x0
	ts_position_text 0x33, 0x6C, 0x3
	ts_mugshot_show 0x35
	.string "Try again?\n"
	ts_position_option_horizontal 0x8
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0x34, 0xFF
	ts_wait_hold 0x0, 0x0

	def_text_script scr_56
	ts_msg_open_quick
	ts_control_lock
	ts_wait 0x3C, 0x0
	ts_control_unlock
	ts_player_animate_scene 0x18
	ts_sound_play00 0x73, 0x0
	ts_print_current_navi_ow
	.string " got:\n"
	.string "\""
	ts_print_chip1 0x0, 0x1
	.string " "
	ts_print_code 0x0, 0x2
	.string "\"!!!"
	ts_key_wait 0x0
	ts_player_finish
	ts_player_reset_scene
	ts_clear_msg
	ts_position_text 0x33, 0x6C, 0x3
	ts_mugshot_show 0x35
	.string "Try again?\n"
	ts_position_option_horizontal 0x8
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0x34, 0xFF
	ts_wait_hold 0x0, 0x0

	def_text_script scr_57
	ts_msg_open_quick
	ts_control_lock
	ts_wait 0x3C, 0x0
	ts_control_unlock
	ts_player_animate_scene 0x18
	ts_sound_play00 0x73, 0x0
	ts_print_current_navi_ow
	.string " got:\n"
	ts_print_buffer03 0x0, 0x3
	.string " BugFrags!!"
	ts_key_wait 0x0
	ts_player_finish
	ts_player_reset_scene
	ts_clear_msg
	ts_position_text 0x33, 0x6C, 0x3
	ts_mugshot_show 0x35
	.string "Try again?\n"
	ts_position_option_horizontal 0x8
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0x34, 0xFF
	ts_wait_hold 0x0, 0x0

	def_text_script scr_58
	ts_msg_open_quick
	ts_flag_set 0xF6, 0x0
	ts_control_lock
	ts_wait 0x3C, 0x0
	ts_control_unlock
	ts_player_animate_scene 0x18
	ts_sound_play00 0x73, 0x0
	ts_flag_set 0xF5, 0x0
	ts_position_text 0x5B, 0x6C, 0x3
	ts_position_arrow 0xE2, 0x8D
	.string "ProtoMan got:\n"
	.string "\""
	ts_print_chip1 0x0, 0x1
	.string " "
	ts_print_code 0x0, 0x2
	.string "\"!!!"
	ts_key_wait 0x0
	ts_player_finish
	ts_player_reset_scene
	ts_clear_msg
	ts_flag_clear 0xF5, 0x0
	ts_wait 0x6, 0x0
	ts_position_text 0x33, 0x6C, 0x3
	ts_mugshot_show 0x35
	.string "Try again?\n"
	ts_position_option_horizontal 0x8
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0x34, 0xFF
	ts_wait_hold 0x0, 0x0

	def_text_script scr_59
	ts_msg_open_quick
	ts_control_lock
	ts_wait 0x3C, 0x0
	ts_control_unlock
	ts_player_animate_scene 0x18
	ts_sound_play00 0x73, 0x0
	.string "ProtoMan got a\n"
	.string "SubChip:\n"
	.string "\""
	ts_print_item 0x0, 0x1
	.string "\"!!!"
	ts_key_wait 0x0
	ts_player_finish
	ts_player_reset_scene
	ts_clear_msg
	ts_position_text 0x33, 0x6C, 0x3
	ts_mugshot_show 0x35
	.string "Try again?\n"
	ts_position_option_horizontal 0x8
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0x34, 0xFF
	ts_wait_hold 0x0, 0x0

	def_text_script scr_60
	ts_msg_open_quick
	ts_control_lock
	ts_wait 0x3C, 0x0
	ts_control_unlock
	ts_player_animate_scene 0x18
	ts_sound_play00 0x73, 0x0
	.string "ProtoMan got:\n"
	ts_print_buffer03 0x81, 0x1
	.string " BugFrags!!"
	ts_key_wait 0x0
	ts_player_finish
	ts_player_reset_scene
	ts_clear_msg
	ts_position_text 0x33, 0x6C, 0x3
	ts_mugshot_show 0x35
	.string "Try again?\n"
	ts_position_option_horizontal 0x8
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0x34, 0xFF
	ts_wait_hold 0x0, 0x0

	def_text_script scr_61
	ts_msg_open_quick
	ts_flag_set 0xF6, 0x0
	ts_control_lock
	ts_wait 0x3C, 0x0
	ts_control_unlock
	ts_player_animate_scene 0x18
	ts_sound_play00 0x73, 0x0
	ts_flag_set 0xF5, 0x0
	ts_position_text 0x5B, 0x6C, 0x3
	ts_position_arrow 0xE2, 0x8D
	.string "Colonel got:\n"
	.string "\""
	ts_print_chip1 0x0, 0x1
	.string " "
	ts_print_code 0x0, 0x2
	.string "\"!!!"
	ts_key_wait 0x0
	ts_player_finish
	ts_player_reset_scene
	ts_clear_msg
	ts_flag_clear 0xF5, 0x0
	ts_wait 0x6, 0x0
	ts_position_text 0x33, 0x6C, 0x3
	ts_mugshot_show 0x35
	.string "Try again?\n"
	ts_position_option_horizontal 0x8
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0x34, 0xFF
	ts_wait_hold 0x0, 0x0

	def_text_script scr_62
	ts_msg_open_quick
	ts_control_lock
	ts_wait 0x3C, 0x0
	ts_control_unlock
	ts_player_animate_scene 0x18
	ts_sound_play00 0x73, 0x0
	.string "Colonel got a\n"
	.string "SubChip:\n"
	.string "\""
	ts_print_item 0x0, 0x1
	.string "\"!!!"
	ts_key_wait 0x0
	ts_player_finish
	ts_player_reset_scene
	ts_clear_msg
	ts_position_text 0x33, 0x6C, 0x3
	ts_mugshot_show 0x35
	.string "Try again?\n"
	ts_position_option_horizontal 0x8
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0x34, 0xFF
	ts_wait_hold 0x0, 0x0

	def_text_script scr_63
	ts_msg_open_quick
	ts_control_lock
	ts_wait 0x3C, 0x0
	ts_control_unlock
	ts_player_animate_scene 0x18
	ts_sound_play00 0x73, 0x0
	.string "Colonel got:\n"
	ts_print_buffer03 0x81, 0x1
	.string " BugFrags!!"
	ts_key_wait 0x0
	ts_player_finish
	ts_player_reset_scene
	ts_clear_msg
	ts_position_text 0x33, 0x6C, 0x3
	ts_mugshot_show 0x35
	.string "Try again?\n"
	ts_position_option_horizontal 0x8
	ts_option 0x0, 0x11, 0x0
	ts_space 0x1
	.string " Yes  "
	ts_option 0x0, 0x0, 0x11
	ts_space 0x1
	.string " No"
	ts_select 0x6, 0x0, 0xFF, 0x34, 0xFF
	ts_wait_hold 0x0, 0x0

	def_text_script scr_64
	.string " "
	ts_clear_msg
	.string " ボ$"

	.balign 4, 0
0xfd6