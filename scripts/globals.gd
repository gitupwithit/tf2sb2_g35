# game states: "start_menu", "main", "demo_mini_game_1", "demo_mini_game_2", "demo_mini_game_3", "demo_mini_game_4", "scout_mini_game"

extends Node

var mood
var last_pressed
var game_state
var main_score
var scout_mg_score = 1
var soldier_mg_score
var pyro_mg_score
var demo_mg_score 
var heavy_mg_score
var engi_mg_score
var medic_mg_score
var sniper_mg_score
var spy_mg_score

var captions = false
var descriptions = false

var scout0_sounds = []
var scout1_sounds = []
var scout2_sounds = []
#var scout3_sounds = []
var soldier0_sounds = []
var soldier1_sounds = []
var soldier2_sounds = []
#var soldier3_sounds = []
var pyro0_sounds = []
var pyro1_sounds = []
var pyro2_sounds = []
#var pyro3_sounds = []
var demo0_sounds = []
var demo1_sounds = []
var demo2_sounds = []
#var demo3_sounds = []
var heavy0_sounds = []
var heavy1_sounds = []
var heavy2_sounds = []
#var heavy3_sounds = []
var engi0_sounds = []
var engi1_sounds = []
var engi2_sounds = []
#var engi3_sounds = []
var medic0_sounds = []
var medic1_sounds = []
var medic2_sounds = []
#var medic3_sounds = []
var sniper0_sounds = []
var sniper1_sounds = []
var sniper2_sounds = []
#var sniper3_sounds = []
var spy0_sounds = []
var spy1_sounds = []
var spy2_sounds = []
#var spy3_sounds = []

var to_scene
var from_scene

func checkvars():
	print("from ", from_scene, " to ", to_scene)

func fade_out_scene(from, to):
	from_scene = from
	to_scene = to
	var current_scene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() - 1) # Get the current scene
	print("from ", from_scene, " to ", to_scene)
	var canvas_layer = current_scene.find_node("CanvasLayer", true, false) # Find the CanvasLayer

	# Check if CanvasLayer exists, if not, create one
	if canvas_layer == null:
		canvas_layer = CanvasLayer.new()
		canvas_layer.name = "CanvasLayer"
		current_scene.add_child(canvas_layer)
	var fade_out_node = load("res://scenes/fade_out_scene.tscn")
	var fade_out_node_instance = fade_out_node.instance()
	canvas_layer.add_child(fade_out_node_instance)

func switch_scene(from, to):
	print("from ", from, " to ", to)
	if to == "scout_mg":
		get_tree().change_scene("res://scenes/scout_mg.tscn")
	if to == "main":
		get_tree().change_scene("res://scenes/main.tscn")

func preload_sounds_mercs():
	var scout0_filenames = [
		"alright_alright.mp3",
		"Bang_I_make_it_look_easy.mp3",
		"Boink.mp3",
		"I_love_my_ball.mp3",
		"Lets_get_em.mp3",
		"No_problem.mp3",
		"Play_ball.mp3",
		"Thanks_for_that_tough_guy.mp3",
		"Theres_my_ball.mp3",
		"We_are_gonna_OWN_this.mp3",
		"What.mp3",
		"Yeh_thats_right.mp3",
		"Yo_batter_up.mp3"
		]
	for file in scout0_filenames:
		scout0_sounds.append(load("res://audio/0_scout/0_neutral/" + file))
#	print("scout0 sounds: ", scout0_sounds)
	var scout1_filenames = [ "Alright_I_feel_good.mp3", 
		"Dat_is_how_you_do_it.mp3", 
		"Im_battin_a_thousand.mp3", 
		"laughing.mp3", 
		"laughing_yeh_yeh.mp3", 
		"Sweet.mp3", 
		"Woo_hoo.mp3", 
		"Yeh_its_ours_now.mp3", 
		"Yeh_welcome_to_the_winning_team.mp3", 
		"Yeh_were_pretty_great.mp3", 
		"Yeh_yeh_yeh.mp3"
		]
	for file in scout1_filenames:
		scout1_sounds.append(load("res://audio/0_scout/1_happy/" + file))
#	print("scout1 sounds: ", scout1_sounds)
	var scout2_filenames = ["Dummy.mp3", 
		"Moron.mp3", 
		"Oh_hey_you_suck.mp3", 
		"Oooh_yeh_youre_real_scary.mp3", 
		"The_hell_was_that_crap.mp3", 
		"Whats_a_matter_you_freaking_stupid.mp3", 
		"Whos_the_tough_guy_now.mp3", 
		"Youre_all_losers.mp3", 
		"Youre_like_a_car_crash.mp3", 
		"You_are_terible.mp3", 
		"You_knuckleheads_aint_even_worth.mp3"
		]
	for file in scout2_filenames:
		scout2_sounds.append(load("res://audio/0_scout/2_angry/" + file))
#	print("scout2 sounds: ", scout2_sounds)
	
	var soldier0_filenames = ["Boots_on_the_ground_boys.mp3", 
		"Dominated_Im_still_your_friend.mp3", 
		"Hoo_wah.mp3", 
		"I_got_three_words_for_you_U_S_A.mp3", 
		"Kaboom.mp3", 
		"Last_one_alive_lock_the_door.mp3", 
		"Pain_is_weakness_leaving_the_body.mp3", 
		"Screamin_eagles.mp3", 
		"Ten_hut_you_too_brain_maggot.mp3", 
		"The_eagle_has_landed_on_my_head.mp3", 
		"We_have_you_surrounded_at_least.mp3"
		]
	for file in soldier0_filenames:
		soldier0_sounds.append(load("res://audio/1_soldier/0_neutral/" + file))
#	print("soldier0 sounds: ", soldier0_sounds)
	
	var soldier1_filenames = ["Affirmative.mp3", 
		"And_that_is_how_you_do_it_men.mp3", 
		"Friendship_is_magic_creampuff.mp3", 
		"Now_that_is_what_I_wanna_see.mp3", 
		"Son_I_am_proud_of_you.mp3", 
		"Thanks.mp3", 
		"Thanks_for_the_aid.mp3", 
		"Today_is_a_good_day.mp3", 
		"Well_done_maggots.mp3"
		]
	for file in soldier1_filenames:
		soldier1_sounds.append(load("res://audio/1_soldier/1_happy/" + file))
#	print("soldier1 sounds: ", soldier1_sounds)
	
	var soldier2_filenames = ["Dominated_Im_still_your_friend.mp3", 
		"Get_a_haircut_hippie.mp3", 
		"Grunt.mp3", 
		"If_you_kow_whats_good_for_you.mp3", 
		"I_joined_this_team_just_to.mp3", 
		"I_Never_liked_you.mp3", 
		"Scientists_in_the_future.mp3", 
		"Take_your_lumps_like_a_man.mp3", 
		"This_is_my_world.mp3", 
		"Tonight_your_ass_will_be_visited.mp3", 
		"You_are_all_weak.mp3", 
		"You_are_the_worst_roommate.mp3"
		]
	for file in soldier2_filenames:
		soldier2_sounds.append(load("res://audio/1_soldier/2_angry/" + file))
#	print("soldier2 sounds: ", soldier2_sounds)
	
	var pyro0_filenames = ["Pyro_activatecharge01-converted.mp3", 
		"Pyro_angry-converted.mp3", 
		"Pyro_autoonfire02-converted.mp3", 
		"Pyro_battlecry02-converted.mp3", 
		"Pyro_cloakedspyidentify01-converted.mp3", 
		"Pyro_helpmecapture01-converted.mp3", 
		"Pyro_helpmedefend01-converted.mp3", 
		"Pyro_sf13_spell_generic04-converted.mp3", 
		"Pyro_sf13_spell_generic07-converted.mp3", 
		"Pyro_specialcompleted01-converted.mp3", 
		"Pyro_taunts02-converted.mp3", 
		"Pyro_taunts03-converted.mp3"
		]
	for file in pyro0_filenames:
		pyro0_sounds.append(load("res://audio/2_pyro/0_neutral/" + file))
#	print("pyro0 sounds: ", pyro0_sounds)
	
	var pyro1_filenames = ["Cm_pyro_pregamewonlast_01.mp3", 
		"Pyro_autocappedcontrolpoint01-converted.mp3", 
		"Pyro_cheers01-converted.mp3", 
		"Pyro_laughhappy01-converted.mp3", 
		"Pyro_laughlong01-converted.mp3", 
		"Pyro_mmmmrrrrrrmmmpghhhhh-converted.mp3", 
		"Pyro_sf13_influx_big01-converted.mp3", 
		"Pyro_sf13_influx_small01-converted.mp3", 
		"Pyro_thanks-converted.mp3", 
		"Pyro_thanksfortheheal01-converted.mp3", 
		"Pyro_thanksfortheteleporter01-converted.mp3"
		]
	for file in pyro1_filenames:
		pyro1_sounds.append(load("res://audio/2_pyro/1_happy/" + file))
#	print("pyro1 sounds: ", pyro1_sounds)
	
	var pyro2_filenames = ["Cm_pyro_pregamelostlast_01.mp3", 
		"Cm_pyro_pregamelostlast_02.mp3", 
		"Cm_pyro_pregamelostlast_03.mp3", 
		"Pyro_autocappedintelligence01-converted.mp3", 
		"Pyro_autodejectedtie01-converted.mp3", 
		"Pyro_negativevocalization01.mp3", 
		"Pyro_standonthepoint01-converted.mp3", 
		"Pyro_taunts04-converted.mp3"
		]
	for file in pyro2_filenames:
		pyro2_sounds.append(load("res://audio/2_pyro/2_angry/" + file))
#	print("pyro2 sounds: ", pyro2_sounds)
	
	var demo0_filenames = ["Demoman_gibberish08-converted.mp3", 
		"Eey_me_bottle_of_scrumpy.mp3", 
		"Freedom.mp3", 
		"Freedom_for_unicorns.mp3", 
		"Guts_and_glory_lads.mp3", 
		"Its_on_its_on_like.mp3", 
		"Lets_do_it.mp3", 
		"Oh_whats_your_name.mp3", 
		"Scottish_thing.mp3", 
		"This_team_needs_all_demo.mp3"
		]
	for file in demo0_filenames:
		demo0_sounds.append(load("res://audio/3_demo/0_neutral/" + file))
#	print("demo0 sounds: ", demo0_sounds)
	
	var demo1_filenames = ["Bottles_up_lads.mp3", 
		"Cheers_mate.mp3", 
		"gibberish_I_love_you.mp3", 
		"Hahaha_absolutely.mp3", 
		"Ha_ha_ha_Im_a_drunk.mp3", 
		"Now_thats_quality.mp3", 
		"Oh_briliant.mp3", 
		"Oh_thats_nice.mp3", 
		"Thanks_lad.mp3", 
		"We_did_it_mate.mp3", 
		"woooo_ha_ha_ha.mp3"
		]
	for file in demo1_filenames:
		demo1_sounds.append(load("res://audio/3_demo/1_happy/" + file))
#	print("demo1 sounds: ", demo1_sounds)
	
	var demo2_filenames = ["Aw_cripe.mp3", 
		"Everybody_I_dont_like_this_man.mp3", 
		"If_you_were_hunting_trouble.mp3", 
		"Im_drunk_you_dont_have.mp3", 
		"Let_that_be_a_bloody.mp3", 
		"Och.mp3", 
		"Oh_thats_not_good.mp3", 
		"Youre_like_a_little_bunyy.mp3", 
		"Youre_making_me_very_cross.mp3"
		]
	for file in demo2_filenames:
		demo2_sounds.append(load("res://audio/3_demo/2_angry/" + file))
#	print("demo2 sounds: ", demo2_sounds)
	
	var heavy0_filenames = ["Bring_me_metal_men_.mp3", 
		"Da.mp3", 
		"Here_I_come.mp3", 
		"In_russia_if_hand_is_rotten_.mp3", 
		"It_is_good_day_to_be_giant_man.mp3", 
		"I_am_big_war_hero.mp3", 
		"I_would_be_worried_.mp3", 
		"Sandvich_and_me.mp3", 
		"Sandvich_make_me_strong.mp3", 
		"Singing_Volga.mp3", 
		"This_is_fine.mp3", 
		"Ugh_heavy_feel_funny.mp3"
		]
	for file in heavy0_filenames:
		heavy0_sounds.append(load("res://audio/4_heavy/0_neutral/" + file))
#	print("heavy0 sounds: ", heavy0_sounds)
	
	var heavy1_filenames = ["In_barrel_of_turnips.mp3", 
		"Is_good.mp3", 
		"Laughing.mp3", 
		"Laughter.mp3", 
		"Laugh_that_slaps_me.mp3", 
		"Sandvich_for_everyone.mp3", 
		"Team_I_believe_in_all.mp3", 
		"Very_good.mp3", 
		"Very_good_very_very_good.mp3", 
		"Very_nice.mp3", 
		"We_make_good_team.mp3", 
		"You_are_best_of_best.mp3", 
		"You_make_heavy_proud.mp3"
		]
	for file in heavy1_filenames:
		heavy1_sounds.append(load("res://audio/4_heavy/1_happy/" + file))
#	print("heavy1 sounds: ", heavy1_sounds)
	
	var heavy2_filenames = ["I_am_going_to_kill_you_and.mp3", 
		"Let_us_fight_man_vs_tiny.mp3", 
		"Run_home_to_mama.mp3", 
		"You_are_not_so_good.mp3", 
		"You_are_no_match_for_me.mp3", 
		"You_feel_shame_yeh.mp3"
		]
	for file in heavy2_filenames:
		heavy2_sounds.append(load("res://audio/4_heavy/2_angry/" + file))
#	print("heavy2 sounds: ", heavy2_sounds)
	
	var engi0_filenames = ["Another_satisfied_customer.mp3", 
		"Get_along_there.mp3", 
		"Good_night_Irene.mp3", 
		"Hoo_wee_will_you_look_at_that.mp3", 
		"Move_em_out.mp3", 
		"Now_I've_seen_everything.mp3", 
		"Shucks_I_was_just.mp3", 
		"Sometimes_you_need_a_little_less.mp3", 
		"That_there_was_a_fine.mp3", 
		"These_fellas_are_gonna_be.mp3", 
		"You_and_me_hoss.mp3"
		]
	for file in engi0_filenames:
		engi0_sounds.append(load("res://audio/5_engi/0_neutral/" + file))
#	print("engi0 sounds: ", engi0_sounds)
	
	var engi1_filenames = [ "Hee_yee_haw.mp3", 
		"Job_well_done.mp3", 
		"Much_obliged_partner.mp3", 
		"Nice_going_partner.mp3", 
		"Nice_work_partner.mp3", 
		"Thanks_mister.mp3", 
		"Well_done+partner.mp3", 
		"We_got_it.mp3", 
		"Woooo-we.mp3", 
		"Yeeeee-haw.mp3"
		]
	for file in engi1_filenames:
		engi1_sounds.append(load("res://audio/5_engi/1_happy/" + file))
#	print("engi1 sounds: ", engi1_sounds)
	
	var engi2_filenames = ["And_another_thing_youre.mp3", 
		"Erectin_a_statue_of.mp3", 
		"Oy_you_yellow_bellied.mp3", 
		"Start_prayin_boy.mp3", 
		"Thatll_cut_you_back.mp3", 
		"That_there_is_just_a_sad.mp3", 
		"Why_dont_you_get_along.mp3", 
		"Youre_all_hard_hat_.mp3", 
		"You_are_a_coward_and_a_scoundrel.mp3", 
		"You_done_incurred_my_.mp3"
		]
	for file in engi2_filenames:
		engi2_sounds.append(load("res://audio/5_engi/2_angry/" + file))
#	print("engi2 sounds: ", engi2_sounds)
	
	var medic0_filenames = ["Evil_laugh.mp3", 
		"Good_to_go.mp3", 
		"I_am_charged.mp3", 
		"I_am_prepared_to_do_.mp3", 
		"I_am_ze_uber_mensch.mp3", 
		"Laughing.mp3", 
		"Ooh_this_is_exciting.mp3", 
		"Polydor.mp3", 
		"The_healing_is_not_as_.mp3", 
		"Very_nice.mp3", 
		"We_are_invincible.mp3", 
		"Who_is_not_ready.mp3", 
		"Ya.mp3", 
		"Yavol.mp3"
		]
	for file in medic0_filenames:
		medic0_sounds.append(load("res://audio/6_medic/0_neutral/" + file))
#	print("medic0 sounds: ", medic0_sounds)
	
	var medic1_filenames = ["Can_you_feel_ze_sc_.mp3", 
		"Danke_comerade.mp3", 
		"I_feel_like_a_million_.mp3", 
		"Laugh.mp3", 
		"Laugh2.mp3", 
		"Oh_heavens_yes.mp3", 
		"Oh_wonderbar.mp3", 
		"Oktoberfest.mp3", 
		"Ooh_very_nice.mp3", 
		"Well_done.mp3"
		]
	for file in medic1_filenames:
		medic1_sounds.append(load("res://audio/6_medic/1_happy/" + file))
#	print("medic1 sounds: ", medic1_sounds)
	
	var medic2_filenames = ["Does_that_sting_sorry.mp3", 
		"Dunkpopfs.mp3", 
		"I_have_a_bird_head.mp3", 
		"Ooh_this_is_not_good.mp3", 
		"Why.mp3", 
		"Would_you_like_a_.mp3", 
		"You_are_stupid.mp3", 
		"You_are_trying_my_patience.mp3"
		]
	for file in medic2_filenames:
		medic2_sounds.append(load("res://audio/6_medic/2_angry/" + file))
#	print("medic2 sounds: ", medic2_sounds)
	
	var sniper0_filenames = ["All_in_a_days_work.mp3", 
		"Bombs_away.mp3", 
		"God_save_the_queen.mp3", 
		"Good_day.mp3", 
		"groan.mp3", 
		"Im_a_dinkum_aussie.mp3", 
		"I_love_this_job_.mp3", 
		"Lets_get_to_work.mp3", 
		"Lets_give_em_hell_lads.mp3", 
		"Lets_have_a_go_.mp3", 
		"No_worries.mp3", 
		"No_worries_the_.mp3", 
		"This_team_just_got_.mp3", 
		"Well_happy_austraila_day.mp3"
		]
	for file in sniper0_filenames:
		sniper0_sounds.append(load("res://audio/7_sniper/0_neutral/" + file))
#	print("sniper0 sounds: ", sniper0_sounds)
	
	var sniper1_filenames = ["Aw_thats_apples_mate.mp3", 
		"Cheers_mate.mp3", 
		"Good_on_ya.mp3", 
		"Good_work_lads.mp3", 
		"Laughing.mp3", 
		"laughing_aces.mp3", 
		"Now_that_is_how_its_done.mp3"
		]
	for file in sniper1_filenames:
		sniper1_sounds.append(load("res://audio/7_sniper/1_happy/" + file))
#	print("sniper1 sounds: ", sniper1_sounds)
	
	var sniper2_filenames = ["Ah_piss.mp3", 
		"Aw_lend_us_a_shovel.mp3", 
		"Bloody_hell_youre_awful.mp3", 
		"Bloody_piker.mp3", 
		"Crikey.mp3", 
		"Go_to_hell_wanker.mp3", 
		"Piece_of_piss.mp3", 
		"Piss_off_big_head.mp3", 
		"Spit.mp3", 
		"This_is_gonna_be_a_.mp3", 
		"You_are_a_bloody_disgrace.mp3", 
		"You_shouldnt_even_gotten_.mp3"
		]
	for file in sniper2_filenames:
		sniper2_sounds.append(load("res://audio/7_sniper/2_angry/" + file))
#	print("sniper2 sounds: ", sniper2_sounds)
	
	var spy0_filenames = ["And_when_the_spy_saw_.mp3", 
		"As_long_as_nothing_super_.mp3", 
		"Death_is_but_.mp3", 
		"Finally_youve_come_to.mp3", 
		"Gentlemen.mp3", 
		"If_there_are_any_unicorns_.mp3", 
		"I_am_uncorking_a_bottle_of_.mp3", 
		"Jealous.mp3", 
		"Our_influence_grows.mp3", 
		"Spy_you_are_as_unkillable_.mp3", 
		"Today_we_will_emerge_.mp3", 
		"Was_there_ever_any_doubt.mp3"
		]
	for file in spy0_filenames:
		spy0_sounds.append(load("res://audio/8_spy/0_neutral/" + file))
#	print("spy0 sounds: ", spy0_sounds)
	
	var spy1_filenames = ["Cheers.mp3", 
		"Excellent.mp3", 
		"First_rate.mp3", 
		"Magnificent.mp3", 
		"My_appreciation_amigo.mp3", 
		"My_pleasure.mp3", 
		"Thank_you_for_.mp3", 
		"Thank_you_my_friend.mp3", 
		"Top_shelf.mp3", 
		"Yes_my_friend.mp3"
		]
	for file in spy1_filenames:
		spy1_sounds.append(load("res://audio/8_spy/1_happy/" + file))
#	print("spy1 sounds: ", spy1_sounds)
	
	var spy2_filenames = ["Aw_merde.mp3", 
		"Aw_merde_2.mp3", 
		"Giddyup_now_to_hell.mp3", 
		"Hello_again_dumbbell.mp3", 
		"Im_looking_at_your_xray.mp3", 
		"Kaboom_to_you_sir.mp3", 
		"laugh_how_do_you_like_the.mp3", 
		"Promise_not_to_bleed.mp3", 
		"Sacre_bleu.mp3", 
		"This_was_a_disappointment.mp3", 
		"You_disgust_me.mp3", 
		"You_suck.mp3"
		]
	for file in spy2_filenames:
		spy2_sounds.append(load("res://audio/8_spy/2_angry/" + file))
#	print("spy2 sounds: ", spy2_sounds)

func _ready():
	preload_sounds_mercs()
	mood = 0
	game_state = "start_menu"

